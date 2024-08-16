from django.db import models
from user.models import User
# Create your models here.

class Prediction(models.Model):
    prediction_id = models.AutoField(primary_key=True)
    # user_id = models.IntegerField()
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    result = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'prediction'

