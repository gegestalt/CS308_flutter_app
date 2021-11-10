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
