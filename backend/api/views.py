from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework import authentication, permissions, status
from rest_framework.response import Response
from .serializers import *
import uuid

# Create your views here.
class SignUp(APIView):
    permission_classes = [] # No permission needed
    authentication_classes = [] # No authentication needed

    def post(self, request):
        serializer = UserSerializer(data=request.data)

        if serializer.is_valid():
            #TODO: Can hash the password and then save it

            serializer.save()
            
            return Response(
                {
                    "RequestId": str(uuid.uuid4()),
                    "Message": "User created successfully",                    
                    "User": serializer.data,
                }, 
                status=status.HTTP_201_CREATED,
                headers={
                    "Access-Control-Allow-Origin": "*",
                    "Access-Control-Allow-Headers": "*",
                }
            )

        return Response(
            {"Errors": serializer.errors},
            status=status.HTTP_400_BAD_REQUEST,
        )

    def get(self, request):
        if User.objects.count != 0:
            users = User.objects.all()
            serializer = UserSerializer(users, many=True)
            return Response(serializer.data)

        return Response(
            {"Errors": "No user objects exist!"},
            status=status.HTTP_400_BAD_REQUEST,
        )

class UserSettings(APIView):
    permission_classes = [] # No permission needed
    authentication_classes = [] # No authentication needed

    def post(self, request):

        # Get data from the request:
        email = request.data["email"]
        newUsername = request.data["username"]
        newName = request.data["name"]
        newPassword = request.data["password"]
        newPhonenumber = request.data["phoneNumber"]


        

        if email != None:
            # get current user
            user = User.objects.get(email = email)
            print(user)
            
            # change user info
            if newName != None:
                user.name = newName
            if newUsername != None:
                user.username = newUsername
            if newPassword != None:
                user.password = newPassword
            if newPhonenumber != None:
                user.phoneNumber = newPhonenumber
            
            # save the changes
            user.save()
            print(user)
            
            return Response(
                {
                    "RequestId": str(uuid.uuid4()),
                    "Message": "Settings saved successfully",
                    "User": email,                    
                }, 
                status=status.HTTP_202_ACCEPTED,
                headers={
                    "Access-Control-Allow-Origin": "*",
                    "Access-Control-Allow-Headers": "*",
                }
            )

        return Response(
            {"Errors": "No matching email"},
            status=status.HTTP_400_BAD_REQUEST,
        )

    def get(self, request):
        if User.objects.count != 0:
            users = User.objects.all()
            serializer = UserSerializer(users, many=True)
            return Response(serializer.data)

        return Response(
            {"Errors": "No user objects exist!"},
            status=status.HTTP_400_BAD_REQUEST,
        )
