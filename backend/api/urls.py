from django.urls import path
from django.urls.conf import include
from .views import *

urlpatterns = [
    path("sign-up", SignUp.as_view(), name="sign-up"),
    path("settings", UserSettings.as_view(), name="settings"),
]