from django.db import models
# from user.models import User
# Create your models here.
class Task(models.Model):
    task_id = models.AutoField(primary_key=True)
    task = models.CharField(max_length=45)
    upload_task = models.CharField(max_length=450)
    status = models.CharField(max_length=45)
    # # user_id= models.CharField(max_length=45)
    # user = models.ForeignKey(User, on_delete=models.CASCADE)
    due_date = models.DateField()


    class Meta:
        managed = False
        db_table = 'task'

