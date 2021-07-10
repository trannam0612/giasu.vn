// To parse this JSON data, do
//
//     final resultChangeStatusPost = resultChangeStatusPostFromJson(jsonString);

import 'dart:convert';

ResultChangeStatusPost resultChangeStatusPostFromJson(String str) => ResultChangeStatusPost.fromJson(json.decode(str));

String resultChangeStatusPostToJson(ResultChangeStatusPost data) => json.encode(data.toJson());

class ResultChangeStatusPost {
  ResultChangeStatusPost({
    this.data,
    this.error,
  });

  Data data;
  Data error;

  factory ResultChangeStatusPost.fromJson(Map<String, dynamic> json) => ResultChangeStatusPost(
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
