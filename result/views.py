from django.shortcuts import render
from result.models import Result

# Create your views here.
def post_result(request):
    if request.method=='POST':
        obj=Result()
        obj.result_type=request.POST.get('result')
        obj.description=request.POST.get('desc')
        obj.save()

    return render(request,'result/post_result.html')
def view_result(request):
    obj=Result.objects.all()
    context={
        'x':obj
    }
    return render(request,'result/view_result.html',context)