from django.db import models


class Contact(models.Model):
    name = models.CharField('name', max_length=100)
    email = models.EmailField('email', unique=True)
    phone = models.CharField('phone number', max_length=13, unique=True)
    message = models.CharField('message', max_length=2000)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_active = models.BooleanField(default=True)

    class Meta:
        verbose_name_plural = 'contacts'
        ordering = 'created_at',

    def __str__(self) -> str:
        return f'{self.name}'


class Technology(models.Model):
    name = models.CharField('technology name', max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name_plural = 'technologies'
        ordering = 'name',

    def __str__(self) -> str:
        return f'{self.name}'


class Solution(models.Model):
    type = models.CharField(verbose_name='solution type', max_length=100)
    description = models.TextField(max_length=1000)
    technologies = models.ManyToManyField(Technology, 'solutions', verbose_name='technologies')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = 'solutions'
        ordering = 'updated_at',

    def __str__(self) -> str:
        return f'{self.type}'


class Project(models.Model):
    name = models.CharField(verbose_name='project name', max_length=100)
    description = models.TextField(max_length=1000)
    technologies = models.ManyToManyField(Technology,'projects', verbose_name="technologies")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = "projects"
        ordering = "updated_at",

    def __str__(self) -> str:
        return f"{self.name}"
