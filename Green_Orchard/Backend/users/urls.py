from django.urls import path
from . import views

app_name = 'users'
urlpatterns = [
    path('', views.index, name='main_profile'),
    path('edit/', views.edit_profile, name='edit_profile'), # Change month to 201801
    path('upload/', views.upload, name='upload'),
    path('csv/', views.run_csv_upload, name='csv_upload')
]
