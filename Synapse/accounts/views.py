from django.shortcuts import render,redirect
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth.decorators import login_required
# Create your views here.

def login_view(request):
    if request.method=="POST":
        username=request.POST["username"]
        password=request.POST["password"]

        if not User.objects.filter(username=username).exists():
            messages.error(request,"User does not exist.")
            return redirect("login")
        else:
            user=authenticate(request,username=username,password=password)

        if user is not None:
            login(request,user)
            messages.success(request,"Login Successful")
            return redirect("dashboard")
        else:
            messages.error(request,"Invalid username or password")
            return redirect("login")
    return render(request,"accounts/login.html")

def register_view(request):
    if request.method=="POST":
        username=request.POST.get("username")
        email=request.POST.get("email")
        password1=request.POST.get("password1")
        password2=request.POST.get("password2")

        if not password2:
            messages.error(request,"Please confirm your password!")
            return redirect("register")

        if password1==password2:
            if User.objects.filter(username=username).exists():
                messages.error(request,"User already exists")
                return redirect("register")
            else:
                user=User.objects.create_user(username=username,email=email,password=password1)
                user.save()
                messages.success(request,"Registration successful!You can log in now")
                return redirect("login")
        else:
            messages.error(request,"Passwords do not match!")
            return redirect("register")
    return render(request,"accounts/register.html")

def logout_view(request):
    logout(request)
    messages.success(request,"Logged out successfully!")
    return redirect("login")

@login_required
def dashboard_view(request):
    return render(request,'accounts/dashboard.html')

def deals(request):
    return render(request,"accounts/deals.html")