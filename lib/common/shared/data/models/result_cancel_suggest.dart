// To parse this JSON data, do
//
//     final resultCancelSuggest = resultCancelSuggestFromJson(jsonString);

import 'dart:convert';

ResultCancelSuggest resultCancelSuggestFromJson(String str) => ResultCancelSuggest.fromJson(json.decode(str));

String resultCancelSuggestToJson(ResultCancelSuggest data) => json.encode(data.toJson());

class ResultCancelSuggest {
  ResultCancelSuggest({
    this.data,
  });

  Data data;

  factory ResultCancelSuggest.fromJson(Map<String, dynamic> json) => ResultCancelSuggest(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
  };
}

class Data {
  Data({
    this.result,
    this.message,
    this.error,
  });

  bool result;
  String message;
  dynamic error;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "error": error,
  };
}
