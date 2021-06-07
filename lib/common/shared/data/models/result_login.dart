// To parse this JSON data, do
//
//     final resultDataLogin = resultDataLoginFromJson(jsonString);

import 'dart:convert';

ResultDataLogin resultDataLoginFromJson(String str) => ResultDataLogin.fromJson(json.decode(str));

String resultDataLoginToJson(ResultDataLogin data) => json.encode(data.toJson());

class ResultDataLogin {
  ResultDataLogin({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultDataLogin.fromJson(Map<String, dynamic> json) => ResultDataLogin(
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
    this.epId,
    this.epEmail,
    this.epName,
    this.userType,
    this.avatar,
    this.createdAt,
  });

  String epId;
  String epEmail;
  String epName;
  String userType;
  String avatar;
  dynamic createdAt;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    epId: json["ep_id"] == null ? null : json["ep_id"],
    epEmail: json["ep_email"] == null ? null : json["ep_email"],
    epName: json["ep_name"] == null ? null : json["ep_name"],
    userType: json["user_type"] == null ? null : json["user_type"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "ep_id": epId == null ? null : epId,
    "ep_email": epEmail == null ? null : epEmail,
    "ep_name": epName == null ? null : epName,
    "user_type": userType == null ? null : userType,
    "avatar": avatar == null ? null : avatar,
    "created_at": createdAt,
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
