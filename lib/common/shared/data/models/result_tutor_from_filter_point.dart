// To parse this JSON data, do
//
//     final resultTutorFromFilterPoint = resultTutorFromFilterPointFromJson(jsonString);

import 'dart:convert';

ResultTutorFromFilterPoint resultTutorFromFilterPointFromJson(String str) => ResultTutorFromFilterPoint.fromJson(json.decode(str));

String resultTutorFromFilterPointToJson(ResultTutorFromFilterPoint data) => json.encode(data.toJson());

class ResultTutorFromFilterPoint {
  ResultTutorFromFilterPoint({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultTutorFromFilterPoint.fromJson(Map<String, dynamic> json) => ResultTutorFromFilterPoint(
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
    this.listGstdl,
    this.currentPage,
    this.limit,
    this.total,
  });

  bool result;
  String message;
  List<ListGstdl> listGstdl;
  String currentPage;
  int limit;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    listGstdl: json["listGSTDL"] == null ? null : List<ListGstdl>.from(json["listGSTDL"].map((x) => ListGstdl.fromJson(x))),
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "listGSTDL": listGstdl == null ? null : List<dynamic>.from(listGstdl.map((x) => x.toJson())),
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}

class ListGstdl {
  ListGstdl({
    this.ugsId,
    this.ugsAvatar,
    this.ugsName,
    this.linkDetailTutor,
    this.suToday,
    this.suStatus,
  });

  String ugsId;
  String ugsAvatar;
  String ugsName;
  String linkDetailTutor;
  String suToday;
  String suStatus;

  factory ListGstdl.fromJson(Map<String, dynamic> json) => ListGstdl(
    ugsId: json["ugs_id"] == null ? null : json["ugs_id"],
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    linkDetailTutor: json["link_detailTutor"] == null ? null : json["link_detailTutor"],
    suToday: json["su_today"] == null ? null : json["su_today"],
    suStatus: json["su_status"] == null ? null : json["su_status"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_id": ugsId == null ? null : ugsId,
    "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
    "ugs_name": ugsName == null ? null : ugsName,
    "link_detailTutor": linkDetailTutor == null ? null : linkDetailTutor,
    "su_today": suToday == null ? null : suToday,
    "su_status": suStatus == null ? null : suStatus,
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
