from django.db import models

# Create your models here.
class Result(models.Model):
    result_id = models.IntegerField(primary_key=True)
    result_type = models.CharField(max_length=45)
    description = models.CharField(max_length=45)

    class Meta:
        managed = False
        db_table = 'result'

