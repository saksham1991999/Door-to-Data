from django.urls import path, include
from rest_framework.routers import DefaultRouter

from core.views import FactAPIViewSet


app_name = 'core'


router = DefaultRouter()
router.register('facts', FactAPIViewSet, basename='fact')

urlpatterns = [
    path('', include(router.urls)),
]