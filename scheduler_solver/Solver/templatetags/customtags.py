from django import template
from math import floor
from datetime import time
from typing import List
from django.utils.translation import gettext_lazy as _


register = template.Library()


@register.filter
def academic_year(starting_year: int) -> str:
    """
    Custom template tag to obtain academic_year of term.
    Usage: same as template filter
    """
    return f"{starting_year}/{starting_year + 1}"


@register.filter
def subject_size(arr: List[int]) -> str:
    """
    Custom template tag to obtain academic_year of term.
    Usage: same as template filter
    """
    return f"{arr[0]}+{arr[1]}"


@register.filter
def indexer(arr, i: int):
    """
    Custom tag to access container at given index.
    """
    return arr[i]


@register.filter
def yielder(arr):
    """
    Custom tag to access container at given index.
    """
    for item in arr:
        yield item


@register.filter
def day_of_week(day: str):
    if day == '': return '';
    day = int(day)
    days: List[str] = [
        _('Monday'),
        _('Tuesday'),
        _('Wednesday'),
        _('Thursday'),
        _('Friday')
    ]
    return days[day - 1]


@register.filter
def time_of_day(tm: str):
    if tm == '': return '';
    tm = float(tm)
    minutes = [ '00', '15', '30', '45' ]
    return f'{floor(tm)}:{minutes[int(float(tm % 1)/0.25)]}'


register.filter('academic_year', academic_year)
register.filter('subject_size', subject_size)
register.filter('time_of_day', time_of_day)
register.filter('day_of_week', day_of_week)
register.filter('indexer', indexer)
register.filter('yielder', yielder)

