// To parse this JSON data, do
//
//     final resultConfirmOtpForgot = resultConfirmOtpForgotFromJson(jsonString);

import 'dart:convert';

ResultConfirmOtpForgot resultConfirmOtpForgotFromJson(String str) => ResultConfirmOtpForgot.fromJson(json.decode(str));

String resultConfirmOtpForgotToJson(ResultConfirmOtpForgot data) => json.encode(data.toJson());

class ResultConfirmOtpForgot {
  ResultConfirmOtpForgot({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultConfirmOtpForgot.fromJson(Map<String, dynamic> json) => ResultConfirmOtpForgot(
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
  });

  bool result;
  String message;
  String accessToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    accessToken: json["access_token"] == null ? null : json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "access_token": accessToken == null ? null : accessToken,
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