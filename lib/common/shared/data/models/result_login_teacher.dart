// To parse this JSON data, do
//
//     final resultLoginTeacher = resultLoginTeacherFromJson(jsonString);

import 'dart:convert';

ResultLoginTeacher resultLoginTeacherFromJson(String str) => ResultLoginTeacher.fromJson(json.decode(str));

String resultLoginTeacherToJson(ResultLoginTeacher data) => json.encode(data.toJson());

class ResultLoginTeacher {
  ResultLoginTeacher({
    this.data,
    this.error,
  });

  ResultLoginTeacherData data;
  Error error;

  factory ResultLoginTeacher.fromJson(Map<String, dynamic> json) => ResultLoginTeacher(
    data: json["data"] == null ? null : ResultLoginTeacherData.fromJson(json["data"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "error": error == null ? null : error.toJson(),
  };
}

class ResultLoginTeacherData {
  ResultLoginTeacherData({
    this.result,
    this.message,
    this.data,
  });

  bool result;
  String message;
  DataData data;

  factory ResultLoginTeacherData.fromJson(Map<String, dynamic> json) => ResultLoginTeacherData(
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
    this.nameTutor,
    this.ugsFt,
    this.token,
  });

  String id;
  String email;
  String nameTutor;
  String ugsFt;
  String token;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    nameTutor: json["name_tutor"] == null ? null : json["name_tutor"],
    ugsFt: json["ugs_ft"] == null ? null : json["ugs_ft"],
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "name_tutor": nameTutor == null ? null : nameTutor,
    "ugs_ft": ugsFt == null ? null : ugsFt,
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
