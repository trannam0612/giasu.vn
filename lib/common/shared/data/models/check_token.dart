// To parse this JSON data, do
//
//     final resultCheckToken = resultCheckTokenFromJson(jsonString);

import 'dart:convert';

ResultCheckToken resultCheckTokenFromJson(String str) => ResultCheckToken.fromJson(json.decode(str));

String resultCheckTokenToJson(ResultCheckToken data) => json.encode(data.toJson());

class ResultCheckToken {
  ResultCheckToken({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultCheckToken.fromJson(Map<String, dynamic> json) => ResultCheckToken(
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
    this.message,
  });

  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
  };
}
