// To parse this JSON data, do
//
//     final resultRegister = resultRegisterFromJson(jsonString);

import 'dart:convert';

ResultRegister resultRegisterFromJson(String str) => ResultRegister.fromJson(json.decode(str));

String resultRegisterToJson(ResultRegister data) => json.encode(data.toJson());

class ResultRegister {
  ResultRegister({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultRegister.fromJson(Map<String, dynamic> json) => ResultRegister(
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
    this.accessToken,
    this.userInfor,
  });

  bool result;
  String message;
  String accessToken;
  UserInfor userInfor;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    accessToken: json["access_token"] == null ? null : json["access_token"],
    userInfor: json["user_infor"] == null ? null : UserInfor.fromJson(json["user_infor"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "access_token": accessToken == null ? null : accessToken,
    "user_infor": userInfor == null ? null : userInfor.toJson(),
  };
}

class UserInfor {
  UserInfor({
    this.useId,
    this.useEmail,
    this.useFirstName,
    this.authentic,
  });

  int useId;
  String useEmail;
  String useFirstName;
  int authentic;

  factory UserInfor.fromJson(Map<String, dynamic> json) => UserInfor(
    useId: json["use_id"] == null ? null : json["use_id"],
    useEmail: json["use_email"] == null ? null : json["use_email"],
    useFirstName: json["use_first_name"] == null ? null : json["use_first_name"],
    authentic: json["authentic"] == null ? null : json["authentic"],
  );

  Map<String, dynamic> toJson() => {
    "use_id": useId == null ? null : useId,
    "use_email": useEmail == null ? null : useEmail,
    "use_first_name": useFirstName == null ? null : useFirstName,
    "authentic": authentic == null ? null : authentic,
  };
}
