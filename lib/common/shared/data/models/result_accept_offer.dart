// To parse this JSON data, do
//
//     final resultAcceptOffer = resultAcceptOfferFromJson(jsonString);

import 'dart:convert';

ResultAcceptOffer resultAcceptOfferFromJson(String str) => ResultAcceptOffer.fromJson(json.decode(str));

String resultAcceptOfferToJson(ResultAcceptOffer data) => json.encode(data.toJson());

class ResultAcceptOffer {
  ResultAcceptOffer({
    this.data,
    this.error,
  });

  Data data;
  Data error;

  factory ResultAcceptOffer.fromJson(Map<String, dynamic> json) => ResultAcceptOffer(
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
