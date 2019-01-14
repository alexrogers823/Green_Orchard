from django.shortcuts import render, redirect
from random import sample
from .supplemental_info import quotes_array, faq_content, dev_info
from django.contrib.auth import (
    authenticate,
    login as user_login,
    )
from django.contrib.auth.models import User
from users.forms import UserLoginForm

# Create your views here.
def index(request):
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
        'css_file': 'general/index.css',
        'quotes': sample(quotes_array, 2),
        'form': form,
    }
    return render(request, 'general/index.html', context)

def about_us(request):
    context = {
        'css_file': 'general/about_us.css',
        'dev_info': dev_info,
    }
    return render(request, 'general/about_us.html', context)

def faq(request):
    context = {
        'css_file': 'general/faq.css',
        'faq_content': faq_content
    }
    # return HttpResponse("This is the faq part")
    # return render(request, 'expenses/dummy.html')
    return render(request, 'general/faq.html', context)
