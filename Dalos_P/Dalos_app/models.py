from django.db import models

class UsuarioNuevo(models.Model):
    nombre = models.CharField(max_length=100, blank=False)
    apellido = models.CharField(max_length=100, blank=False)
    dni = models.CharField(max_length=10, blank=False, primary_key=True)
    fecha_nacimiento = models.DateField(blank=False)
    correo_electronico = models.EmailField(blank=False)
    nombre_usuario = models.CharField(max_length=100, blank=False, unique=True)
    contraseña = models.CharField(max_length=100, blank=False)  # Cambiar a CharField para las contraseñas
    monto = models.DecimalField(max_digits=10, decimal_places=2, blank=False, default=1000.00)

class LoginUsuario(models.Model):
    nombre_usuario = models.ForeignKey(UsuarioNuevo, on_delete=models.CASCADE, related_name='nombre_usuario_login')
    contraseña = models.ForeignKey(UsuarioNuevo, on_delete=models.CASCADE, related_name='contraseña_login')