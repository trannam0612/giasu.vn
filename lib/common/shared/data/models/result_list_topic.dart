// To parse this JSON data, do
//
//     final resultListTopic = resultListTopicFromJson(jsonString);

import 'dart:convert';

ResultListTopic resultListTopicFromJson(String str) => ResultListTopic.fromJson(json.decode(str));

String resultListTopicToJson(ResultListTopic data) => json.encode(data.toJson());

class ResultListTopic {
  ResultListTopic({
    this.code,
    this.result,
    this.data,
    this.error,
  });

  int code;
  bool result;
  Data data;
  Error error;

  factory ResultListTopic.fromJson(Map<String, dynamic> json) => ResultListTopic(
    code: json["code"] == null ? null : json["code"],
    result: json["result"] == null ? null : json["result"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "result": result == null ? null : result,
    "data": data == null ? null : data.toJson(),
    "error": error == null ? null : error.toJson(),
  };
}

class Data {
  Data({
    this.result,
    this.message,
    this.listSubjectTag,
  });

  bool result;
  String message;
  List<ListSubjectTag> listSubjectTag;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    listSubjectTag: json["listSubjectTag"] == null ? null : List<ListSubjectTag>.from(json["listSubjectTag"].map((x) => ListSubjectTag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "listSubjectTag": listSubjectTag == null ? null : List<dynamic>.from(listSubjectTag.map((x) => x.toJson())),
  };
}

class ListSubjectTag {
  ListSubjectTag({
    this.idSubject,
    this.nameSubject,
  });

  String idSubject;
  String nameSubject;

  factory ListSubjectTag.fromJson(Map<String, dynamic> json) => ListSubjectTag(
    idSubject: json["id_subject"] == null ? null : json["id_subject"],
    nameSubject: json["name_subject"] == null ? null : json["name_subject"],
  );

  Map<String, dynamic> toJson() => {
    "id_subject": idSubject == null ? null : idSubject,
    "name_subject": nameSubject == null ? null : nameSubject,
  };
}

class Error {
  Error({
    this.message,
  });

  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
  };
}
