from random import randint, choice
from django.shortcuts import render
from django.http import HttpResponse
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.auth.decorators import login_required
from django.views.generic import (
    ListView, DetailView, CreateView, UpdateView, DeleteView)
from .models import Expenses
from mysite import csv_import
# from django.template import loader

# Create your views here.

def index(request):
    return HttpResponse("This is the expenses index")

@login_required
def summary(request):
    context = {
        'css_file': 'expenses/summary.css',
        'name': 'George',
    }
    return render(request, 'expenses/summary.html', context)

@login_required
def month(request):
    month_names = ['January', 'February', 'March', 'April',
                    'May', 'June', 'July', 'August',
                    'September', 'October', 'November', 'December']
    context = {
        # 'css_file': 'expenses/month.css',
        'month': choice(month_names),
        # 'expenses': ['Stats Class', 'Rent', 'Clothing'],
        'expenses': Expenses.objects.all(),
        'total': randint(100, 1000),
    }
    return render(request, 'expenses/month.html', context)

@login_required
def category(request):
    context = {
        'css_file': 'expenses/category.css',
    }
    # return render(request, 'expenses/dummy.html')
    return render(request, 'expenses/category.html', context)
