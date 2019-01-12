from django.shortcuts import render
from random import sample
from .supplemental_info import quotes_array, faq_content

# Create your views here.
def index(request):
    context = {
        'css_file': 'general/index.css',
        'quotes': sample(quotes_array, 2)
    }
    return render(request, 'general/index.html', context)

def about_us(request):
    context = {
        'css_file': 'general/about_us.css',
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
