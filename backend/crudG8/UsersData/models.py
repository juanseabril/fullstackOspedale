from django.db import models

class Users(models.Model):
     UserId = models.AutoField(primary_key=True)
     UserName = models.CharField(max_length=500)
     UserDocument = models.FloatField(max_length=50)
     UserPassword = models.CharField(max_length=500)
     UserGenre = models.CharField(max_length=500)
     UserDateOfBorn = models.CharField(max_length=500)
     UserPhone = models.FloatField(max_length=50)
     UserEpsId = models.CharField(max_length=500)
     UserRoleId = models.CharField(max_length=500)
     UserCreation = models.CharField(max_length=500)

class Eps(models.Model):
     EpsId = models.AutoField(primary_key=True)
     EpsName = models.CharField(max_length=500)

class Roles(models.Model):
     RoleId = models.AutoField(primary_key=True)
     RoleName = models.CharField(max_length=500)