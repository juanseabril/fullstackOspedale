import 'dart:convert';

List<String> listUsersFromJson(String str) =>
    List<String>.from(json.decode(str).map((x) => x));

String listUsersToJson(List<String> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x)));
