from rest_framework import serializers
from UsersData.models import Users, Eps, Roles

class UserSerializer(serializers.ModelSerializer):
     class Meta:
          model = Users
          fields = ('UserId', 'UserName', 'UserDocument', 'UserPassword', 'UserGenre', 'UserDateOfBorn', 'UserPhone', 'UserEpsId', 'UserRoleId', 'UserCreation')


class EpsSerializer(serializers.ModelSerializer):
     class Meta: 
          model = Eps
          fields = ('EpsId', 'EpsName')


class RoleSerializer(serializers.ModelSerializer):
     class Meta: 
          model = Roles 
          fields = ('RoleId', 'RoleName')