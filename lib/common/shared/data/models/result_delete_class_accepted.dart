// To parse this JSON data, do
//
//     final resultDeleteClassAccept = resultDeleteClassAcceptFromJson(jsonString);

import 'dart:convert';

ResultDeleteClassAccept resultDeleteClassAcceptFromJson(String str) => ResultDeleteClassAccept.fromJson(json.decode(str));

String resultDeleteClassAcceptToJson(ResultDeleteClassAccept data) => json.encode(data.toJson());

class ResultDeleteClassAccept {
  ResultDeleteClassAccept({
    this.data,
    this.error,
  });

  Data data;
  Data error;

  factory ResultDeleteClassAccept.fromJson(Map<String, dynamic> json) => ResultDeleteClassAccept(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    error: json["error"] == null ? null : Data.fromJson(json["error"]),
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
