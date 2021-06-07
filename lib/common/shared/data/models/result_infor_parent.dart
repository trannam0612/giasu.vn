// To parse this JSON data, do
//
//     final resultInforParent = resultInforParentFromJson(jsonString);

import 'dart:convert';

ResultInforParent resultInforParentFromJson(String str) => ResultInforParent.fromJson(json.decode(str));

String resultInforParentToJson(ResultInforParent data) => json.encode(data.toJson());

class ResultInforParent {
  ResultInforParent({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultInforParent.fromJson(Map<String, dynamic> json) => ResultInforParent(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "error": error,
  };
}

class Data {
  Data({
    this.result,
    this.message,
    this.avatar,
    this.citId,
    this.userPhone,
    this.userName,
    this.userSex,
    this.userEmail,
    this.userBirth,
    this.userAddress,
    this.infoParent,
  });

  bool result;
  String message;
  String avatar;
  String citId;
  String userPhone;
  String userName;
  String userSex;
  String userEmail;
  DateTime userBirth;
  String userAddress;
  String infoParent;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    citId: json["cit_id"] == null ? null : json["cit_id"],
    userPhone: json["user_phone"] == null ? null : json["user_phone"],
    userName: json["user_name"] == null ? null : json["user_name"],
    userSex: json["user_sex"] == null ? null : json["user_sex"],
    userEmail: json["user_email"] == null ? null : json["user_email"],
    userBirth: json["user_birth"] == null ? null : DateTime.parse(json["user_birth"]),
    userAddress: json["user_address"] == null ? null : json["user_address"],
    infoParent: json["info_parent"] == null ? null : json["info_parent"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "avatar": avatar == null ? null : avatar,
    "cit_id": citId == null ? null : citId,
    "user_phone": userPhone == null ? null : userPhone,
    "user_name": userName == null ? null : userName,
    "user_sex": userSex == null ? null : userSex,
    "user_email": userEmail == null ? null : userEmail,
    "user_birth": userBirth == null ? null : "${userBirth.year.toString().padLeft(4, '0')}-${userBirth.month.toString().padLeft(2, '0')}-${userBirth.day.toString().padLeft(2, '0')}",
    "user_address": userAddress == null ? null : userAddress,
    "info_parent": infoParent == null ? null : infoParent,
  };
}
