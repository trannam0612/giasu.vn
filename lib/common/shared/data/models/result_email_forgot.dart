// To parse this JSON data, do
//
//     final resultEmailForgot = resultEmailForgotFromJson(jsonString);

import 'dart:convert';

ResultEmailForgot resultEmailForgotFromJson(String str) => ResultEmailForgot.fromJson(json.decode(str));

String resultEmailForgotToJson(ResultEmailForgot data) => json.encode(data.toJson());

class ResultEmailForgot {
  ResultEmailForgot({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultEmailForgot.fromJson(Map<String, dynamic> json) => ResultEmailForgot(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "error": error == null ? null : error.toJson(),
  };
}

class Data {
  Data({
    this.result,
    this.message,
    this.dataUser,
  });

  bool result;
  String message;
  DataUser dataUser;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    dataUser: json["dataUser"] == null ? null : DataUser.fromJson(json["dataUser"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "dataUser": dataUser == null ? null : dataUser.toJson(),
  };
}

class DataUser {
  DataUser({
    this.id,
    this.email,
    this.nameTeacher,
    this.token,
  });

  String id;
  String email;
  String nameTeacher;
  String token;

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
    id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    nameTeacher: json["name_teacher"] == null ? null : json["name_teacher"],
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "name_teacher": nameTeacher == null ? null : nameTeacher,
    "token": token == null ? null : token,
  };
}

class Error {
  Error({
    this.result,
    this.code,
    this.message,
  });

  bool result;
  int code;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    result: json["result"] == null ? null : json["result"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}
