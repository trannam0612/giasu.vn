// To parse this JSON data, do
//
//     final resultGetTeacher = resultGetTeacherFromJson(jsonString);

import 'dart:convert';

ResultGetTeacher resultGetTeacherFromJson(String str) => ResultGetTeacher.fromJson(json.decode(str));

String resultGetTeacherToJson(ResultGetTeacher data) => json.encode(data.toJson());

class ResultGetTeacher {
  ResultGetTeacher({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultGetTeacher.fromJson(Map<String, dynamic> json) => ResultGetTeacher(
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
