// To parse this JSON data, do
//
//     final resultLogin = resultLoginFromJson(jsonString);

import 'dart:convert';

ResultLogin resultLoginFromJson(String str) => ResultLogin.fromJson(json.decode(str));

String resultLoginToJson(ResultLogin data) => json.encode(data.toJson());

class ResultLogin {
  ResultLogin({
    this.data,
    this.error,
  });

  ResultLoginData data;
  Error error;

  factory ResultLogin.fromJson(Map<String, dynamic> json) => ResultLogin(
    data: json["data"] == null ? null : ResultLoginData.fromJson(json["data"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "error": error == null ? null : error.toJson(),
  };
}

class ResultLoginData {
  ResultLoginData({
    this.result,
    this.message,
    this.data,
  });

  bool result;
  String message;
  DataData data;

  factory ResultLoginData.fromJson(Map<String, dynamic> json) => ResultLoginData(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : DataData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "data": data == null ? null : data.toJson(),
  };
}

class DataData {
  DataData({
    this.id,
    this.email,
    this.nameTeacher,
    this.token,
  });

  String id;
  String email;
  String nameTeacher;
  String token;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
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
