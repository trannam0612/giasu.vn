// To parse this JSON data, do
//
//     final resultChangePassword = resultChangePasswordFromJson(jsonString);

import 'dart:convert';

ResultChangePassword resultChangePasswordFromJson(String str) => ResultChangePassword.fromJson(json.decode(str));

String resultChangePasswordToJson(ResultChangePassword data) => json.encode(data.toJson());

class ResultChangePassword {
  ResultChangePassword({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultChangePassword.fromJson(Map<String, dynamic> json) => ResultChangePassword(
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
