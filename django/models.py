# models.py

from django.db import models

class User(models.Model):
    name = models.CharField(max_length=100)
    dob = models.DateField()
    address = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    phone_number = models.CharField(max_length=20)
