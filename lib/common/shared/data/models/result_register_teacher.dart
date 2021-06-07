// To parse this JSON data, do
//
//     final resultRegisterTeacher = resultRegisterTeacherFromJson(jsonString);

import 'dart:convert';

ResultRegisterTeacher resultRegisterTeacherFromJson(String str) => ResultRegisterTeacher.fromJson(json.decode(str));

String resultRegisterTeacherToJson(ResultRegisterTeacher data) => json.encode(data.toJson());

class ResultRegisterTeacher {
  ResultRegisterTeacher({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultRegisterTeacher.fromJson(Map<String, dynamic> json) => ResultRegisterTeacher(
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
    this.refreshToken,
    this.userInfo,
  });

  bool result;
  String message;
  String accessToken;
  RefreshToken refreshToken;
  UserInfo userInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    accessToken: json["access_token"] == null ? null : json["access_token"],
    refreshToken: json["refresh_token"] == null ? null : RefreshToken.fromJson(json["refresh_token"]),
    userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "access_token": accessToken == null ? null : accessToken,
    "refresh_token": refreshToken == null ? null : refreshToken.toJson(),
    "user_info": userInfo == null ? null : userInfo.toJson(),
  };
}

class RefreshToken {
  RefreshToken({
    this.userEmail,
    this.otp,
    this.id,
    this.userPhone,
    this.userAddress,
    this.userAvatar,
  });

  String userEmail;
  int otp;
  int id;
  String userPhone;
  String userAddress;
  String userAvatar;

  factory RefreshToken.fromJson(Map<String, dynamic> json) => RefreshToken(
    userEmail: json["user_email"] == null ? null : json["user_email"],
    otp: json["otp"] == null ? null : json["otp"],
    id: json["id"] == null ? null : json["id"],
    userPhone: json["user_phone"] == null ? null : json["user_phone"],
    userAddress: json["user_address"] == null ? null : json["user_address"],
    userAvatar: json["user_avatar"] == null ? null : json["user_avatar"],
  );

  Map<String, dynamic> toJson() => {
    "user_email": userEmail == null ? null : userEmail,
    "otp": otp == null ? null : otp,
    "id": id == null ? null : id,
    "user_phone": userPhone == null ? null : userPhone,
    "user_address": userAddress == null ? null : userAddress,
    "user_avatar": userAvatar == null ? null : userAvatar,
  };
}

class UserInfo {
  UserInfo({
    this.epAvatar,
    this.epTelephone,
    this.epAddress,
    this.epCity,
    this.epDistrict,
  });

  String epAvatar;
  String epTelephone;
  String epAddress;
  String epCity;
  String epDistrict;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    epAvatar: json["ep_avatar"] == null ? null : json["ep_avatar"],
    epTelephone: json["ep_telephone"] == null ? null : json["ep_telephone"],
    epAddress: json["ep_address"] == null ? null : json["ep_address"],
    epCity: json["ep_city"] == null ? null : json["ep_city"],
    epDistrict: json["ep_district"] == null ? null : json["ep_district"],
  );

  Map<String, dynamic> toJson() => {
    "ep_avatar": epAvatar == null ? null : epAvatar,
    "ep_telephone": epTelephone == null ? null : epTelephone,
    "ep_address": epAddress == null ? null : epAddress,
    "ep_city": epCity == null ? null : epCity,
    "ep_district": epDistrict == null ? null : epDistrict,
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
