// To parse this JSON data, do
//
//     final resultSearchListTeacher = resultSearchListTeacherFromJson(jsonString);

import 'dart:convert';

ResultSearchListTeacher resultSearchListTeacherFromJson(String str) => ResultSearchListTeacher.fromJson(json.decode(str));

String resultSearchListTeacherToJson(ResultSearchListTeacher data) => json.encode(data.toJson());

class ResultSearchListTeacher {
  ResultSearchListTeacher({
    this.data,
    this.error,
  });

  ResultSearchListTeacherData data;
  Error error;

  factory ResultSearchListTeacher.fromJson(Map<String, dynamic> json) => ResultSearchListTeacher(
    data: json["data"] == null ? null : ResultSearchListTeacherData.fromJson(json["data"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "error": error == null ? null : error.toJson(),
  };
}

class ResultSearchListTeacherData {
  ResultSearchListTeacherData({
    this.result,
    this.message,
    this.data,
  });

  bool result;
  String message;
  DataData data;

  factory ResultSearchListTeacherData.fromJson(Map<String, dynamic> json) => ResultSearchListTeacherData(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : DataData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "data": data == null ? null : data.toJson(),
  };
}

class DataData {
  DataData({
    this.dataGs,
    this.currentPage,
    this.limit,
    this.total,
  });

  List<DataG> dataGs;
  String currentPage;
  int limit;
  int total;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    dataGs: json["dataGs"] == null ? null : List<DataG>.from(json["dataGs"].map((x) => DataG.fromJson(x))),
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "dataGs": dataGs == null ? null : List<dynamic>.from(dataGs.map((x) => x.toJson())),
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}

class DataG {
  DataG({
    this.ugsId,
    this.ugsAvatar,
    this.ugsName,
    this.linkDetailTutor,
    this.asId,
    this.asName,
    this.asDetail,
    this.asDetailName,
    this.ugsCity,
    this.citName,
    this.ugsCounty,
    this.ugsAboutUs,
    this.ugsUnitPrice,
    this.ugsMonth,
    this.checkSave,
  });

  String ugsId;
  String ugsAvatar;
  String ugsName;
  String linkDetailTutor;
  String asId;
  List<String> asName;
  String asDetail;
  List<String> asDetailName;
  String ugsCity;
  String citName;
  String ugsCounty;
  String ugsAboutUs;
  String ugsUnitPrice;
  String ugsMonth;
  bool checkSave;

  factory DataG.fromJson(Map<String, dynamic> json) => DataG(
    ugsId: json["ugs_id"] == null ? null : json["ugs_id"],
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    linkDetailTutor: json["link_detailTutor"] == null ? null : json["link_detailTutor"],
    asId: json["as_id"] == null ? null : json["as_id"],
    asName: json["as_name"] == null ? null : List<String>.from(json["as_name"].map((x) => x)),
    asDetail: json["as_detail"] == null ? null : json["as_detail"],
    asDetailName: json["as_detail_name"] == null ? null : List<String>.from(json["as_detail_name"].map((x) => x)),
    ugsCity: json["ugs_city"] == null ? null : json["ugs_city"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
    ugsCounty: json["ugs_county"] == null ? null : json["ugs_county"],
    ugsAboutUs: json["ugs_about_us"] == null ? null : json["ugs_about_us"],
    ugsUnitPrice: json["ugs_unit_price"] == null ? null : json["ugs_unit_price"],
    ugsMonth: json["ugs_month"] == null ? null : json["ugs_month"],
    checkSave: json["check_save"] == null ? null : json["check_save"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_id": ugsId == null ? null : ugsId,
    "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
    "ugs_name": ugsName == null ? null : ugsName,
    "link_detailTutor": linkDetailTutor == null ? null : linkDetailTutor,
    "as_id": asId == null ? null : asId,
    "as_name": asName == null ? null : List<dynamic>.from(asName.map((x) => x)),
    "as_detail": asDetail == null ? null : asDetail,
    "as_detail_name": asDetailName == null ? null : List<dynamic>.from(asDetailName.map((x) => x)),
    "ugs_city": ugsCity == null ? null : ugsCity,
    "cit_name": citName == null ? null : citName,
    "ugs_county": ugsCounty == null ? null : ugsCounty,
    "ugs_about_us": ugsAboutUs == null ? null : ugsAboutUs,
    "ugs_unit_price": ugsUnitPrice == null ? null : ugsUnitPrice,
    "ugs_month": ugsMonth == null ? null : ugsMonth,
    "check_save": checkSave == null ? null : checkSave,
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
