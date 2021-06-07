// To parse this JSON data, do
//
//     final resultDeleteTeacherSaved = resultDeleteTeacherSavedFromJson(jsonString);

import 'dart:convert';

ResultDeleteTeacherSaved resultDeleteTeacherSavedFromJson(String str) => ResultDeleteTeacherSaved.fromJson(json.decode(str));

String resultDeleteTeacherSavedToJson(ResultDeleteTeacherSaved data) => json.encode(data.toJson());

class ResultDeleteTeacherSaved {
  ResultDeleteTeacherSaved({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultDeleteTeacherSaved.fromJson(Map<String, dynamic> json) => ResultDeleteTeacherSaved(
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
    this.userInfo,
  });

  bool result;
  String message;
  UserInfo userInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "user_info": userInfo == null ? null : userInfo.toJson(),
  };
}

class UserInfo {
  UserInfo({
    this.epId,
    this.epEmail,
    this.epName,
  });

  String epId;
  String epEmail;
  String epName;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    epId: json["ep_id"] == null ? null : json["ep_id"],
    epEmail: json["ep_email"] == null ? null : json["ep_email"],
    epName: json["ep_name"] == null ? null : json["ep_name"],
  );

  Map<String, dynamic> toJson() => {
    "ep_id": epId == null ? null : epId,
    "ep_email": epEmail == null ? null : epEmail,
    "ep_name": epName == null ? null : epName,
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
