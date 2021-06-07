// To parse this JSON data, do
//
//     final resultPointMinus = resultPointMinusFromJson(jsonString);

import 'dart:convert';

ResultPointMinus resultPointMinusFromJson(String str) => ResultPointMinus.fromJson(json.decode(str));

String resultPointMinusToJson(ResultPointMinus data) => json.encode(data.toJson());

class ResultPointMinus {
  ResultPointMinus({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultPointMinus.fromJson(Map<String, dynamic> json) => ResultPointMinus(
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
    this.infoTeacher,
  });

  bool result;
  String message;
  InfoTeacher infoTeacher;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    infoTeacher: json["info_teacher"] == null ? null : InfoTeacher.fromJson(json["info_teacher"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "info_teacher": infoTeacher == null ? null : infoTeacher.toJson(),
  };
}

class InfoTeacher {
  InfoTeacher({
    this.id,
    this.avatar,
    this.userName,
    this.userEmail,
    this.userPhone,
    this.subject,
  });

  String id;
  String avatar;
  String userName;
  String userEmail;
  String userPhone;
  String subject;

  factory InfoTeacher.fromJson(Map<String, dynamic> json) => InfoTeacher(
    id: json["id"] == null ? null : json["id"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    userName: json["user_name"] == null ? null : json["user_name"],
    userEmail: json["user_email"] == null ? null : json["user_email"],
    userPhone: json["user_phone"] == null ? null : json["user_phone"],
    subject: json["subject"] == null ? null : json["subject"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "avatar": avatar == null ? null : avatar,
    "user_name": userName == null ? null : userName,
    "user_email": userEmail == null ? null : userEmail,
    "user_phone": userPhone == null ? null : userPhone,
    "subject": subject == null ? null : subject,
  };
}

class Error {
  Error({
    this.code,
    this.message,
  });

  int code;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}
