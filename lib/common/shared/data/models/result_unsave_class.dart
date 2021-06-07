// To parse this JSON data, do
//
//     final resultUnSaveClass = resultUnSaveClassFromJson(jsonString);

import 'dart:convert';

ResultUnSaveClass resultUnSaveClassFromJson(String str) => ResultUnSaveClass.fromJson(json.decode(str));

String resultUnSaveClassToJson(ResultUnSaveClass data) => json.encode(data.toJson());

class ResultUnSaveClass {
  ResultUnSaveClass({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultUnSaveClass.fromJson(Map<String, dynamic> json) => ResultUnSaveClass(
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
