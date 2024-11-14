from django.shortcuts import render, redirect
from django.http import HttpResponse

from django.contrib.auth import authenticate, login as auth_login, logout
from django.contrib import messages

from django.db import connection

from . import forms, models
from .forms import CustomLoginForm


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

            user = cursor.fetchone()  # Cambiado a fetchone() para obtener solo un usuario

            if user:
                print(user)
                # Almacenar solo el ID y el nombre de usuario en la sesión
                request.session['user_id'] = user[2]  # Suponiendo que el ID de usuario está en el índice 0
                request.session['nombre_usuario'] = user[5]  # Suponiendo que el nombre de usuario está en el índice 5
                return redirect('principal')
            else:
                messages.error(request, "Nombre de usuario o contraseña incorrectos.")
        else:
            print(form.errors)  # Imprime los errores de validación
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
    query = "SELECT nombre, apellido, nombre_usuario, contraseña, monto FROM dalos_app_usuarionuevo"
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
    # Verifica si el usuario está autenticado
    if 'user_id' in request.session:
        user_id = request.session['user_id']
        
        # Realiza una consulta SQL para obtener los datos del usuario
        with connection.cursor() as cursor:
            query = "SELECT nombre, apellido, nombre_usuario, monto FROM dalos_app_usuarionuevo WHERE dni = %s"
            cursor.execute(query, [user_id])
            usuario = cursor.fetchone()  # Obtiene el primer resultado

        if usuario:
            # Descompón la tupla en variables
            nombre, apellido, nombre_usuario, monto = usuario
            
            # Pasa los datos del usuario al contexto
            ctx = {
                'nombre': nombre,
                'apellido': apellido,
                'nombre_usuario': nombre_usuario,
                'monto': monto,
            }
            return render(request, 'Dalos_app/principal.html', ctx)
        else:
            # Si no se encuentra el usuario, redirigir a la página de inicio de sesión o mostrar un error
            return redirect('login')
    else:
        # Si no hay usuario en la sesión, redirigir a la página de inicio de sesión
        return redirect('login')

def transferencia(request):
    print(f"Usuario autenticado: {request.user.is_authenticated}")
    print(f"Nombre de usuario: {request.user.username if request.user.is_authenticated else 'No autenticado'}")
    if request.method == 'POST':
        form = forms.TransferenciaForm(request.POST)
        if form.is_valid():
            monto = form.cleaned_data['monto']
            destinatario_nombre_usuario = form.cleaned_data['destinatario']
            remitente = request.user
            remitente = request.user
            print(f"Nombre de usuario del remitente: {remitente.username}")

            # Verificar que el remitente tenga suficiente saldo
            with connection.cursor() as cursor:
                cursor.execute("SELECT monto FROM dalos_app_usuarionuevo WHERE nombre_usuario = %s", [remitente.username])
                saldo_remitente = cursor.fetchone()
                print(f"Saldo del remitente: {saldo_remitente[0] if saldo_remitente else 'No encontrado'}")

                if saldo_remitente is None or saldo_remitente[0] < monto:
                    messages.error(request, "No tienes saldo suficiente para realizar esta transferencia.")
                    return redirect('transferencia')

                # Obtener el destinatario
                cursor.execute("SELECT id, monto FROM dalos_app_usuarionuevo WHERE nombre_usuario = %s", [destinatario_nombre_usuario])
                destinatario = cursor.fetchone()

                if destinatario is None:
                    messages.error(request, "El alias introducido no se encontró.")
                    return redirect('transferencia')

                nuevo_saldo_remitente = saldo_remitente[0] - monto
                nuevo_saldo_destinatario = destinatario[1] + monto

                # Actualizar los saldos en la base de datos
                actu_query = "UPDATE dalos_app_usuarionuevo SET monto = %s WHERE nombre_usuario = %s"
                cursor.execute(actu_query, (nuevo_saldo_remitente, remitente.username))                    

                actu_query2 = "UPDATE dalos_app_usuarionuevo SET monto = %s WHERE id = %s"
                cursor.execute(actu_query2, (nuevo_saldo_destinatario, destinatario[0]))

                messages.success(request, f"Transferencia de ${monto} realizada con éxito a {destinatario_nombre_usuario}.")
                return redirect('principal')  # Redirigir a la página principal u otra página deseada

    else:
        form = forms.TransferenciaForm()

    return render(request, 'Dalos_app/transferencia.html', {'form': form})