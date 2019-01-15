from django.urls import path
from . import views
from .views import Month

app_name = 'expenses'
urlpatterns = [
    path('', views.index, name='index'),
    # path('month/', views.month, name='month'), # Change month to 201801
    path('month/', Month.as_view(), name='month'),
    path('summary/', views.summary, name='expense-summary'),
    path('category/', views.category, name='category'),
]
