// To parse this JSON data, do
//
//     final resultSuggestClass = resultSuggestClassFromJson(jsonString);

import 'dart:convert';

ResultSuggestClass resultSuggestClassFromJson(String str) => ResultSuggestClass.fromJson(json.decode(str));

String resultSuggestClassToJson(ResultSuggestClass data) => json.encode(data.toJson());

class ResultSuggestClass {
  ResultSuggestClass({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultSuggestClass.fromJson(Map<String, dynamic> json) => ResultSuggestClass(
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
