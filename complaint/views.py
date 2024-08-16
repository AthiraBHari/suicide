from django.shortcuts import render
from complaint.models import Complaint
import datetime
# Create your views here.

def post_complaints(request):
    ss = request.session["u_id"]
    if request.method=='POST':
        obj=Complaint()
        obj.complaint=request.POST.get('com')
        obj.replay='pending'
        obj.user_id=ss
        obj.date=datetime.datetime.today()
        obj.time=datetime.datetime.now()
        obj.save()
    return render(request, 'complaint/complaint.html')

def view_complaint(request):
    obj=Complaint.objects.all()
    context={
        'x':obj
    }
    return render(request, 'complaint/view_complaint.html',context)

def add_repaly(request,idd):
    if request.method=='POST':
        obj=Complaint.objects.get(complaintid=idd)
        obj.replay=request.POST.get('replay')
        obj.save()
        return view_complaint(request)
    return render(request,'complaint/post_reply.html')

def view_replay(request):
    ss = request.session["u_id"]
    obj=Complaint.objects.filter(user_id=ss)
    context={
        'x':obj
    }
    return render(request, 'complaint/view_reply.html',context)
