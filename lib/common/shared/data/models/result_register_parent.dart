// To parse this JSON data, do
//
//     final resultDataRegisterParent = resultDataRegisterParentFromJson(jsonString);

import 'dart:convert';

ResultDataRegisterParent resultDataRegisterParentFromJson(String str) => ResultDataRegisterParent.fromJson(json.decode(str));

String resultDataRegisterParentToJson(ResultDataRegisterParent data) => json.encode(data.toJson());

class ResultDataRegisterParent {
  ResultDataRegisterParent({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultDataRegisterParent.fromJson(Map<String, dynamic> json) => ResultDataRegisterParent(
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
    this.accessToken,
    this.userInfo,
  });

  bool result;
  String message;
  String accessToken;
  UserInfo userInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    accessToken: json["access_token"] == null ? null : json["access_token"],
    userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "access_token": accessToken == null ? null : accessToken,
    "user_info": userInfo == null ? null : userInfo.toJson(),
  };
}

class UserInfo {
  UserInfo({
    this.epName,
    this.epEmail,
  });

  String epName;
  String epEmail;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    epName: json["ep_name"] == null ? null : json["ep_name"],
    epEmail: json["ep_email"] == null ? null : json["ep_email"],
  );

  Map<String, dynamic> toJson() => {
    "ep_name": epName == null ? null : epName,
    "ep_email": epEmail == null ? null : epEmail,
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
