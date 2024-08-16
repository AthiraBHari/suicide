from django.db import models
from user.models import User
from counsellor.models import Counsellor
# Create your models here.

class Appointment(models.Model):
    appointment_id = models.AutoField(primary_key=True)
    date = models.DateField()
    time = models.TimeField()
    #user_id = models.IntegerField()
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    #counsellor_id = models.IntegerField()
    counsellor=models.ForeignKey(Counsellor,on_delete=models.CASCADE)
    status = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'appointment'
