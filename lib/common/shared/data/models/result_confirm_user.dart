// To parse this JSON data, do
//
//     final resultConfirmUser = resultConfirmUserFromJson(jsonString);

import 'dart:convert';

ResultConfirmUser resultConfirmUserFromJson(String str) => ResultConfirmUser.fromJson(json.decode(str));

String resultConfirmUserToJson(ResultConfirmUser data) => json.encode(data.toJson());

class ResultConfirmUser {
  ResultConfirmUser({
    this.data,
    this.error,
  });

  dynamic data;
  Error error;

  factory ResultConfirmUser.fromJson(Map<String, dynamic> json) => ResultConfirmUser(
    data: json["data"],
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data,
    "error": error == null ? null : error.toJson(),
  };
}

class Error {
  Error({
    this.result,
    this.messages,
  });

  bool result;
  String messages;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    result: json["result"] == null ? null : json["result"],
    messages: json["messages"] == null ? null : json["messages"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "messages": messages == null ? null : messages,
  };
}
