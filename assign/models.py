from django.db import models
from task.models import Task
from user.models import User

# Create your models here.
class Assign(models.Model):
    assign_id = models.AutoField(primary_key=True)
    #task_id = models.IntegerField()
    task=models.ForeignKey(Task,on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField()
    status = models.CharField(max_length=45)
    # user_id = models.IntegerField()
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    upload = models.CharField(max_length=400)
    up_date = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'assign'

