// To parse this JSON data, do
//
//     final resultOfferTeach = resultOfferTeachFromJson(jsonString);

import 'dart:convert';

ResultOfferTeach resultOfferTeachFromJson(String str) => ResultOfferTeach.fromJson(json.decode(str));

String resultOfferTeachToJson(ResultOfferTeach data) => json.encode(data.toJson());

class ResultOfferTeach {
  ResultOfferTeach({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultOfferTeach.fromJson(Map<String, dynamic> json) => ResultOfferTeach(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
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

class Error {
  Error({
    this.code,
    this.message,
  });

  int code;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}
