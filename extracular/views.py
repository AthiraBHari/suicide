from django.shortcuts import render
from extracular.models import Extracular
from activity.models import Activity
from user.models import User
import datetime

# Create your views here.
def post_extracular(request):
    ss=request.session['u_id']
    message=""
    context={}
    if request.method=='POST':
        obj=Extracular()
        obj.activities=request.POST.get('extra')
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.status='pending'
        obj.user_id=ss
        obj.save()
        ob=User.objects.get(user_id=request.session['u_id'])
        ob.extra_c=1
        ob.save()
        message="sucessfully submitted"
        context={
            'msg':message
        }
    return render(request,'extracular/post_extracular.html',context)


def view_extracular(request):
    obj=Activity.objects.all()
    context = {
        'x': obj
    }
    return render(request,'extracular/view_extracular.html',context)
