from typing import ContextManager
from django.db import models

# Create your models here.

class User(models.Model):
    userID = models.AutoField(primary_key=True, unique=True)
    username = models.CharField(max_length=50)
    name = models.CharField(max_length=50)
    email = models.EmailField(max_length=50, unique=True)
    password = models.CharField(max_length=50)
    phoneNumber = models.CharField(max_length=20, default="")
    isAuthenticated = models.BooleanField(default=False)
    isActive = models.BooleanField(default=True)

    def __str__(self):
        return self.username


class Event(models.Model):
    eventID = models.AutoField(primary_key=True, unique=True)
    name = models.TextField(null=False)
    thumbnail = models.TextField(null=False)
    performer = models.CharField(max_length=50, default="")
    date = models.CharField(max_length=50, null=False)
    location = models.CharField(max_length=100, default="Location: ")
    time = models.CharField(max_length=50, default="Time: ")
    rules = models.TextField(default="Event details: ")
    prices = models.TextField(default="Prices: ")
    category = models.CharField(max_length=100, default="")
    type = models.CharField(max_length=50, default="normal")

    def __str__(self):
        return self.name


class Announcement(models.Model):
    announcementID = models.AutoField(primary_key=True, unique=True)
    content = models.CharField(max_length=250)
    date = models.CharField(max_length=250)

    def __str__(self):
        return self.content