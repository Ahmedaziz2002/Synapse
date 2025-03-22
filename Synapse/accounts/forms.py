from django import forms
from .models import UserProfile

class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model=UserProfile
        fields=['profile_picture','image_url']