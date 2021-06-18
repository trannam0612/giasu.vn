// To parse this JSON data, do
//
//     final resultOfferedTeach = resultOfferedTeachFromJson(jsonString);

import 'dart:convert';

ResultOfferedTeach resultOfferedTeachFromJson(String str) => ResultOfferedTeach.fromJson(json.decode(str));

String resultOfferedTeachToJson(ResultOfferedTeach data) => json.encode(data.toJson());

class ResultOfferedTeach {
  ResultOfferedTeach({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultOfferedTeach.fromJson(Map<String, dynamic> json) => ResultOfferedTeach(
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
    this.listGsdd,
    this.currentPage,
    this.limit,
    this.total,
  });

  bool result;
  String message;
  List<ListGsdd> listGsdd;
  String currentPage;
  int limit;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    listGsdd: json["listGSDD"] == null ? null : List<ListGsdd>.from(json["listGSDD"].map((x) => ListGsdd.fromJson(x))),
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "listGSDD": listGsdd == null ? null : List<dynamic>.from(listGsdd.map((x) => x.toJson())),
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}

class ListGsdd {
  ListGsdd({
    this.ugsId,
    this.ugsName,
    this.linkDetailTutor,
    this.pftId,
    this.pftSummary,
    this.linkDetailClass,
    this.pftAddress,
    this.pftForm,
    this.otDate,
  });

  String ugsId;
  String ugsName;
  String linkDetailTutor;
  String pftId;
  String pftSummary;
  String linkDetailClass;
  String pftAddress;
  String pftForm;
  String otDate;

  factory ListGsdd.fromJson(Map<String, dynamic> json) => ListGsdd(
    ugsId: json["ugs_id"] == null ? null : json["ugs_id"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    linkDetailTutor: json["link_detailTutor"] == null ? null : json["link_detailTutor"],
    pftId: json["pft_id"] == null ? null : json["pft_id"],
    pftSummary: json["pft_summary"] == null ? null : json["pft_summary"],
    linkDetailClass: json["link_detailClass"] == null ? null : json["link_detailClass"],
    pftAddress: json["pft_address"] == null ? null : json["pft_address"],
    pftForm: json["pft_form"] == null ? null : json["pft_form"],
    otDate: json["ot_date"] == null ? null : json["ot_date"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_id": ugsId == null ? null : ugsId,
    "ugs_name": ugsName == null ? null : ugsName,
    "link_detailTutor": linkDetailTutor == null ? null : linkDetailTutor,
    "pft_id": pftId == null ? null : pftId,
    "pft_summary": pftSummary == null ? null : pftSummary,
    "link_detailClass": linkDetailClass == null ? null : linkDetailClass,
    "pft_address": pftAddress == null ? null : pftAddress,
    "pft_form": pftForm == null ? null : pftForm,
    "ot_date": otDate == null ? null : otDate,
  };
}

class Error {
  Error({
    this.result,
    this.code,
    this.message,
  });

  bool result;
  int code;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    result: json["result"] == null ? null : json["result"],
    code: json["code"] == null ? null : json["code"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "code": code == null ? null : code,
    "message": message == null ? null : message,
  };
}
