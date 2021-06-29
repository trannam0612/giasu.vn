// To parse this JSON data, do
//
//     final resultDeleteParentSaved = resultDeleteParentSavedFromJson(jsonString);

import 'dart:convert';

ResultDeleteParentSaved resultDeleteParentSavedFromJson(String str) => ResultDeleteParentSaved.fromJson(json.decode(str));

String resultDeleteParentSavedToJson(ResultDeleteParentSaved data) => json.encode(data.toJson());

class ResultDeleteParentSaved {
  ResultDeleteParentSaved({
    this.data,
    this.error,
  });

  Data data;
  Data error;

  factory ResultDeleteParentSaved.fromJson(Map<String, dynamic> json) => ResultDeleteParentSaved(
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
