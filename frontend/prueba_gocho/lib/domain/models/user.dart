// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

User userOnlyFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.userId,
    required this.userName,
    required this.userDocument,
    required this.userPassword,
    required this.userGenre,
    required this.userDateOfBorn,
    required this.userPhone,
    required this.userEpsId,
    required this.userRoleId,
    required this.userCreation,
  });

  int userId;
  String userName;
  int userDocument;
  String userPassword;
  String userGenre;
  String userDateOfBorn;
  int userPhone;
  String userEpsId;
  dynamic userRoleId;
  String userCreation;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["UserId"],
        userName: json["UserName"],
        userDocument: json["UserDocument"],
        userPassword: json["UserPassword"],
        userGenre: json["UserGenre"],
        userDateOfBorn: json["UserDateOfBorn"],
        userPhone: json["UserPhone"],
        userEpsId: json["UserEpsId"],
        userRoleId: json["UserRoleId"],
        userCreation: json["UserCreation"],
      );

  Map<String, dynamic> toJson() => {
        "UserId": userId,
        "UserName": userName,
        "UserDocument": userDocument,
        "UserPassword": userPassword,
        "UserGenre": userGenre,
        "UserDateOfBorn": userDateOfBorn,
        "UserPhone": userPhone,
        "UserEpsId": userEpsId,
        "UserRoleId": userRoleId,
        "UserCreation": userCreation,
      };
}
