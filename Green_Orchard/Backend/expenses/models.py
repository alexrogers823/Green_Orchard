import uuid
from django.db import models
from django.utils import timezone
from django.contrib.auth.models import User

# Create your models here.
class Expenses(models.Model):
    name = models.CharField(max_length=100)
    amount = models.DecimalField(max_digits=7, decimal_places=2)
    # month = just month here
    # year = just month here
    date_posted = models.DateTimeField(default=timezone.now)
    last_updated = models.DateTimeField(auto_now=True)
    category = models.ForeignKey('Categories', on_delete=models.SET_NULL, null=True)
    bank_id = models.ForeignKey('Banks', on_delete=models.SET_NULL, null=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class Banks(models.Model):
    name = models.CharField(max_length=100)
    abbr = models.CharField(max_length=100)


class Categories(models.Model):
    category = models.CharField(max_length=100)


# For expense nicknames, it has to reference the expense's id,
# and also update the nickname based on user input

# class Expense_Nicknames(model.Model):
#     nickname = models.CharField(max_length=100)
#     original_expense = models.ForeignKey('Expenses', on_delete=models.CASCADE)
