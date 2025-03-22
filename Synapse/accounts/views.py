from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import update_session_auth_hash

# LOGIN VIEW
def login_view(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        # Check if user exists in auth_user table
        user = User.objects.filter(username=username).first()
        if not user:
            messages.error(request, "User does not exist.")
            return redirect("login")

        # Authenticate user
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, "Login Successful")
            return redirect("dashboard")
        else:
            messages.error(request, "Invalid username or password")
            return redirect("login")

    return render(request, "accounts/login.html")

# REGISTER VIEW
def register_view(request):
    if request.method == "POST":
        username = request.POST.get("username")
        email = request.POST.get("email")
        password1 = request.POST.get("password1")
        password2 = request.POST.get("password2")

        # Ensure passwords match
        if password1 != password2:
            messages.error(request, "Passwords do not match!")
            return redirect("register")

        # Check if user already exists
        if User.objects.filter(username=username).exists():
            messages.error(request, "User already exists")
            return redirect("register")

        # Create the user
        user = User.objects.create_user(username=username, email=email, password=password1)
        user.save()
        messages.success(request, "Registration successful! You can log in now")
        return redirect("login")

    return render(request, "accounts/register.html")

# LOGOUT VIEW
def logout_view(request):
    logout(request)
    messages.success(request, "Logged out successfully!")
    return redirect("login")

# DASHBOARD VIEW
@login_required
def dashboard_view(request):
    return render(request, "accounts/dashboard.html")

# DEALS VIEW
def deals(request):
    return render(request, "accounts/deals.html")

# EDIT PROFILE VIEW (No profile requirement)
@login_required
def edit_profile_view(request):
    user = request.user

    if request.method == "POST":
        # Update Profile Picture
        if 'profile_picture' in request.FILES:
            user.userprofile.profile_picture = request.FILES['profile_picture']
            user.userprofile.save()

        # Update Username & Email
        new_username = request.POST.get('username', user.username)
        new_email = request.POST.get('email', user.email)
        user.username = new_username
        user.email = new_email
        user.save()

        # Update Password
        new_password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')

        if new_password and confirm_password:
            if new_password == confirm_password:
                user.set_password(new_password)
                user.save()
                update_session_auth_hash(request, user)  # Prevent logout
                messages.success(request, "Password updated successfully!")
            else:
                messages.error(request, "Passwords do not match!")

        return redirect("profile")  # Redirect after saving

    return render(request, "accounts/edit_profile.html")

# PROFILE VIEW (No Profile dependency)
@login_required
def profile_view(request):
    return render(request, "accounts/profile.html", {"user": request.user})
