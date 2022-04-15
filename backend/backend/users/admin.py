from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import CustomUser


class CustomUserAdmin(UserAdmin):
    update_fieldsets = ['username', 'first_name', 'last_name', 'email', 'is_staff', 'password', 'created_at', 'updated_at', 'last_login']
    readonly_fields = ['created_at', 'updated_at', 'last_login', 'password']

admin.site.register(CustomUser, UserAdmin)