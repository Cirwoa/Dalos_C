from django.contrib import admin
from django.urls import path, include

urlpatterns = [
   path('admin/',admin.site.urls),
   path('Dalos/', include('Dalos_app.urls')) 
]
