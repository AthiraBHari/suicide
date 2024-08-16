from django.shortcuts import render
from appointment.models import Appointment
from counsellor.models import Counsellor
# Create your views here.

def post_appointment(request):
    message=""
    ob = Counsellor.objects.all()
    context = {
        'a': ob,
        'msg':message
    }
    ss= request.session["u_id"]
    if request.method=='POST':
        obj=Appointment()
        obj.user_id=ss
        obj.counsellor_id=request.POST.get('counsname')
        obj.date=request.POST.get('date')
        obj.time=request.POST.get('time')
        obj.status='pending'
        obj.save()
        message="Appointment Booked"
        context['msg'] = message

    return render(request, 'appointment/appointment.html', context)



def accept(request, idd):
    obj = Appointment.objects.get(appointment_id=idd)
    obj.status = 'accepted'
    obj.save()
    success_msg = "Appointment accepted successfully."
    return view_appointment(request, success_msg=success_msg)

def reject(request, idd):
    obj = Appointment.objects.get(appointment_id=idd)
    obj.status = 'rejected'
    obj.save()
    success_msg = "Appointment rejected successfully."
    return view_appointment(request, success_msg=success_msg)

def view_appointment(request, success_msg=None):
    ss = request.session["u_id"]
    obj = Appointment.objects.filter(counsellor_id=ss)
    context = {
        'x': obj,
        'msg': success_msg  # Pass the success message to the template
    }
    return render(request, 'appointment/view_appointment.html', context)

def student_appoint(request):
    vv = request.session["u_id"]
    obj = Appointment.objects.filter(user_id=vv)
    context={
        'x':obj
    }
    return render(request, 'appointment/student_appoint.html', context)
