from django.urls import path, include, re_path, register_converter
from django.contrib import admin
from . import views, converters


register_converter(converters.JsonConverter, 'json')


urlpatterns = [
    path("", views.Home, name='index'),
    path("", views.IndexView, name='dashboard'),
    
    path("accounts/", include("django.contrib.auth.urls")),

    path('register', views.CreateStudentView, name='register'),
    path('students/<int:pk>/update', views.UpdateStudentView, name='update'),

    path('students', views.StudentsView, name='students'),
    path("students/<int:pk>", views.DetailStudentView, name='student_detail'),

    path("create_field", views.CreateFieldView, name='create_field'),

    path("terms", views.TermsView, name='terms'),
    path("create_term", views.CreateTermView, name='create_term'),
    path("terms/<int:pk>", views.TermView, name='term_detail'),
    path("filter_terms", views.TermFilterView, name='filter_terms'),

    path("items", views.ItemsView, name='items'),
    path("items/<int:pk>", views.ItemView, name='items_detail'),
    path("Demands/<int:pk>", views.DemandsView, name='demands_detail'),
    path("Demands/<int:pk>/edit", views.EditDemandsView, name='edit_demands'),
    path("Demands/<int:pk>/delete", views.DeleteDemandsView, name='demands_delete'),

    path('terms/<int:pk>/load', views.LoadItems, name='load_items'),
    path('demands/<int:pk>/load', views.LoadDemands, name='load_demands'),
    path('students/new_load', views.LoadNewDemands, name='load_new_demands'),
    path('students/from_items_load/<int:term_pk>/<int:items_pk>', views.LoadDemandsFromItems, name='load_demands_from_items'),

    path('items/<int:pk>/download', views.DownloadItems, name='download_items'),
    path('demands/<int:pk>/download', views.DownloadDemands, name='download_demands'),

    path('items/<int:pk>/valuate', views.ValuateView, name='valuate'),

    path('generate_schedule_st/<int:pk>/<int:user_pk>', views.GenerateView, name='generate_schedule_st'),
    path('generate_schedule/<int:dem_pk>', views.GenerateViewDem, name='generate_schedule'),

    # path('pick_schedule/<int:dem_pk>', views.PickSchedule, name='pick_schedule'),
    path('pick_schedule/<int:dem_pk>/<int:res_index>', views.PickSchedule, name='pick_schedule'),
    # re_path(r'pick_schedule/\([a-zA-Z]+\) *(.+)', views.PickSchedule, name='pick_schedule'),
]

