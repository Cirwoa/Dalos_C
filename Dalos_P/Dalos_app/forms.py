from django import forms
from .models import UsuarioNuevo


class UsuarioForm(forms.ModelForm):
    class Meta:
        model = UsuarioNuevo
        fields = [
            'nombre',
            'apellido',
            'dni',
            'fecha_nacimiento',
            'correo_electronico',
            'nombre_usuario',
            'contraseña'  # Usamos el nombre del campo que hemos definido
        ]
        
class CustomLoginForm(forms.Form):
    nombre_usuario = forms.CharField(max_length=100)
    contraseña = forms.CharField(widget=forms.PasswordInput)

class TransferenciaForm(forms.Form):
    destinatario = forms.CharField(label="Alias del destinatario", max_length=100)
    monto = forms.DecimalField(label="Monto a transferir", max_digits=10, decimal_places=2)

    def clean_destinatario(self):
        nombre_usuario = self.cleaned_data['destinatario']
        if not UsuarioNuevo.objects.filter(nombre_usuario=nombre_usuario).exists():
            raise forms.ValidationError("El usuario destinatario no existe.")
        return nombre_usuario

    def clean_monto(self):
        monto = self.cleaned_data['monto']
        if monto <= 0:
            raise forms.ValidationError("El monto debe ser mayor a cero.")
        return monto