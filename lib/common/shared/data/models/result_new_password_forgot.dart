// To parse this JSON data, do
//
//     final resultNewPasswordForgot = resultNewPasswordForgotFromJson(jsonString);

import 'dart:convert';

ResultNewPasswordForgot resultNewPasswordForgotFromJson(String str) => ResultNewPasswordForgot.fromJson(json.decode(str));

String resultNewPasswordForgotToJson(ResultNewPasswordForgot data) => json.encode(data.toJson());

class ResultNewPasswordForgot {
  ResultNewPasswordForgot({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultNewPasswordForgot.fromJson(Map<String, dynamic> json) => ResultNewPasswordForgot(
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
  });

  bool result;
  String message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
  };
}

class Error {
  Error({
    this.result,
    this.code,
    this.message,
  });

  bool result;
  int code;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    result: json["result"] == null ? null : json["result"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}
