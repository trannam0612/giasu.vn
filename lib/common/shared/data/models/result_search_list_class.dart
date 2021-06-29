// To parse this JSON data, do
//
//     final resultSearchClassTeacher = resultSearchClassTeacherFromJson(jsonString);

import 'dart:convert';

ResultSearchClassTeacher resultSearchClassTeacherFromJson(String str) => ResultSearchClassTeacher.fromJson(json.decode(str));

String resultSearchClassTeacherToJson(ResultSearchClassTeacher data) => json.encode(data.toJson());

class ResultSearchClassTeacher {
  ResultSearchClassTeacher({
    this.data,
    this.error,
  });

  ResultSearchClassTeacherData data;
  Error error;

  factory ResultSearchClassTeacher.fromJson(Map<String, dynamic> json) => ResultSearchClassTeacher(
    data: json["data"] == null ? null : ResultSearchClassTeacherData.fromJson(json["data"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "error": error == null ? null : error.toJson(),
  };
}

class ResultSearchClassTeacherData {
  ResultSearchClassTeacherData({
    this.result,
    this.message,
    this.data,
  });

  bool result;
  String message;
  DataData data;

  factory ResultSearchClassTeacherData.fromJson(Map<String, dynamic> json) => ResultSearchClassTeacherData(
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
    this.dataLh,
    this.currentPage,
    this.limit,
    this.total,
  });

  List<DataLh> dataLh;
  String currentPage;
  int limit;
  int total;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    dataLh: json["dataLh"] == null ? null : List<DataLh>.from(json["dataLh"].map((x) => DataLh.fromJson(x))),
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "dataLh": dataLh == null ? null : List<dynamic>.from(dataLh.map((x) => x.toJson())),
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}

class DataLh {
  DataLh({
    this.ugsAvatar,
    this.pftId,
    this.pftSummary,
    this.linkDetailClass,
    this.cityId,
    this.citName,
    this.cityDetail,
    this.asId,
    this.asName,
    this.asDetail,
    this.asDetailName,
    this.pftForm,
    this.pftPrice,
    this.pftMonth,
    this.dayPost,
  });

  String ugsAvatar;
  String pftId;
  String pftSummary;
  String linkDetailClass;
  String cityId;
  String citName;
  String cityDetail;
  String asId;
  String asName;
  String asDetail;
  String asDetailName;
  String pftForm;
  String pftPrice;
  String pftMonth;
  String dayPost;

  factory DataLh.fromJson(Map<String, dynamic> json) => DataLh(
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    pftId: json["pft_id"] == null ? null : json["pft_id"],
    pftSummary: json["pft_summary"] == null ? null : json["pft_summary"],
    linkDetailClass: json["link_detailClass"] == null ? null : json["link_detailClass"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
    cityDetail: json["city_detail"] == null ? null : json["city_detail"],
    asId: json["as_id"] == null ? null : json["as_id"],
    asName: json["as_name"] == null ? null : json["as_name"],
    asDetail: json["as_detail"] == null ? null : json["as_detail"],
    asDetailName: json["as_detail_name"] == null ? null : json["as_detail_name"],
    pftForm: json["pft_form"] == null ? null : json["pft_form"],
    pftPrice: json["pft_price"] == null ? null : json["pft_price"],
    pftMonth: json["pft_month"] == null ? null : json["pft_month"],
    dayPost: json["day_post"] == null ? null : json["day_post"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
    "pft_id": pftId == null ? null : pftId,
    "pft_summary": pftSummary == null ? null : pftSummary,
    "link_detailClass": linkDetailClass == null ? null : linkDetailClass,
    "city_id": cityId == null ? null : cityId,
    "cit_name": citName == null ? null : citName,
    "city_detail": cityDetail == null ? null : cityDetail,
    "as_id": asId == null ? null : asId,
    "as_name": asName == null ? null : asName,
    "as_detail": asDetail == null ? null : asDetail,
    "as_detail_name": asDetailName == null ? null : asDetailName,
    "pft_form": pftForm == null ? null : pftForm,
    "pft_price": pftPrice == null ? null : pftPrice,
    "pft_month": pftMonth == null ? null : pftMonth,
    "day_post": dayPost == null ? null : dayPost,
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
