from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from rest_framework.parsers import JSONParser
from django.http.response import JsonResponse

from UsersData.models import Users, Eps, Roles
from UsersData.serializers import UserSerializer, EpsSerializer, RoleSerializer

@csrf_exempt
def userApi(request,id=0):
    if request.method=='GET':
        users = Users.objects.all()
        users_serializer=UserSerializer(users,many=True)
        return JsonResponse(users_serializer.data,safe=False)
    elif request.method=='POST':
        user_data=JSONParser().parse(request)
        users_serializer=UserSerializer(data=user_data)
        if users_serializer.is_valid():
            users_serializer.save()
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    elif request.method=='PUT':
        user_data=JSONParser().parse(request)
        user=Users.objects.get(UserId=user_data['UserId'])
        users_serializer=UserSerializer(user,data=user_data)
        if users_serializer.is_valid():
            users_serializer.save()
            return JsonResponse("Updated Successfully",safe=False)
        return JsonResponse("Failed to Update")
    elif request.method=='DELETE':
        user=Users.objects.get(UserId=id)
        user.delete()
        return JsonResponse("Deleted Successfully",safe=False)


def listUsersApi(request):
    if request.method=='GET':
        users = Users.objects.all()
        users_serializer = UserSerializer(users,many=True)
        test = users_serializer.data
        listUsers = []
        for i in test:
            cont = 0
            for key, value in i.items():
                if cont == 1:
                    listUsers.append(value)
                cont += 1

        return JsonResponse(listUsers,safe=False)
    return JsonResponse("Solo se acepta petición GET",safe=False)


def userByName(request, string):
    if request.method=='GET':
        users = Users.objects.all()
        users_serializer=UserSerializer(users,many=True)
        test = users_serializer.data
        for i in test:
            cont = 0
            for key, value in i.items():
                if cont == 1:
                    if value == string:
                        return JsonResponse(i,safe=False)
                    #listUsers.append(value)
                cont += 1

    return JsonResponse("Solo se acepta petición GET",safe=False) 


@csrf_exempt
def epsApi(request,id=0):
    if request.method=='GET':
        epss = Eps.objects.all()
        eps_serializer=EpsSerializer(epss,many=True)
        return JsonResponse(eps_serializer.data,safe=False)
    elif request.method=='POST':
        eps_data=JSONParser().parse(request)
        eps_serializer=EpsSerializer(data=eps_data)
        if eps_serializer.is_valid():
            eps_serializer.save()
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    elif request.method=='PUT':
        eps_data=JSONParser().parse(request)
        eps=Eps.objects.get(UserId=eps_data['UserId'])
        eps_serializer=EpsSerializer(eps,data=eps_data)
        if eps_serializer.is_valid():
            eps_serializer.save()
            return JsonResponse("Updated Successfully",safe=False)
        return JsonResponse("Failed to Update")
    elif request.method=='DELETE':
        eps=Eps.objects.get(UserId=id)
        eps.delete()
        return JsonResponse("Deleted Successfully",safe=False)


@csrf_exempt
def roleApi(request,id=0):
    if request.method=='GET':
        roles = Roles.objects.all()
        roles_serializer=RoleSerializer(roles,many=True)
        return JsonResponse(roles_serializer.data,safe=False)
    elif request.method=='POST':
        role_data=JSONParser().parse(request)
        roles_serializer=RoleSerializer(data=role_data)
        if roles_serializer.is_valid():
            roles_serializer.save()
            return JsonResponse("Added Successfully",safe=False)
        return JsonResponse("Failed to Add",safe=False)
    elif request.method=='PUT':
        role_data=JSONParser().parse(request)
        role=Roles.objects.get(UserId=role_data['UserId'])
        roles_serializer=RoleSerializer(role,data=role_data)
        if roles_serializer.is_valid():
            roles_serializer.save()
            return JsonResponse("Updated Successfully",safe=False)
        return JsonResponse("Failed to Update")
    elif request.method=='DELETE':
        role=Roles.objects.get(UserId=id)
        role.delete()
        return JsonResponse("Deleted Successfully",safe=False)