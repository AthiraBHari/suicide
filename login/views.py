from django.http import HttpResponseRedirect
from django.shortcuts import render
from login.models import Login

# Create your views here.
def post_login(request):
    if request.method == "POST":
        eml = request.POST.get("uname")
        passw = request.POST.get("pass")
        obj = Login.objects.filter(username=eml, password=passw)
        tp = ""
        for ob in obj:
            tp = ob.type
            uid = ob.u_id
            if tp == "admin":
                request.session["u_id"] = uid
                return HttpResponseRedirect('/temp/admin/')
            elif tp == "user":
                request.session["u_id"] = uid
                return HttpResponseRedirect('/temp/student/')
            elif tp == "counsellor":
                request.session["u_id"] = uid
                return HttpResponseRedirect('/temp/counsellor/')
        else:
            objlist = "email or password incorrect...please try again...."
            context = {
                'msg': objlist,
            }
            return render(request, 'login/login.html', context)
    return render(request, 'login/login.html')
