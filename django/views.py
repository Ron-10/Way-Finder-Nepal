from django.shortcuts import render, redirect
from django.contrib import messages
from .models import User

def register(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        # Check if username or email already exists
        if User.objects.filter(username=username).exists() or User.objects.filter(email=email).exists():
            messages.error(request, 'Username or email already exists.')
            return redirect('register')
        else:
            # Create new user
            user = User.objects.create(username=username, email=email, password=password)
            user.save()
            messages.success(request, 'Account created successfully.')
            return redirect('login')
    return render(request, 'register.html')

def login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        # Verify user credentials
        user = User.objects.filter(username=username, password=password).first()
        if user:
            # User authenticated, redirect to home page
            # You can implement session management or JWT token authentication here
            return redirect('home')
        else:
            messages.error(request, 'Invalid credentials.')
            return redirect('login')
    return render(request, 'login.html')
