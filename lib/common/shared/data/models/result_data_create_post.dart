// To parse this JSON data, do
//
//     final resultDataCreatePost = resultDataCreatePostFromJson(jsonString);

import 'dart:convert';

ResultDataCreatePost resultDataCreatePostFromJson(String str) => ResultDataCreatePost.fromJson(json.decode(str));

String resultDataCreatePostToJson(ResultDataCreatePost data) => json.encode(data.toJson());

class ResultDataCreatePost {
  ResultDataCreatePost({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultDataCreatePost.fromJson(Map<String, dynamic> json) => ResultDataCreatePost(
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
    this.epIdUser,
  });

  String epIdUser;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    epIdUser: json["ep_id_user"] == null ? null : json["ep_id_user"],
  );

  Map<String, dynamic> toJson() => {
    "ep_id_user": epIdUser == null ? null : epIdUser,
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
