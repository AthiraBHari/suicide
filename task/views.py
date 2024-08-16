from django.shortcuts import render
from task.models import Task
from django.core.files.storage import FileSystemStorage
# Create your views here.


# def post_task(request):
#     obk=""
#     if request.method=='POST':
#         obj=Task()
#         obj.task=request.POST.get('tsk')
#         # obj.upload_task=request.POST.get('addtask')
#         myfile=request.FILES['addtask']
#         fs=FileSystemStorage()
#         filename=fs.save(myfile.name, myfile)
#         obj.upload_task=myfile.name
#         obj.status='pending'
#         obj.due_date=request.POST.get('ddate')
#         obj.save()
#         obk = "Task Added Successfully"
#     context = {
#             'msg': obk
#         }
#     return render(request, 'task/task.html',context)


def post_task(request):
    obk = ""
    if request.method == 'POST':
        obj = Task()
        obj.task = request.POST.get('tsk')

        # Check if 'addtask' exists in request.FILES
        if 'addtask' in request.FILES:
            myfile = request.FILES['addtask']
            fs = FileSystemStorage()
            filename = fs.save(myfile.name, myfile)
            obj.upload_task = myfile.name
        else:
            obj.upload_task = ''  # Set a default value if no file is uploaded

        obj.status = 'pending'
        obj.due_date = request.POST.get('ddate')
        obj.save()
        obk = "Task Added Successfully"

    context = {
        'msg': obk
    }
    return render(request, 'task/task.html', context)


def view_task(request):
    obj=Task.objects.all()
    context={
        'x':obj
    }
    return render(request, 'task/view_task.html',context)

# def accept(request, idd):
#     obj=Task.objects.get(task_id=idd)
#     obj.status='accepted'
#     obj.save()
#     return view_task(request)
#
# def reject(request, idd):
#     obj=Task.objects.get(task_id=idd)
#     obj.status='rejected'
#     obj.save()
#     return view_task(request)
