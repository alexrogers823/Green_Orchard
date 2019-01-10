from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth import (
    authenticate,
    login as user_login,
    logout as user_logout )
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User
from .forms import UserRegisterForm

# Create your views here.
def index(request):
    context = {
        'name': 'Alex Rogers',
        'banks': ['Wells Fargo', 'Discover', 'Capital One', 'Bank of America']
    }
    return render(request, 'users/user_profile.html', context)
    # return render(request, 'users/dummy.html')

def login(request):
    if request.method == 'POST':
        form = AuthenticationForm(User, request.POST)

        if form.is_valid():
            form.clean()
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(request, username=username, password=password)
            user_login(request, user)
            return redirect('users:main_profile')
    else:
        form = AuthenticationForm()
    context = {
        'css_file': 'users/stylelogin.css',
        'form': form
    }

    return render(request, 'users/login.html', context)

def logout(request):
    user_logout(request)
    return redirect('login')

def register(request):
    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        form.save() # Also hashes password for security
        if form.is_valid():
            username = form.cleaned_data.get('username')
            messages.success(request, f'{username} has successfully registered!')
            return redirect('users:main_profile')
    else:
        form = UserRegisterForm()
    context = {
        'css_file': 'users/styleregister.css',
        'title': 'Register',
        'form': form,
    }
    # return render(request, 'users/dummy.html')
    return render(request, 'users/register.html', context)

def edit_profile(request):
    context = {
        'css_file': 'users/edit_profile.css',
    }
    return render(request, 'users/dummy.html')
    # return render(request, 'users/edit_profile.html', context)
