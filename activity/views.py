from django.shortcuts import render, redirect
from activity.models import Activity
from user.models import User
import datetime
from django.utils import timezone


# Create your views here.
def post_activity(request):
    obk = ""
    ob = User.objects.all()
    if request.method == 'POST':
        obj = Activity()
        obj.user_id = request.POST.get('uname')
        obj.activity_name = request.POST.get('activity')
        obj.time = datetime.datetime.now()
        obj.due_date = request.POST.get('ddate')
        obj.date = datetime.datetime.now()
        obj.status = 'pending'
        obj.save()
        obk = "success"
    context = {
        'msg': obk,
        'x': ob
    }
    return render(request, 'activity/post_activity.html', context)




def view_activity(request):
    activities = Activity.objects.all()
    context = {'activities': activities}
    return render(request, 'activity/view_activity.html', context)


def approve(request, idd):
    activity = Activity.objects.get(activity_id=idd)

    # Check if the due date has passed
    if activity.due_date < timezone.now().date():
        # Display a message indicating that the date has expired
        return render(request, 'activity/date_expired.html')

    activity.status = 'Completed'
    activity.due_date = datetime.datetime.today()
    activity.save()
    return redirect('view_activity')


def reject(request, idd):
    activity = Activity.objects.get(activity_id=idd)

    # Check if the due date has passed
    if activity.due_date < timezone.now().date():
        # Display a message indicating that the date has expired
        return render(request, 'activity/date_expired.html')

    activity.status = 'Not Completed'
    activity.save()
    return redirect('view_activity')

