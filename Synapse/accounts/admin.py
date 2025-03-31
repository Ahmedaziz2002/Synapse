from django.contrib import admin
from .models import Product, Cart, CartItem

admin.site.register(Cart)
admin.site.register(CartItem)

@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ("name", "price", "category")
    search_fields = ("name", "category")
    list_filter = ("category",)
