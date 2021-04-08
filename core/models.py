from django.db import models


class Fact(models.Model):
    category = models.CharField(max_length=100)
    fact = models.TextField()


