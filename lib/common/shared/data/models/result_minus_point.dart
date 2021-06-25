// To parse this JSON data, do
//
//     final resultMinusPoint = resultMinusPointFromJson(jsonString);

import 'dart:convert';

ResultMinusPoint resultMinusPointFromJson(String str) => ResultMinusPoint.fromJson(json.decode(str));

String resultMinusPointToJson(ResultMinusPoint data) => json.encode(data.toJson());

class ResultMinusPoint {
  ResultMinusPoint({
    this.data,
    this.error,
  });

  Data data;
  Data error;

  factory ResultMinusPoint.fromJson(Map<String, dynamic> json) => ResultMinusPoint(
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
