from django.shortcuts import render
from feedback.models import Feedback
import datetime

# Create your views here.
def post_feedback(request):
    ss = request.session["u_id"]
    if request.method=='POST':
        obj=Feedback()
        obj.feedback=request.POST.get('feedback')
        obj.user_id=ss
        obj.date = datetime.datetime.today()
        obj.time = datetime.datetime.now()
        obj.save()
    return render(request,'feedback/feedback.html')

def view_feedback(request):
    obj=Feedback.objects.all()
    context={
        'x':obj
    }
    return render(request,'feedback/view_feedback.html',context)