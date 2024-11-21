from django.urls import path
from . import views 
from .views import login_view
from .views import logout_view


urlpatterns = [
    path('', views.index, name='index'),
    path('index/', views.index, name='index'),
    path('nosotros/', views.nosotros, name='nosotros'),

    path('login/', views.login_view, name='login'),
    path('logout/', logout_view, name='logout'),
    path('register/', views.register, name='register'),
    path('bdd/', views.bdd, name='bdd'),
    
    path('principal/', views.principal, name='principal'),
    path('transferencia/', views.transferencia_view, name='transferencia'),
    path('transferencia_exitosa/', views.transferencia_exitosa, name='transferencia_exitosa'),
    path('ingresar/', views.ingresar, name='ingresar'),
    path('sacar/', views.sacar, name='sacar')
]
