''''
from django.shortcuts import render
from assign.models import Assign
from user.models import User
from task.models import Task
from django.core.files.storage import FileSystemStorage
import datetime
from django.utils import timezone

# Create your views here.
def assign_task(request,idd):
    ob=Task.objects.get(task_id=idd)
    message=""
    ok=User.objects.all()
    context={
        'x':ob,
        'y':ok
    }
    if request.method=='POST':
        obj=Assign()
        obj.task_id=idd
        obj.user_id=request.POST.get('uname')
        obj.date=request.POST.get('date')
        obj.time=datetime.datetime.now()
        obj.status='pending'
        obj.upload='pending'
        obj.up_date=datetime.datetime.now()
        obj.save()
        ob=User.objects.get(user_id=obj.user_id)
        ob.totaltask_assigned=int(ob.totaltask_assigned)+1
        ob.save()

        # context['msg'] = message  # Update context with the message
        message="Task Assigned successfull"
        context['msg']=message

    return render(request ,'assign/assgin_task.html',context)




#
# def upload(request, idd):
#     obj = Assign.objects.get(assign_id=idd)
#     if request.method == 'POST':
#         # Check if the due date has passed
#         if obj.date < timezone.now().date():
#             # Display a message indicating that the date has expired
#             return render(request, 'assign/date_expired.html')
#
#         myfile = request.FILES['img']
#         fs = FileSystemStorage()
#         filename = fs.save(myfile.name, myfile)
#         obj.upload = myfile.name
#         obj.up_date = timezone.now()
#         obj.save()
#
#         u_id = request.session['u_id']
#         ob = User.objects.get(user_id=u_id)
#         ob.totaltask_finished = int(ob.totaltask_finished) + 1
#         ob.save()
#
#         return view_taskstatus(request)
#
#     # Check if the due date has passed before rendering the upload form
#     if obj.date < timezone.now().date():
#         # Display a message indicating that the date has expired
#         return render(request, 'assign/date_expired.html')
#
#     return render(request, 'assign/post_upload.html')
#
#
# def view_taskstatus(request):
#     ss = request.session["u_id"]
#     obj=Assign.objects.filter(user_id=ss)
#     context={
#         'x':obj
#     }
#     return render(request ,'assign/view_taskstatus.html',context)
#
#
# def view(request):
#     obj=Assign.objects.filter(status='Completed')
#     context={
#         'x':obj
#     }
#     return render(request ,'assign/view_status.html',context)
#
# def complete(request, idd):
#     obj=Assign.objects.get(assign_id=idd)
#     obj.status='Completed'
#     obj.save()
#     return view_taskstatus(request)
#
# def not_com(request, idd):
#     obj=Assign.objects.get(assign_id=idd)
#     obj.status='Not Completed'
#     obj.save()
#     return view_taskstatus(request)

def upload(request, idd):
    obj = Assign.objects.get(assign_id=idd)
    message = ""
    context = {}
    if request.method == 'POST':
        # Check if the due date has passed
        if obj.date < timezone.now().date():
            # Display a message indicating that the date has expired
            return render(request, 'assign/date_expired.html')

        myfile = request.FILES['img']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        obj.upload = myfile.name
        obj.up_date = timezone.now()
        obj.save()

        u_id = request.session['u_id']
        ob = User.objects.get(user_id=u_id)
        ob.totaltask_finished = int(ob.totaltask_finished) + 1
        ob.save()
        message = "uploaded successsfully"

        # Call view_taskstatus without context argument
        return view_taskstatus(request, message=message)

    # Check if the due date has passed before rendering the upload form
    if obj.date < timezone.now().date():
        # Display a message indicating that the date has expired
        return render(request, 'assign/date_expired.html')

    return render(request, 'assign/post_upload.html', context)


def view(request):
    obj = Assign.objects.filter(status='Completed')
    context = {
        'x': obj
    }
    return render(request, 'assign/view_status.html', context)


def complete(request, idd):
    obj = Assign.objects.get(assign_id=idd)
    obj.status = 'Completed'
    obj.save()
    message = "Task marked as completed successfully"
    return view_taskstatus(request, message=message)


def not_com(request, idd):
    obj = Assign.objects.get(assign_id=idd)
    obj.status = 'Not Completed'
    obj.save()
    message = "Task marked as not completed successfully"
    return view_taskstatus(request, message=message)


def view_taskstatus(request, message=None):
    ss = request.session.get("u_id")
    obj = Assign.objects.filter(user_id=ss)
    context = {
        'x': obj,
        'msg': message
    }
    return render(request, 'assign/view_taskstatus.html', context)
'''
from django.http import HttpResponse
from django.conf import settings
from django.shortcuts import render
from assign.models import Assign
from user.models import User
from task.models import Task
from django.core.files.storage import FileSystemStorage
import datetime
from django.utils import timezone
import os


def download_file(request, filename):
    # Get the full path of the file
    file_path = os.path.join(settings.MEDIA_ROOT, filename)

    # Check if the file exists
    if os.path.exists(file_path):
        # Open the file and create an HTTP response with the file content
        with open(file_path, 'rb') as f:
            response = HttpResponse(f.read(), content_type='application/pdf')  # Adjust content type based on file type
            response['Content-Disposition'] = 'inline; filename=' + os.path.basename(file_path)
        return response
    else:
        # If the file doesn't exist, return a 404 Not Found response
        return HttpResponse("File not found", status=404)


def assign_task(request, idd):
    ob = Task.objects.get(task_id=idd)
    message = ""
    ok = User.objects.all()
    context = {
        'x': ob,
        'y': ok
    }
    if request.method == 'POST':
        obj = Assign()
        obj.task_id = idd
        obj.user_id = request.POST.get('uname')
        obj.date = request.POST.get('date')
        obj.time = datetime.datetime.now()
        obj.status = 'pending'
        obj.upload = 'pending'
        obj.up_date = datetime.datetime.now()
        obj.save()
        ob = User.objects.get(user_id=obj.user_id)
        ob.totaltask_assigned = int(ob.totaltask_assigned) + 1
        ob.save()

        message = "Task Assigned successfully"
        context['msg'] = message

    return render(request, 'assign/assgin_task.html', context)


def upload(request, idd):
    obj = Assign.objects.get(assign_id=idd)
    message = ""
    context = {}
    if request.method == 'POST':
        # Check if the due date has passed
        if obj.date < timezone.now().date():
            # Display a message indicating that the date has expired
            return render(request, 'assign/date_expired.html')

        myfile = request.FILES['img']
        fs = FileSystemStorage()
        filename = fs.save(myfile.name, myfile)
        obj.upload = myfile.name
        obj.up_date = timezone.now()
        obj.save()

        u_id = request.session['u_id']
        ob = User.objects.get(user_id=u_id)
        ob.totaltask_finished = int(ob.totaltask_finished) + 1
        ob.save()
        message = "Uploaded successfully"

        # Call view_taskstatus without context argument
        return view_taskstatus(request, message=message)

    # Check if the due date has passed before rendering the upload form
    if obj.date < timezone.now().date():
        # Display a message indicating that the date has expired
        return render(request, 'assign/date_expired.html')

    return render(request, 'assign/post_upload.html', context)


def view(request):
    obj = Assign.objects.filter(status='Completed')
    context = {
        'x': obj
    }
    return render(request, 'assign/view_status.html', context)


def complete(request, idd):
    obj = Assign.objects.get(assign_id=idd)
    obj.status = 'Completed'
    obj.save()
    message = "Task marked as completed successfully"
    return view_taskstatus(request, message=message)


def not_com(request, idd):
    obj = Assign.objects.get(assign_id=idd)
    obj.status = 'Not Completed'
    obj.save()
    message = "Task marked as not completed successfully"
    return view_taskstatus(request, message=message)


def view_taskstatus(request, message=None):
    ss = request.session.get("u_id")
    obj = Assign.objects.filter(user_id=ss)
    context = {
        'x': obj,
        'msg': message
    }
    return render(request, 'assign/view_taskstatus.html', context)

