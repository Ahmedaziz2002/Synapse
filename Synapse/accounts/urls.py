from django.urls import path
from. import views

urlpatterns=[
    path("",views.login_view,name="login"),
    path("logout/",views.login_view,name="logout"),
    path("register/",views.register_view,name="register"),
    path("dashboard/",views.dashboard_view,name="dashboard"),
    path('profile/', views.profile_view, name='profile'),
    path('profile/edit/', views.edit_profile_view, name='edit_profile'),
    path('deals/', views.deals_view, name='deals'),
    path('product/<int:product_id>/', views.product_detail_view, name='product_detail'),
    path('cart/', views.cart_view, name='cart'),
    path('add_to_cart/<int:product_id>/', views.add_to_cart, name='add_to_cart'),
    path("checkout/", views.checkout_view, name="checkout"),
    path("order_summary/",views.order_summary_view,name="order_summary"),
    path('category/<str:category_name>/', views.product_list_by_category, name='products_by_category'),
    path('remove/<int:item_id>/', views.remove_from_cart, name='remove_from_cart'),
    path('paypal-success/',views.paypal_success_view, name='paypal_payment_success'),

]
