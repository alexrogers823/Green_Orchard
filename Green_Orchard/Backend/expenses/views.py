from random import randint, choice
from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin
from django.contrib.auth.decorators import login_required
from django.views.generic import (
    ListView, DetailView, CreateView, UpdateView, DeleteView)
from django.db.models import Sum
from .models import Expenses
from .serializers import ExpensesSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
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
        'top_5_exp': Expenses.objects.all().order_by('-amount')[:5],
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
        'expenses': Expenses.objects.all().order_by('date_posted'),
        'highest_expenses': Expenses.objects.all().order_by('-amount')[:3],
        # 'total': randint(100, 1000),
        # 'total': serializers.serialize('json', Expenses.objects.aggregate(Sum('amount'))),
    }
    # return render(request, 'expenses/month.html', context)
    return HttpResponse(json.dumps(context), content_type='application/json')

# class Month(DetailView):
#     model = Expenses
#     template_name = 'expenses/month.html'
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         context['expenses'] = model.objects.filter(month='<str:month>').order_by('date_posted')
#         context['highest_expenses'] = model.objects.filter(month='<str:month>').order_by('-amount')[:3]
#         context['total'] = model.objects.filter(month='<str:month>').aggregate(Sum('amount'))
#         return context

class Summary(APIView):
    def get(self, request):
        context = {
            'expenses': ExpensesSerializer(Expenses.objects.all().order_by('date_posted'), many=True).data
        }

        return Response(context)

class Month(APIView):
    def get(self, request):
        month_names = ['January', 'February', 'March', 'April',
                        'May', 'June', 'July', 'August',
                        'September', 'October', 'November', 'December']
        context = {
            # 'css_file': 'expenses/month.css',
            # 'month': choice(month_names),
            # 'expenses': ['Stats Class', 'Rent', 'Clothing'],
            'expenses': ExpensesSerializer(Expenses.objects.all().order_by('date_posted'), many=True).data,
            'highest_expenses': ExpensesSerializer(Expenses.objects.all().order_by('-amount')[:3], many=True).data,
            # 'total': randint(100, 1000),
            'total': Expenses.objects.aggregate(Sum('amount')),
        }
        # return Response(ExpensesSerializer(Expenses.objects.all().order_by('date_posted'), many=True).data)
        return Response(context)


@login_required
def category(request):
    context = {
        'css_file': 'expenses/category.css',
    }
    # return render(request, 'expenses/dummy.html')
    return render(request, 'expenses/category.html', context)
