from rest_framework import serializers

from .models import Fact


class FactSerializer(serializers.ModelSerializer):
    """Serializes Fact instances"""

    class Meta:
        model = Fact
        fields = (
            'category',
            'fact',
        )

