// To parse this JSON data, do
//
//     final resultDeleteClassOffered = resultDeleteClassOfferedFromJson(jsonString);

import 'dart:convert';

ResultDeleteClassOffered resultDeleteClassOfferedFromJson(String str) => ResultDeleteClassOffered.fromJson(json.decode(str));

String resultDeleteClassOfferedToJson(ResultDeleteClassOffered data) => json.encode(data.toJson());

class ResultDeleteClassOffered {
  ResultDeleteClassOffered({
    this.data,
    this.error,
  });

  Data data;
  Data error;

  factory ResultDeleteClassOffered.fromJson(Map<String, dynamic> json) => ResultDeleteClassOffered(
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
