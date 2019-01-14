from django.shortcuts import render, redirect
from django.contrib import messages
from django.contrib.auth import (
    authenticate,
    login as user_login,
    logout as user_logout )
# from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from .forms import UserRegisterForm, UserLoginForm
from mysite.csv_import import upload_files

# Create your views here.

@login_required
def index(request):
    context = {
        'name': 'Alex Rogers',
        'banks': ['Wells Fargo', 'Discover', 'Capital One', 'Bank of America']
    }

    return render(request, 'users/user_profile.html', context)
    # return render(request, 'users/dummy.html')

def login(request):
    # if User.is_authenticated:
    #     return redirect('users:main_profile')

    if request.method == 'POST':
        form = UserLoginForm(User, request.POST)

        if form.is_valid():
            form.clean()
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            user = authenticate(request, username=username, password=password)
            user_login(request, user)
            return redirect('users:main_profile')
    else:
        form = UserLoginForm()
    context = {
        'css_file': 'users/stylelogin.css',
        'form': form
    }

    return render(request, 'users/login.html', context)

def logout(request):
    user_logout(request)
    return redirect('login')

def register(request):
    # if User.is_authenticated:
    #     messages.warning(request, f'You are already logged in. Redirected to profile')
    #     return redirect('users:main_profile')

    if request.method == 'POST':
        form = UserRegisterForm(request.POST)
        form.save() # Also hashes password for security
        if form.is_valid():
            username = form.cleaned_data.get('username')
            pk = form.cleaned_data.get('pk')
            print(pk)
            # upload_files(['Discover'], pk)
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

@login_required
def edit_profile(request):
    context = {
        'css_file': 'users/edit_profile.css',
        'banks': ['Wells Fargo', 'Discover', 'Capital One', 'Bank of America']
    }
    # return render(request, 'users/dummy.html')
    return render(request, 'users/edit_profile.html', context)

@login_required
def upload(request):
    context = {
        'css_file': 'users/styleUpload.css',
    }

    return render(request, 'users/upload.html', context)

@login_required
def run_csv_upload(request):
    the_user = request.user.pk
    print(the_user)
    upload_files(['Discover'], the_user)
    return redirect('expenses:expense-summary')
