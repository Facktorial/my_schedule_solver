from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import User
from .models import Student


# @receiver(post_save, sender=User)
# def create_user_student(sender, instance, created, **kwargs):
#     if created:
#         Student.objects.create(user=instance)
# 
# 
# @receiver(post_save, sender=User)
# def save_user_student(sender, instance, **kwargs):
#     instance.student.save()
# 
