def categories_context(request):
    return {
        'categories': [
            ('electronics', 'Electronics'),
            ('fashion', 'Fashion'),
            ('home', 'Home & Furniture'),
            ('automobiles', 'Automobiles')
        ]
    }
