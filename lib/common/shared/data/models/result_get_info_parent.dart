// To parse this JSON data, do
//
//     final resultGetInfoParent = resultGetInfoParentFromJson(jsonString);

import 'dart:convert';

ResultGetInfoParent resultGetInfoParentFromJson(String str) => ResultGetInfoParent.fromJson(json.decode(str));

String resultGetInfoParentToJson(ResultGetInfoParent data) => json.encode(data.toJson());

class ResultGetInfoParent {
  ResultGetInfoParent({
    this.data,
    this.error,
  });

  ResultGetInfoParentData data;
  Error error;

  factory ResultGetInfoParent.fromJson(Map<String, dynamic> json) => ResultGetInfoParent(
    data: json["data"] == null ? null : ResultGetInfoParentData.fromJson(json["data"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "error": error == null ? null : error.toJson(),
  };
}

class ResultGetInfoParentData {
  ResultGetInfoParentData({
    this.result,
    this.message,
    this.data,
  });

  bool result;
  String message;
  DataData data;

  factory ResultGetInfoParentData.fromJson(Map<String, dynamic> json) => ResultGetInfoParentData(
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
    this.ugsPhone,
    this.ugsName,
    this.ugsAvatar,
    this.ugsEmail,
    this.ugsPassword,
    this.ugsGender,
    this.ugsBrithday,
    this.citName,
    this.ugsAddress,
  });

  String ugsPhone;
  String ugsName;
  String ugsAvatar;
  String ugsEmail;
  String ugsPassword;
  String ugsGender;
  String ugsBrithday;
  String citName;
  String ugsAddress;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    ugsPhone: json["ugs_phone"] == null ? null : json["ugs_phone"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    ugsEmail: json["ugs_email"] == null ? null : json["ugs_email"],
    ugsPassword: json["ugs_password"] == null ? null : json["ugs_password"],
    ugsGender: json["ugs_gender"] == null ? null : json["ugs_gender"],
    ugsBrithday: json["ugs_brithday"] == null ? null : json["ugs_brithday"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
    ugsAddress: json["ugs_address"] == null ? null : json["ugs_address"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_phone": ugsPhone == null ? null : ugsPhone,
    "ugs_name": ugsName == null ? null : ugsName,
    "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
    "ugs_email": ugsEmail == null ? null : ugsEmail,
    "ugs_password": ugsPassword == null ? null : ugsPassword,
    "ugs_gender": ugsGender == null ? null : ugsGender,
    "ugs_brithday": ugsBrithday == null ? null : ugsBrithday,
    "cit_name": citName == null ? null : citName,
    "ugs_address": ugsAddress == null ? null : ugsAddress,
  };
}

class Error {
  Error({
    this.result,
    this.message,
  });

  bool result;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
  };
}
