// To parse this JSON data, do
//
//     final resultUpdateInfoParent = resultUpdateInfoParentFromJson(jsonString);

import 'dart:convert';

ResultUpdateInfoParent resultUpdateInfoParentFromJson(String str) => ResultUpdateInfoParent.fromJson(json.decode(str));

String resultUpdateInfoParentToJson(ResultUpdateInfoParent data) => json.encode(data.toJson());

class ResultUpdateInfoParent {
  ResultUpdateInfoParent({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultUpdateInfoParent.fromJson(Map<String, dynamic> json) => ResultUpdateInfoParent(
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
