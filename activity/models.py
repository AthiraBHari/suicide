from django.db import models
from user.models import User
# Create your models here.

class Activity(models.Model):
    activity_id = models.AutoField(primary_key=True)
    activity_name = models.CharField(max_length=45)
    date = models.DateField(blank=True, null=True)
    time = models.TimeField()
    status = models.CharField(max_length=45)
    # user_id = models.IntegerField()
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    due_date = models.DateField()


    class Meta:
        managed = False
        db_table = 'activity'

