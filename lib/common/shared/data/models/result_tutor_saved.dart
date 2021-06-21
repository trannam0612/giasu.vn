// To parse this JSON data, do
//
//     final resultTutorSaved = resultTutorSavedFromJson(jsonString);

import 'dart:convert';

ResultTutorSaved resultTutorSavedFromJson(String str) => ResultTutorSaved.fromJson(json.decode(str));

String resultTutorSavedToJson(ResultTutorSaved data) => json.encode(data.toJson());

class ResultTutorSaved {
  ResultTutorSaved({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultTutorSaved.fromJson(Map<String, dynamic> json) => ResultTutorSaved(
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
    this.listGsdl,
    this.currentPage,
    this.limit,
    this.total,
  });

  bool result;
  String message;
  List<ListGsdl> listGsdl;
  String currentPage;
  int limit;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    listGsdl: json["listGSDL"] == null ? null : List<ListGsdl>.from(json["listGSDL"].map((x) => ListGsdl.fromJson(x))),
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "listGSDL": listGsdl == null ? null : List<dynamic>.from(listGsdl.map((x) => x.toJson())),
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}

class ListGsdl {
  ListGsdl({
    this.ugsTeach,
    this.ugsAvatar,
    this.ugsName,
    this.linkDetailTutor,
    this.asId,
    this.asName,
    this.ugsFormality,
    this.asDetail,
    this.asDetailName,
    this.ugsAddress,
    this.checkSave,
    this.stDate,
    this.ugsUnitPrice,
    this.ugsMonth,
  });

  String ugsTeach;
  String ugsAvatar;
  String ugsName;
  String linkDetailTutor;
  String asId;
  String asName;
  String ugsFormality;
  String asDetail;
  List<String> asDetailName;
  String ugsAddress;
  bool checkSave;
  String stDate;
  String ugsUnitPrice;
  String ugsMonth;

  factory ListGsdl.fromJson(Map<String, dynamic> json) => ListGsdl(
    ugsTeach: json["ugs_teach"] == null ? null : json["ugs_teach"],
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    linkDetailTutor: json["link_detailTutor"] == null ? null : json["link_detailTutor"],
    asId: json["as_id"] == null ? null : json["as_id"],
    asName: json["as_name"] == null ? null : json["as_name"],
    ugsFormality: json["ugs_formality"] == null ? null : json["ugs_formality"],
    asDetail: json["as_detail"] == null ? null : json["as_detail"],
    asDetailName: json["as_detail_name"] == null ? null : List<String>.from(json["as_detail_name"].map((x) => x)),
    ugsAddress: json["ugs_address"] == null ? null : json["ugs_address"],
    checkSave: json["check_save"] == null ? null : json["check_save"],
    stDate: json["st_date"] == null ? null : json["st_date"],
    ugsUnitPrice: json["ugs_unit_price"] == null ? null : json["ugs_unit_price"],
    ugsMonth: json["ugs_month"] == null ? null : json["ugs_month"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_teach": ugsTeach == null ? null : ugsTeach,
    "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
    "ugs_name": ugsName == null ? null : ugsName,
    "link_detailTutor": linkDetailTutor == null ? null : linkDetailTutor,
    "as_id": asId == null ? null : asId,
    "as_name": asName == null ? null : asName,
    "ugs_formality": ugsFormality == null ? null : ugsFormality,
    "as_detail": asDetail == null ? null : asDetail,
    "as_detail_name": asDetailName == null ? null : List<dynamic>.from(asDetailName.map((x) => x)),
    "ugs_address": ugsAddress == null ? null : ugsAddress,
    "check_save": checkSave == null ? null : checkSave,
    "st_date": stDate == null ? null : stDate,
    "ugs_unit_price": ugsUnitPrice == null ? null : ugsUnitPrice,
    "ugs_month": ugsMonth == null ? null : ugsMonth,
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
