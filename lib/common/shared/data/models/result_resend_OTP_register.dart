// To parse this JSON data, do
//
//     final resultReSendOtpRegister = resultReSendOtpRegisterFromJson(jsonString);

import 'dart:convert';

ResultReSendOtpRegister resultReSendOtpRegisterFromJson(String str) => ResultReSendOtpRegister.fromJson(json.decode(str));

String resultReSendOtpRegisterToJson(ResultReSendOtpRegister data) => json.encode(data.toJson());

class ResultReSendOtpRegister {
  ResultReSendOtpRegister({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultReSendOtpRegister.fromJson(Map<String, dynamic> json) => ResultReSendOtpRegister(
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
    this.token,
  });

  bool result;
  String message;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "token": token == null ? null : token,
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
