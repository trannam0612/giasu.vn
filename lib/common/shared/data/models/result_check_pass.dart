// To parse this JSON data, do
//
//     final resultCheckPass = resultCheckPassFromJson(jsonString);

import 'dart:convert';

ResultCheckPass resultCheckPassFromJson(String str) => ResultCheckPass.fromJson(json.decode(str));

String resultCheckPassToJson(ResultCheckPass data) => json.encode(data.toJson());

class ResultCheckPass {
  ResultCheckPass({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultCheckPass.fromJson(Map<String, dynamic> json) => ResultCheckPass(
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
  dynamic message;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message,
  };
}
