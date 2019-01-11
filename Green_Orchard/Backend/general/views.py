from django.shortcuts import render
from random import sample

# Create your views here.
def index(request):
    quotes_array = [
        "\"Green Orchard helped me keep track of my funds like never before. The site makes it easy to visualize where my money is going. Give it a try!\" - Barack Obama",
        "\"I love Green Orchard!\" - Kylie Jenner",
        "\"Truly an innovative app. It has never been easier to see how I spend my money. Thanks Green Orchard!\" -Warren Buffett",
        "\"The charts used in Green Orchard are a really cool way to visualize my expenditures. I can even sort by categories!\" -Trey Young",
        "\"After trying Green Orchard, I don't want to use any other financial tracking apps!\" -Jeff Bezos",
        "\"As a developer, I love seeing the variety of technologies employed by Green Orchard to make their app smooth, functional, and genuinely useful.\" -Dan Abramov",
        "\"This app is a game-changer!\" -Mindy Kaling",
        "\"I can keep track of my expenses more easily than ever before thanks to Green Orchard.\" -Julio Jones",
        "\"The Green Orchard team did a great job putting this together!\", -Chris 'Radishmouse' Aquino"
    ]

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
    }
    # return HttpResponse("This is the faq part")
    # return render(request, 'expenses/dummy.html')
    return render(request, 'general/faq.html', context)
