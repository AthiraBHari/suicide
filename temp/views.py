from django.shortcuts import render
# Create your views here.

def home(request):

    return render(request,'temp/home.html')

def admin_home(request):

    return render(request,'temp/admin home.html')

def counsellor_home(request):

    return render(request,'temp/counsellor home.html')

def student_home(request):

    return render(request,'temp/student home.html')

def about(request):

    return render(request,'temp/about.html')
def student_view(request):

    return render(request,'temp/student_view.html')
def counsellor_view(request):

    return render(request,'temp/counsellor_view.html')
def admin_view(request):

    return render(request,'temp/admin_view.html')
def login(request):

    return render(request,'temp/login.html')

