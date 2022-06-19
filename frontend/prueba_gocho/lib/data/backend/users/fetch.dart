// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../domain/models/listusers.dart';
import '../../../domain/models/user.dart';

class ApiService {
  String url_users = 'http://127.0.0.1:8000/user';
  String url_names = 'http://127.0.0.1:8000/listusers';
  String url_userbyname = 'http://127.0.0.1:8000/userbyname/';

  Future<List<User>?> getUsers() async {
    try {
      var response = await http.get(Uri.parse(url_users));
      if (response.statusCode == 200) {
        List<User> _model = userFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<User?> postUser(User user) async {
    Map data = {
      "UserId": user.userId,
      "UserName": user.userName,
      "UserDocument": user.userDocument,
      "UserPassword": user.userPassword,
      "UserGenre": user.userGenre,
      "UserDateOfBorn": user.userDateOfBorn,
      "UserPhone": user.userPhone,
      "UserEpsId": user.userEpsId,
      "UserRoleId": user.userRoleId,
      "UserCreation": user.userCreation,
    };

    final Response response = await post(
      Uri.parse(url_users),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<User?> putUser(User user) async {
    Map data = {
      "UserId": user.userId,
      "UserName": user.userName,
      "UserDocument": user.userDocument,
      "UserPassword": user.userPassword,
      "UserGenre": user.userGenre,
      "UserDateOfBorn": user.userDateOfBorn,
      "UserPhone": user.userPhone,
      "UserEpsId": user.userEpsId,
      "UserRoleId": user.userRoleId,
      "UserCreation": user.userCreation,
    };
    final Response response = await put(
      Uri.parse("$url_users/${user.userId}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to put cases');
    }
  }

  Future<User?> deleteUser(int id) async {
    try {
      var response = await http.delete(Uri.parse("$url_users/$id"));
      if (response.statusCode == 200) {
        throw Exception('Producto eliminado');
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<List?> getListUsers() async {
    try {
      var response = await http.get(Uri.parse(url_names));
      if (response.statusCode == 200) {
        List _model = listUsersFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<User?> getUserByName(String name) async {
    try {
      var response = await http.get(Uri.parse(url_userbyname + name));
      if (response.statusCode == 200) {
        User _model = userOnlyFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
