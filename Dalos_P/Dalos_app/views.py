from django.shortcuts import render, redirect
from django.http import HttpResponse

from django.contrib.auth import authenticate, login, logout
from django.contrib import messages

from django.db import connection
from .models import UsuarioNuevo

from . import forms, models
from .forms import CustomLoginForm, TransferenciaForm


def principal(request):
    return render(request, 'Dalos_app/principal.html')

def index(request):
    return render(request, "Dalos_app/index.html")

def nosotros(request):
    return render(request, "Dalos_app/nosotros.html")

def login_view(request):
    if request.method == 'POST':
        print(request.POST)
        form = CustomLoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['nombre_usuario']
            password = form.cleaned_data['contraseña']

            cursor = connection.cursor()
            query = "SELECT * FROM dalos_app_usuarionuevo WHERE nombre_usuario=%s AND contraseña=%s"
            cursor.execute(query, (username, password))

            user = cursor.fetchone()
            
            
            if user:
                print(user)
                request.session['user_id'] = user[2]  
                request.session['nombre_usuario'] = user[5]  
                return redirect('principal')
            else:
                messages.error(request, "Nombre de usuario o contraseña incorrectos.")
        else:
            print(form.errors)
            messages.error(request, "Formulario no válido.")
    else:
        form = CustomLoginForm()
    
    ctx = {'form': form}
    return render(request, 'Dalos_app/login.html', ctx)

def register(request):
    if request.method == 'POST':
        form = forms.UsuarioForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Usuario registrado exitosamente. ¡Ahora puedes iniciar sesión!")
            return redirect('login') 
    else:
        form = forms.UsuarioForm()
    
    return render(request, "Dalos_app/register.html", {'form': form})

def logout_view(request):
    logout(request)
    return redirect('login')

def bdd(request):
    cursor = connection.cursor()
    query = "SELECT nombre, apellido, nombre_usuario, contraseña, monto FROM dalos_app_usuarionuevo ORDER BY monto DESC"
    cursor.execute(query)

    html = """
        <html>
        <head>
            <title>Lista de usuarios basica</title>
        </head>
        <body>
            <table style="border: 1px solid">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Usuario</th>
                        <th>Contraseña</th>
                        <th>Monto</th>
                    </tr>
                </thead>
                <tbody>
    """
   
    # Obtener los resultados
    for (Nombre, Apellido, nombre_usuario, contraseña, monto) in cursor.fetchall():
        html += f"""
            <tr>
                <td>{Nombre}</td>
                <td>{Apellido}</td>
                <td>{nombre_usuario}</td>
                <td>{contraseña}</td>
                <td>{monto}</td>
            </tr>
        """
    
    html += """
                </tbody>
                       </table>
                </body>
          </html>
    """
    
    cursor.close()  # Cerrar el cursor
    return HttpResponse(html)

def principal(request):
    if 'user_id' in request.session:
        user_id = request.session['user_id']
        
        with connection.cursor() as cursor:
            query = "SELECT nombre, apellido, nombre_usuario, monto FROM dalos_app_usuarionuevo WHERE dni = %s"
            cursor.execute(query, [user_id])
            usuario = cursor.fetchone()

        if usuario:
            nombre, apellido, nombre_usuario, monto = usuario
            
            ctx = {
                'nombre': nombre,
                'apellido': apellido,
                'nombre_usuario': nombre_usuario,
                'monto': monto,
            }
            return render(request, 'Dalos_app/principal.html', ctx)
        else:
            return redirect('login')
    else:
        return redirect('login')



def transferencia_view(request):
    if 'user_id' not in request.session:
        return redirect('login')
    
    remitente_dni = request.session['user_id']

    # Saldo del que envia
    remitente = UsuarioNuevo.objects.get(dni=remitente_dni)
    saldo_remitente = remitente.monto

    if request.method == 'POST':
        form = TransferenciaForm(request.POST)
        if form.is_valid():
            destinatario_nombre = form.cleaned_data['destinatario']
            monto = form.cleaned_data['monto']

            # DNI del que recibirà
            try:
                destinatario = UsuarioNuevo.objects.get(nombre_usuario=destinatario_nombre)
                destinatario_dni = destinatario.dni
            except UsuarioNuevo.DoesNotExist:
                form.add_error('destinatario', 'El usuario destinatario no existe.')
                return render(request, 'Dalos_app/transferencia.html', {'form': form})

            if saldo_remitente >= monto:
                # Actualizaciòn de Saldos:
                remitente.monto -= monto / 1
                destinatario.monto += monto / 1
                remitente.save()
                destinatario.save()

                with connection.cursor() as cursor:
                    cursor.execute("INSERT INTO Transferencia (remitente_dni, destinatario_dni, monto) VALUES (%s, %s, %s)",
                                   [remitente_dni, destinatario_dni, monto])

                return redirect('transferencia_exitosa')
            else:
                form.add_error(None, 'Saldo insuficiente')
    else:
        form = TransferenciaForm()

    return render(request, 'Dalos_app/transferencia.html', {'form': form})
    def monto(request):
      forms.TransferenciaForm.clean_monto
      return render(request, 'Dalos_app/transferencia.html', {'form': form})
     
  

def transferencia_exitosa(request):
    return render(request, 'Dalos_app/transferencia_exitosa.html')

def ingresar(request):
    return render(request, 'Dalos_app/ingresar.html')

def sacar(request):
    return render(request, 'Dalos_app/sacar.html')
