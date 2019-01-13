from django import forms
# from django.contrib.auth import LoginView
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm


class UserRegisterForm(UserCreationForm):
    email = forms.EmailField(widget=forms.TextInput(attrs={'placeholder': 'Email'})) # default: required = True

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name in self.fields:
            field = self.fields.get(field_name)
            self.fields[field_name].widget.attrs.update({'placeholder': field.label})

    class Meta: # Specify model that it interacts with
        model = User
        fields = ['username', 'email', 'password1', 'password2']


class UserLoginForm(AuthenticationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name in self.fields:
            field = self.fields.get(field_name)
            self.fields[field_name].widget.attrs.update({'placeholder': field.label})

    class Meta:
        model = User
        fields = ['username', 'password']



class UserEditForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField() # Change so that this is hidden

    class Meta:
        model = User
        fields = ['username', 'password']
