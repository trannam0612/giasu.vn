// To parse this JSON data, do
//
//     final resultParentSaved = resultParentSavedFromJson(jsonString);

import 'dart:convert';

ResultParentSaved resultParentSavedFromJson(String str) => ResultParentSaved.fromJson(json.decode(str));

String resultParentSavedToJson(ResultParentSaved data) => json.encode(data.toJson());

class ResultParentSaved {
  ResultParentSaved({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultParentSaved.fromJson(Map<String, dynamic> json) => ResultParentSaved(
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
    this.listPhdl,
    this.currentPage,
    this.limit,
    this.total,
  });

  bool result;
  String message;
  List<ListPhdl> listPhdl;
  String currentPage;
  int limit;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    listPhdl: json["listPHDL"] == null ? null : List<ListPhdl>.from(json["listPHDL"].map((x) => ListPhdl.fromJson(x))),
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "listPHDL": listPhdl == null ? null : List<dynamic>.from(listPhdl.map((x) => x.toJson())),
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}

class ListPhdl {
  ListPhdl({
    this.ugsId,
    this.ugsName,
    this.linkDetailTutor,
    this.spDetail,
  });

  String ugsId;
  String ugsName;
  String linkDetailTutor;
  String spDetail;

  factory ListPhdl.fromJson(Map<String, dynamic> json) => ListPhdl(
    ugsId: json["ugs_id"] == null ? null : json["ugs_id"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    linkDetailTutor: json["link_detailTutor"] == null ? null : json["link_detailTutor"],
    spDetail: json["sp_detail"] == null ? null : json["sp_detail"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_id": ugsId == null ? null : ugsId,
    "ugs_name": ugsName == null ? null : ugsName,
    "link_detailTutor": linkDetailTutor == null ? null : linkDetailTutor,
    "sp_detail": spDetail == null ? null : spDetail,
  };
}

class Error {
  Error({
    this.result,
    this.message,
  });

  bool result;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
  };
}
