from django.db import models

# Create your models here.
class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=45)
    email = models.CharField(max_length=45)
    phone = models.CharField(max_length=45)
    age = models.CharField(max_length=45)
    gender = models.CharField(max_length=45)
    qualification = models.CharField(max_length=45)
    password = models.CharField(max_length=45)
    extra_c = models.CharField(max_length=45)
    totaltask_assigned = models.IntegerField(default=0)
    totaltask_finished = models.IntegerField(default=0)

    class Meta:
        managed = False
        db_table = 'user'


