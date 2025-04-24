from django.shortcuts import render, redirect,get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import update_session_auth_hash
from .models import Product,CartItem,Cart,Order


# LOGIN VIEW
@csrf_exempt
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
    trending_products = Product.objects.all()[:8]  # Fetch the first 3 products
    return render(request, "accounts/dashboard.html", {'trending_products': trending_products})


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


def deals_view(request):
    products = Product.objects.all()  # Fetch all products
    return render(request, 'accounts/deals.html', {'products': products})

def product_detail_view(request, product_id):
    product = get_object_or_404(Product, id=product_id)  # Fetch product by ID
    return render(request, 'accounts/product_detail.html', {'product': product})


def add_to_cart(request, product_id):
    if request.method == "POST":
        if not request.user.is_authenticated:
            messages.error(request, "You must be logged in to add items to the cart.")
            return redirect("login")

        product = Product.objects.get(id=product_id)
        quantity = int(request.POST.get("quantity", 1))

        cart_item, created = Cart.objects.get_or_create(user=request.user, product=product)
        
        if not created:
            cart_item.quantity += quantity
        else:
            cart_item.quantity = quantity
        
        cart_item.save()
        messages.success(request, f"{product.name} added to cart!")
        return redirect("deals")
    
def cart_view(request):
    if not request.user.is_authenticated:
        messages.error(request, "You must be logged in to view the cart.")
        return redirect("login")

    cart_items = Cart.objects.filter(user=request.user)
    total = sum(item.total_price() for item in cart_items)

    return render(request, 'accounts/cart.html', {'cart_items': cart_items, 'total': total})


def checkout_view(request):
    if not request.user.is_authenticated:
        messages.error(request, "You must be logged in to checkout.")
        return redirect("login")

    cart_items = Cart.objects.filter(user=request.user)
    if not cart_items.exists():
        messages.error(request, "Your cart is empty.")
        return redirect("cart")

    total_price = sum(item.total_price() for item in cart_items)

    # Create Order
    order = Order.objects.create(user=request.user, total_amount=total_price)

    # Clear the Cart
    cart_items.delete()

    messages.success(request, "Order placed successfully!")
    return redirect("order_summary")

from django.shortcuts import redirect
from django.contrib import messages
from .models import Cart, Order

def paypal_success_view(request):
    if not request.user.is_authenticated:
        messages.error(request, "Please login to continue.")
        return redirect("login")

    cart_items = Cart.objects.filter(user=request.user)
    if not cart_items.exists():
        messages.error(request, "Your cart is empty.")
        return redirect("cart")

    total_price = sum(item.total_price() for item in cart_items)

    # Create order
    order = Order.objects.create(user=request.user, total_amount=total_price)

    # Clear the cart
    cart_items.delete()

    messages.success(request, "Your PayPal payment was successful! Order placed.")
    return redirect("order_summary")


def order_summary_view(request):
    order = Order.objects.filter(user=request.user).order_by('-created_at').first()  # Remove complete=True
    return render(request, 'accounts/order_summary.html', {'order': order})


def product_list_by_category(request, category_name):
    products = Product.objects.filter(category=category_name)
    categories = [
        ('electronics', 'Electronics'),
        ('fashion', 'Fashion'),
        ('home', 'Home & Furniture'),
    ]

    return render(request, 'accounts/products_by_category.html', {
        'products': products,
        'category_name': category_name,
        'categories': categories,
    })

def remove_from_cart(request, item_id):
    if request.method == "POST":
        cart_item = get_object_or_404(Cart, id=item_id, user=request.user)
        
        if cart_item.quantity > 1:
            cart_item.quantity -= 1
            cart_item.save()
            messages.success(request, "Item quantity decreased.")
        else:
            cart_item.delete()
            messages.success(request, "Item removed from cart.")
    
    return redirect('cart')