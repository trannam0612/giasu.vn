// To parse this JSON data, do
//
//     final resultChangePass = resultChangePassFromJson(jsonString);

import 'dart:convert';

ResultChangePass resultChangePassFromJson(String str) => ResultChangePass.fromJson(json.decode(str));

String resultChangePassToJson(ResultChangePass data) => json.encode(data.toJson());

class ResultChangePass {
  ResultChangePass({
    this.result,
    this.mesage,
    this.data,
    this.error,
  });

  bool result;
  String mesage;
  Data data;
  Error error;

  factory ResultChangePass.fromJson(Map<String, dynamic> json) => ResultChangePass(
    result: json["result"] == null ? null : json["result"],
    mesage: json["mesage"] == null ? null : json["mesage"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "mesage": mesage == null ? null : mesage,
    "data": data == null ? null : data.toJson(),
    "error": error == null ? null : error.toJson(),
  };
}

class Data {
  Data({
    this.userInfo,
  });

  UserInfo userInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
  );

  Map<String, dynamic> toJson() => {
    "user_info": userInfo == null ? null : userInfo.toJson(),
  };
}

class UserInfo {
  UserInfo({
    this.epId,
  });

  String epId;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    epId: json["ep_id"] == null ? null : json["ep_id"],
  );

  Map<String, dynamic> toJson() => {
    "ep_id": epId == null ? null : epId,
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
