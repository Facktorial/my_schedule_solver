from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import User
# from django.contrib.auth.base_user import AbstractBaseUser, BaseUserManager
from django.utils.translation import gettext_lazy as _
from datetime import datetime, date
from functools import partial
from django.db.models import JSONField


# Create your models here.
def year_choices():
    return [(yr, yr) for yr in range(2020, date.today().year + 1)]


def current_year(add: int = 0):
    return date.today().year + add


class FieldOfStudy(models.Model):
    field_name = models.CharField(max_length=64)

    def __str__(self):
        return f"{self.field_name}"

    class Meta: 
        verbose_name = "Field of Study"
        verbose_name_plural = "Fields of studies"


class Term(models.Model):
    YEAR_CHOICES = year_choices()

    PERIOD_CHOICES = (
        ("ZS", _("Winter")),
        ("LS", _("Summer")),
    )

    field = models.ForeignKey(FieldOfStudy, null=True, blank=True, verbose_name="FieldOfStudy", on_delete=models.SET_NULL)

    period = models.CharField(max_length=20, choices=PERIOD_CHOICES)

    academic_year_start = models.IntegerField(_('year'), choices=YEAR_CHOICES, default=current_year)

    @property
    def end_of_yr(self):
        return self.academic_year_start + 1

    def __str__(self):
        return f"{self.academic_year_start}/{self.end_of_yr} - {self.period} semester, {self.field}"


class Student(models.Model):
    """
    User profile, user chooses demands and subjects for specific term
    """
    user = models.OneToOneField(User, on_delete=models.CASCADE)

    field = models.ForeignKey(FieldOfStudy, null=True, blank=True, verbose_name="Field of study", on_delete=models.SET_NULL)
    # valuation = models.ForeignKey(Valuation, null=True, blank=True, verbose_name="ValuationForTerm", on_delete=models.SET_NULL)

    def __str__(self):
        return f'{self.user.first_name} {self.user.last_name} - {self.field}'


@receiver(post_save, sender=User)
def create_user_student(sender, instance, created, **kwargs):
    if created:
        Student.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_student(sender, instance, **kwargs):
    instance.student.save()


class Items(models.Model):
    """
    Possible classes for term with priority score
    """
    term = models.ForeignKey(Term, default=1, verbose_name="Term", on_delete=models.SET_DEFAULT)
    created_by = models.ForeignKey(Student, blank=True, null=True, on_delete=models.CASCADE)
    data = JSONField(null=True)
    
    def __str__(self):
        return f"Subjects for: {self.term} created by {self.created_by}"

    class Meta: 
        verbose_name = "Items"
        verbose_name_plural = "Items"


class Results(models.Model):
    """
    Result of solving.
    """
    valid = models.BooleanField(default=False)
    best_score = models.IntegerField(
        default=0,
        validators=[MinValueValidator(0)],
        verbose_name="BestScore",
    )
    data = JSONField(null=True)

    class Meta: 
        verbose_name = "Results"
        verbose_name_plural = "Results"


class Demands(models.Model):
    """
    Given demands from user instance.
    """
    term = models.ForeignKey(Term, default=1, verbose_name="Term", on_delete=models.SET_DEFAULT)
    # items = models.ForeignKey(Items, on_delete=models.CASCADE)
    user = models.ForeignKey(Student, null=True, blank=True, verbose_name="DemandsForTerm", on_delete=models.SET_NULL) 
    data = JSONField(null=True)
    results = models.ForeignKey(Results, null=True, blank=True, verbose_name="ResultsForTerm", on_delete=models.SET_NULL)

    def __str__(self):
        return f"Demands for {self.term} by {self.user}"

    class Meta: 
        verbose_name = "Demands"
        verbose_name_plural = "Demands"

