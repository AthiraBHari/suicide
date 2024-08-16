from django.db import models
from user.models import User

class Extracular(models.Model):
    extracular_id = models.AutoField(primary_key=True)
    activities = models.CharField(max_length=45)
    date = models.DateField()
    time = models.TimeField()
    status = models.CharField(max_length=45)
    # user_id = models.IntegerField()
    user=models.ForeignKey(User,on_delete=models.CASCADE)

    class Meta:
        managed = False
        db_table = 'extracular'


