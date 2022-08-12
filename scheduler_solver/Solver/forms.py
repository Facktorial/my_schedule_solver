from django.core.validators import validate_integer
from django import forms
from django.contrib.auth import authenticate
from django.contrib.auth.forms import UserCreationForm, UserChangeForm


from .models import *


class RegistrationForm(UserCreationForm):
     class Meta:
         model = User
         fields = ['username', 'password1', 'password2', 'first_name', 'last_name']


class RegistrationStudentForm(forms.ModelForm):
     class Meta:
         model = Student
         fields = ['field']

 
class UpdateForm(UserChangeForm):
     class Meta:
         model = User
         fields = ['first_name', 'last_name']
         exclude = [ 'username', 'password1', 'password2' ]
 
 
class CreateFieldForm(forms.ModelForm):
    class Meta:
        model = FieldOfStudy
        fields = '__all__'


class CreateTermForm(forms.ModelForm):
    jsonfile = forms.FileField(required=False)

    class Meta:
        model = Term
        fields = ['field', 'period', 'academic_year_start']


class FilterTermsForm(forms.ModelForm):
    class Meta:
        model = Term
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super(FilterTermsForm, self).__init__(*args, **kwargs)
        self.fields['field'].required = False
        self.fields['period'].required = False
        self.fields['academic_year_start'].required = False


class LoadItemsForm(forms.ModelForm):
    jsonfile = forms.FileField()

    class Meta:
        model = Items
        fields = ['term']


class LoadDemandsForm(forms.ModelForm):
    jsonfile = forms.FileField()

    class Meta:
        model = Demands
        fields = []


class LoadNewDemandsForm(forms.ModelForm):
    jsonfile = forms.FileField()

    class Meta:
        model = Demands
        fields = ['term']

