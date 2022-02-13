// To parse this JSON data, do
//
//     final resultTutorTeaching = resultTutorTeachingFromJson(jsonString);

import 'dart:convert';

ResultTutorTeaching resultTutorTeachingFromJson(String str) => ResultTutorTeaching.fromJson(json.decode(str));

String resultTutorTeachingToJson(ResultTutorTeaching data) => json.encode(data.toJson());

class ResultTutorTeaching {
  ResultTutorTeaching({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultTutorTeaching.fromJson(Map<String, dynamic> json) => ResultTutorTeaching(
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
  String limit;
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
    this.ugsAvatar,
    this.ugsName,
    this.linkDetailTutor,
    this.pftId,
    this.pftSummary,
    this.linkDetailClass,
    this.asId,
    this.asName,
    this.receivedDate,
    this.pftPrice,
    this.pftMonth,
    this.otStatus,
  });

  String ugsId;
  String ugsAvatar;
  String ugsName;
  String linkDetailTutor;
  String pftId;
  String pftSummary;
  String linkDetailClass;
  String asId;
  String asName;
  String receivedDate;
  String pftPrice;
  String pftMonth;
  String otStatus;

  factory ListGsdd.fromJson(Map<String, dynamic> json) => ListGsdd(
    ugsId: json["ugs_id"] == null ? null : json["ugs_id"],
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    linkDetailTutor: json["link_detailTutor"] == null ? null : json["link_detailTutor"],
    pftId: json["pft_id"] == null ? null : json["pft_id"],
    pftSummary: json["pft_summary"] == null ? null : json["pft_summary"],
    linkDetailClass: json["link_detailClass"] == null ? null : json["link_detailClass"],
    asId: json["as_id"] == null ? null : json["as_id"],
    asName: json["as_name"] == null ? null : json["as_name"],
    receivedDate: json["received_date"] == null ? null : json["received_date"],
    pftPrice: json["pft_price"] == null ? null : json["pft_price"],
    pftMonth: json["pft_month"] == null ? null : json["pft_month"],
    otStatus: json["ot_status"] == null ? null : json["ot_status"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_id": ugsId == null ? null : ugsId,
    "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
    "ugs_name": ugsName == null ? null : ugsName,
    "link_detailTutor": linkDetailTutor == null ? null : linkDetailTutor,
    "pft_id": pftId == null ? null : pftId,
    "pft_summary": pftSummary == null ? null : pftSummary,
    "link_detailClass": linkDetailClass == null ? null : linkDetailClass,
    "as_id": asId == null ? null : asId,
    "as_name": asName == null ? null : asName,
    "received_date": receivedDate == null ? null : receivedDate,
    "pft_price": pftPrice == null ? null : pftPrice,
    "pft_month": pftMonth == null ? null : pftMonth,
    "ot_status": otStatus == null ? null : otStatus,
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
