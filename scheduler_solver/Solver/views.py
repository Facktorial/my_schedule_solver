from django.shortcuts import render, get_object_or_404, get_list_or_404, redirect
import json
import io
from django.http import HttpResponse, Http404
from django.urls import reverse
from django.views.generic.edit import CreateView, UpdateView
from datetime import datetime, timedelta
from django.db import transaction
from django.contrib import messages
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.models import User

from tempfile import TemporaryDirectory

from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator

from .models import Student, Term, Demands, Items, Results, FieldOfStudy
from .forms import UpdateForm, UpdateForm, RegistrationForm, RegistrationStudentForm, CreateTermForm, FilterTermsForm, LoadItemsForm, LoadDemandsForm, LoadNewDemandsForm, CreateFieldForm
from .solver.solver import solve
from .solver.print_schedule import yield_times, prasecina
# from .utils import handle_json_upload


def Home(request):
    """
    Home view displays index page or IndexView if is user logged in.
    """
    if request.user.is_authenticated:
        return IndexView(request)
    else:
        return render(request, 'Solver/index.html', {'user': request.user})


@login_required
def IndexView(request):
    """
    Index view occurs only, if some user is logged in,
    it displays something.
    """
    student = get_object_or_404(Student, user=request.user)
    return render(request, 'Solver/index.html', {'user': request.user, 'student': student})


@transaction.atomic
def CreateStudentView(request):
    """
    Form with registration.
    """
    if request.POST:

        form = RegistrationForm(request.POST) 
        form_st = RegistrationStudentForm(request.POST)

        if form.is_valid() and form_st.is_valid():
            user = form.save()
            student = Student.objects.get(user=user)
            student.field = FieldOfStudy.objects.get(id=request.POST['field'])
            student.save()
            messages.success(request, _('Your profile was successfully created!'))

            login(request, user)
            return redirect('index')

        else:
            messages.error(request, _('Please correct the error below.'))

    else:
        form = RegistrationForm()
        form_st = RegistrationStudentForm()

    return render(request, 'Solver/forms/registration.html', {'form': form, 'form_st': form_st, 'button_text': "register"})


@login_required
def UpdateStudentView(request, pk: int):
    """
    Form with edit.
    """
    if request.user.id != pk:
        messages.error(request, _('You can\'t update other users.'))
        return redirect('index')

    if request.POST:
        form = UpdateForm(request.POST, instance=User.objects.get(id=pk))
        form_st = RegistrationStudentForm(request.POST, instance=request.user.student)

        if request.POST and form.is_valid():
            user = form.save()
            student = form_st.save(commit=False)
            student.field = FieldOfStudy.objects.get(id=request.POST['field'])
            student.save()
            return redirect('student_detail', pk)

        else:
            messages.error(request, _('Please correct the error below.'))

    else:
        form = UpdateForm(instance=User.objects.get(student=pk))
        form_st = RegistrationStudentForm(instance=request.user.student)

    return render(request, 'Solver/forms/registration.html', {'form': form, 'form_st': form_st, 'button_text': "update"})


@login_required
def CreateFieldView(request):
    if request.POST:
        form = CreateFieldForm(request.POST)

        if form.is_valid():
            if FieldOfStudy.objects.filter(
                        field_name=request.POST['field_name'],
                    ).exists():
                messages.error(request, _('This term already exists!'))
                return redirect('index')

            field = form.save()

            messages.success(request, _('You have created anoter field of potential knowledge!'))
            return redirect('index')

        else:
            messages.error(request, _('Please correct the error below.'))

    else:
        form = CreateFieldForm()

    return render(request, 'Solver/forms/create_field.html', {'form': form, 'button_text': "create"})


@login_required
def CreateTermView(request):
    """
    Form with term registration.
    """
    
    if request.POST:
        form = CreateTermForm(request.POST, request.FILES)

        if form.is_valid():
            if Term.objects.filter(
                        period=request.POST['period'],
                        academic_year_start=request.POST['academic_year_start'],
                        field=request.POST['field']
                    ).exists():
                messages.error(request, _('This term already exists!'))
                return redirect('terms')


            term = form.save()
            if request.FILES.get('jsonfile', None) is not None:
                student = Student.objects.get(user=request.user) 
                item = Items(term=term, created_by=student)
                item.data = json.load(request.FILES['jsonfile']) 
                item.save()
                term.item = item
                term.save()

            messages.success(request, _('You created anoter term!'))

            return redirect('term_detail', term.id)

        else:
            messages.error(request, _('Please correct the error below.'))

    else:
        form = CreateTermForm(request.POST)

    return render(request, 'Solver/forms/create_term.html', {'form': form, 'button_text': "create"})


def DetailStudentView(request, pk: int):
    """
    Detail of logged student.
    """
    student = get_object_or_404(Student, pk=pk)
    deals = Demands.objects.filter(user_id=pk)
    return render(request, 'Solver/details/student_detail.html', {'student': student, 'deals': deals})


def StudentsView(request):
    """
    List view of students
    """
    students = Student.objects.all().order_by('field').order_by('user')
    return render(request, 'Solver/details/students.html', {'students': students})


def TermFilterView(request):
    form = FilterTermsForm() 

    yr = request.POST['academic_year_start']
    period = request.POST['period']
    field = request.POST['field']

    terms = Term.objects.all().order_by('academic_year_start', '-period', 'field')
    
    if yr is not None:
        terms = terms.filter(academic_year_start=yr)
    if period is not None:
        terms = terms.filter(period=period)
    if field is not None and field is not '':
        terms = terms.filter(field=field)

    return render(request, 'Solver/details/terms.html', {'terms': terms, 'form': form})


def TermsView(request):
    """
    List view of items.
    """
    form = FilterTermsForm() 
    terms = Term.objects.all().order_by('-academic_year_start', '-period', 'field')
    return render(request, 'Solver/details/terms.html', {'terms': terms, 'form': form})


def ItemsView(request):
    """
    List view of items.
    """
    items = Items.objects.all().order_by('term')
    return render(request, 'Solver/details/student_detail.html', {'items': items})


def ItemView(request, pk: int):
    """
    Detail view of items.
    """
    item = Items.objects.get(id=pk)
    data = json.loads(item.data)
    return render(request, 'Solver/details/items_detail.html', {'item': item, 'data': data})


def DemandsView(request, pk: int):
    """
    Detail view of items.
    """
    item = Demands.objects.get(id=pk)
    data = json.loads(item.data)
    return render(request, 'Solver/details/demands_detail.html', {'item': item, 'data': data, 'student': item.user})


def EditDemandsView(request, pk: int):
    """
    Edit view of demnds.
    """
    item = Demands.objects.get(id=pk)
    return render(request, 'Solver/details/edit_demands.html', {'item': item, 'student': item.user })


def DeleteDemandsView(request, pk: int):
    """
    Edit view of demnds.
    """
    item = Demands.objects.get(id=pk)
    ide = item.user_id
    item.delete()
    return redirect('student_detail', ide)


def TermView(request, pk: int):
    """
    Term's detail views.
    """
    term = get_object_or_404(Term, pk=pk)
    # fields = FieldOfStudy.objects.filter(pk=pk)
    items = Items.objects.filter(term_id=pk)
    return render(request, 'Solver/details/term_detail.html', {'term': term, 'items': items})


@login_required
def LoadItems(request, pk: int):
    """
    Form. Upload items for current term.
    """
    if request.POST:
        form = LoadItemsForm(request.POST, request.FILES)

        if form.is_valid():
            term = Term.objects.get(id=pk)
            student = Student.objects.get(user=request.user) 
            item = Items(term=term, created_by=student)
            item.data = json.load(request.FILES['jsonfile']) 
            item.save()
            
            return redirect('items_detail', item.id)
    else:
        form = LoadItemsForm()

    return render(request, 'Solver/forms/load_items.html' , {'form': form})
    

def DownloadItems(request, pk: int):
    return DownloadJSON(request, Items, pk)


def DownloadDemands(request, pk: int):
    return DownloadJSON(request, Demands, pk)


def DownloadJSON(request, model, pk: int):
    """
    Form. Upload items for current term.
    """
    items = get_object_or_404(model, id=pk)
    filename = f"{items.term.academic_year_start}-{items.term.academic_year_start + 1}-{items.term.period}_{items.user.user.username}.json"

    with TemporaryDirectory(prefix="export_") as tmp_path:
        output = f"{tmp_path}{filename}"
    
        with open(output, "w") as f:
            f.write(items.data)

        with open(output, "r") as f:
            response = HttpResponse(f.read())
        
        response['Content-Disposition'] = f'attachment; filename={output}'
        return response


@login_required
def LoadDemands(request, pk: int):
    """
    Form. Upload items for current term.
    """
    if request.POST:
        form = LoadItemsForm(request.POST, request.FILES, instance=Demands.objects.get(id=pk))

        if form.is_valid():
            item = Demands.objects.get(id=pk)
            item.data = json.load(request.FILES['jsonfile']) 
            item.save()
            
            return redirect('demands_detail', item.id)
    else:
        form = LoadItemsForm(instance=Demands.objects.get(id=pk))

    return render(request, 'Solver/forms/load_demands.html' , {'form': form})


@login_required
def LoadNewDemands(request):
    """
    Form. Upload new demands for current term.
    """
    if request.POST:
        form = LoadNewDemandsForm(request.POST, request.FILES)

        if form.is_valid():
            student = Student.objects.get(user=request.user) 
            demand = Demands(user=student)
            demand.data = json.load(request.FILES['jsonfile']) 
            demand.term = Term.objects.get(id=request.POST['term']) 
            demand.save()
            
            return redirect('demands_detail', student.id)
    else:
        form = LoadNewDemandsForm()

    return render(request, 'Solver/forms/load_demands.html' , {'form': form})


@login_required
def LoadDemandsFromItems(request, term_pk: int, items_pk: int):
    """
    Form. Upload items for current term.
    """
    user = Student.objects.get(user=request.user)
    item = Demands(term_id=term_pk, user=user)
    item.data = Items.objects.get(id=items_pk).data 
    item.save()
            
    return redirect('demands_detail', item.id)


@login_required
def ValuateView(request, pk: int):
    """
    Form. User valuate current items.
    """
    item_obj = get_object_or_404(Demands, id=pk)
    data = json.loads(item_obj.data)

    lects_default = []
    lects_skip = []
    labs_default = []
    labs_skip = []

    for item in data:
        if item['talk'] is not None:
            lects_default.append( item['talk'].get('priority', 0) )
            lects_skip.append( ("checked", "") if item['talk']['skip'] else ("", "checked"))
        else:
            lects_default.append(0)
            lects_skip.append(("", ""))

        labs = []
        lbs_skip = []
        for it in item['labs']:
            labs.append( it.get('priority', 0) )
            lbs_skip.append( ("checked", "") if it.get('skip', 0) else ("", "checked"))

        labs_default.append(labs)
        labs_skip.append(lbs_skip)

    if request.POST:
        if request.POST:

            courses_counter: int = 0

            for item in data:
                if item['talk'] is not None:
                    item['talk']['priority'] = int(request.POST[f'priority_lec_{courses_counter}'])
                    item['talk']['skip'] = True if request.POST[f'skip_lec_{courses_counter}'] == "True" else False

                labs_counter: int = 0

                for it in item['labs']:
                    print(it)
                    it['priority'] = int(request.POST[f'priority_lab_{courses_counter}_{labs_counter}']) 
                    it['skip'] = True if request.POST[f'skip_lab_{courses_counter}_{labs_counter}'] == "True" else False
                    labs_counter = labs_counter + 1
                courses_counter = courses_counter + 1
            
            item_obj.data = json.dumps(data)
            item_obj.save()
            return redirect('demands_detail', pk)

    context = {
            'item': item,
            'data': data,
            'courses': lects_default,
            'labs': labs_default,
            'courses_skip': lects_skip,
            'labs_skip': labs_skip,
    }

    return render(request, 'Solver/forms/valuate.html', context)


def GenerateView(request, pk: int, user_pk: int):
    student = Student.objects.get(user_id=user_pk)
    term = Term.objects.get(id=pk)
    obj = get_object_or_404(Demands, user=student, term=term)

    return GenerateViewDem(request, obj.id)


def GenerateViewDem(request, dem_pk: int):
    """
    Calling schedule solver to get schedule on key.
    """
    obj = Demands.objects.get(id=dem_pk).data

    times = [ f'{x.strftime("%H:%M")}\n  -  \n{(x + timedelta(minutes=45)).strftime("%H:%M")}' for x in yield_times(13) ]

    data = json.loads(obj)
    data_results = solve(data)[0:7]
    
    hours = 13
    monday = [ None for _ in range(hours + 1)]
    tuesday = [ None for _ in range(hours + 1)]
    wednesday = [ None for _ in range(hours + 1)]
    thursday = [ None for _ in range(hours + 1)]
    friday = [ None for _ in range(hours + 1)]

    results = []
    for index, xxx in enumerate(data_results):
        mon = [x for x in filter(lambda a: a.day == 1, xxx.best_solution)]
        tue = [x for x in filter(lambda a: a.day == 2, xxx.best_solution)]
        wed = [x for x in filter(lambda a: a.day == 3, xxx.best_solution)]
        thu = [x for x in filter(lambda a: a.day == 4, xxx.best_solution)]

        mon.sort(key=lambda a: a.time)
        tue.sort(key=lambda a: a.time)
        wed.sort(key=lambda a: a.time)
        thu.sort(key=lambda a: a.time)
  
        omon = prasecina(monday, mon, hours, None)
        otue = prasecina(tuesday, tue, hours, None)
        owed = prasecina(wednesday, wed, hours, None)
        othu = prasecina(thursday, thu, hours, None)

        r = { 'index': index, 'valid': str(xxx.valid), 'score': xxx.best_score, 'day': [
                { 'day': _('Monday'), 'classes': omon },
                { 'day': _('Tueday'), 'classes': otue },
                { 'day': _('Wednesday'), 'classes': owed },
                { 'day': _('Thursday'), 'classes':  othu },
                { 'day': _('Friday'), 'classes': friday },
            ]
        }
        results.append(r)

    messages.success(request, _('Schedule suggestions generated!'))
 
    context = {
        # 'user': student.user or None,
        'dem_pk': dem_pk,
        'demand': obj,
        'results': results,
        'time_schedule': times,
        'best_score': results[0]['score']
    }

    return render(request, 'Solver/details/results_template.html', context)

def PickSchedule(request, dem_pk: int, res_index: int):
    """
    Calling schedule solver again, # FIXME to download json of schedule on key.
    """
    obj = Demands.objects.get(id=dem_pk).data

    data = json.loads(obj)
    data_results = solve(data)[0:7]

    res = data_results[res_index]

    days: Dict[int, str] = {1: "Monday", 2: "Tuesday", 3: "Wednesday", 4: "Thursday", 5: "Friday"}

    with TemporaryDirectory(prefix="export_") as tmp_path:
        output = f"your_schedule.json"

        with open(output, "w") as f:
            # f.write(request.GET['data'])
                f.write(str([{
                    "person": item.teacher,
                    "day": days[item.day],
                    "name": item.name,
                    "lab": item.lab
                } for item in res.best_solution]))

        with open(output, "r") as f:
            response = HttpResponse(f.read())
        
        response['Content-Disposition'] = f'attachment; filename={output}'
        return response

    # return GenerateViewDem(request, dem_pk)
