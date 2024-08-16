from django.db.models import Q
from django.shortcuts import render
from user.models import User
from login.models import Login
from django.core.paginator import Paginator

# Create your views here.
def post_user(request):
    obk = ""
    if request.method == 'POST':
        a = request.POST.get('phone')
        b = request.POST.get('email')
        obv = User.objects.filter(Q(phone=a) & (Q(email=b) | Q(phone=a) | Q(email=b)))
        if len(obv) > 0:
            obk = "User exist"
        else:
            obj=User()
            obj.name=request.POST.get('username')
            obj.email=request.POST.get('email')
            obj.phone=request.POST.get('phone')
            obj.age=request.POST.get('age')
            obj.gender=request.POST.get('gender')
            obj.qualification=request.POST.get('qualification')
            obj.password=request.POST.get('password')
            obj.extra_c=0
            obj.totaltask_assigned=0
            obj.totaltask_finished=0
            obj.save()
            ob=Login()
            ob.username=obj.email
            ob.password=obj.password
            ob.u_id=obj.user_id
            ob.type='user'
            ob.save()
            obk="Successfully Registered"
    context={
        'msg':obk
    }
    return render(request, 'user/userregister.html', context)


def view_user(request):
     obj=User.objects.all()
     paginator = Paginator(obj, 5)
     page_number = request.GET.get('page')
     users = paginator.get_page(page_number)
     context={
         'x':obj,
          'users':users
     }
     return render(request, 'user/view_user.html',context)


# def view_user(request):
#     user_list = User.objects.all()
#
#     # Pagination logic
#     paginator = Paginator(user_list, 5)  # Show 10 users per page
#     page_number = request.GET.get('page')
#     users = paginator.get_page(page_number)
#
#     return render(request, 'user/view_user.html', {'users': users})


def predict(request):
    ss=request.session["u_id"]
    obj=User.objects.filter(user_id=ss)
    context={
        'x':obj
    }
    return render(request, 'user/predic.html',context)


def adminview_user(request):
    obj = User.objects.all()
    paginator = Paginator(obj, 5)
    page_number = request.GET.get('page')
    users = paginator.get_page(page_number)
    context = {
        'x': obj,
        'users': users
    }
    return render(request, 'user/adminview_user.html', context)
