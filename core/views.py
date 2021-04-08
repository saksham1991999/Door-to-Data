from django.shortcuts import render, get_object_or_404, redirect, HttpResponse
from rest_framework import viewsets, status
from rest_framework.response import Response
from rest_framework.decorators import action
from rest_framework.permissions import IsAdminUser, AllowAny, IsAuthenticated, IsAuthenticatedOrReadOnly
from .permissions import IsAdminOrReadOnly
from django.db.models import Q
import datetime

from .serializers import FactSerializer
from .models import Fact


class FactAPIViewSet(viewsets.ModelViewSet):
    serializer_class = FactSerializer
    permission_classes = [IsAdminOrReadOnly]
    queryset = Fact.objects.all()