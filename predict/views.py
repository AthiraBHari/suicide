from django.shortcuts import render
from  suicide import settings
from pandas import read_excel
from user.models import User
from predict.models import Prediction

# Create your views here.

def predict(request,idd):
    ob=User.objects.get(user_id=idd)
    p=((int(ob.totaltask_finished)/int(ob.totaltask_assigned))*100)
    c=(int(ob.extra_c))
    context={
        'z':p,
        'y':c
    }
    if request.method=='POST':
        a1=request.POST.get('q1')
        print(a1)
        a2=request.POST.get('q2')
        print (a2)
        a3= request.POST.get('q3')
        print(a3)
        a4 = request.POST.get('q4')
        print(a4)
        a5 = request.POST.get('q5')
        print(a5)
        a6 = request.POST.get('q6')
        print(a6)
        a7 = request.POST.get('q7')
        print(a7)
        a8 = request.POST.get('q8')
        print(a8)
        a9 = request.POST.get('q9')
        print(a9)
        a10 = request.POST.get('q10')
        print(a10)
        a11 = request.POST.get('q11')
        print(a11)
        a12 = request.POST.get('q12')
        print(a12)
        a13 = request.POST.get('q13')
        print(a13)
        a14 = request.POST.get('q14')
        print(a14)
        imgpath = str(settings.BASE_DIR) + str(settings.STATIC_URL) + "mentalhealth.xlsx"
        data = read_excel(imgpath, "Sheet1")
        X = data.iloc[:, 0:14].values
        y = data.iloc[:, 14].values
        test = [float(a1), float(a2), float(a3), float(a4), float(a5), float(a6), float(a7) ,float(a8),float(a9),float(a10),float(a11),float(a12),float(a13),float(a14)]
        from sklearn.ensemble import RandomForestClassifier
        sv = RandomForestClassifier(n_estimators=100)
        sv.fit(X, y)
        res = sv.predict([test])
        print(res[0])
        context = {
            'kk': res[0],

        }
        if Prediction.objects.filter(user_id=idd).exists():
            ob=Prediction.objects.get(user_id=idd)
            ob.result=res
            ob.save()
        else:
            ob=Prediction()
            ob.user_id=idd
            ob.result=res
            ob.save()
        return render(request, 'predict/results.html', context)
    return render(request, 'predict/prediction.html', context)


def view_result(request):
    obj=Prediction.objects.all()
    context={
        'x':obj
    }
    return render(request,'predict/view.html',context)




