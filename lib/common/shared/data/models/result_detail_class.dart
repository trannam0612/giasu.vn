// To parse this JSON data, do
//
//     final resultDetailClass = resultDetailClassFromJson(jsonString);

import 'dart:convert';

ResultDetailClass resultDetailClassFromJson(String str) => ResultDetailClass.fromJson(json.decode(str));

String resultDetailClassToJson(ResultDetailClass data) => json.encode(data.toJson());

class ResultDetailClass {
  ResultDetailClass({
    this.data,
    this.error,
  });

  ResultDetailClassData data;
  dynamic error;

  factory ResultDetailClass.fromJson(Map<String, dynamic> json) => ResultDetailClass(
    data: json["data"] == null ? null : ResultDetailClassData.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "error": error,
  };
}

class ResultDetailClassData {
  ResultDetailClassData({
    this.result,
    this.message,
    this.data,
  });

  bool result;
  String message;
  DataData data;

  factory ResultDetailClassData.fromJson(Map<String, dynamic> json) => ResultDetailClassData(
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
    this.dataInfo,
    this.countDnd,
    this.lichday,
    this.listClassLq,
  });

  DataInfo dataInfo;
  String countDnd;
  Lichday lichday;
  ListClassLq listClassLq;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    dataInfo: json["dataInfo"] == null ? null : DataInfo.fromJson(json["dataInfo"]),
    countDnd: json["count_dnd"] == null ? null : json["count_dnd"],
    lichday: json["lichday"] == null ? null : Lichday.fromJson(json["lichday"]),
    listClassLq: json["listClassLQ"] == null ? null : ListClassLq.fromJson(json["listClassLQ"]),
  );

  Map<String, dynamic> toJson() => {
    "dataInfo": dataInfo == null ? null : dataInfo.toJson(),
    "count_dnd": countDnd == null ? null : countDnd,
    "lichday": lichday == null ? null : lichday.toJson(),
    "listClassLQ": listClassLq == null ? null : listClassLq.toJson(),
  };
}

class DataInfo {
  DataInfo({
    this.pftId,
    this.pftSummary,
    this.status,
    this.cityId,
    this.cityName,
    this.cityDetail,
    this.ctyDetailName,
    this.pftPrice,
    this.pftMonth,
    this.asId,
    this.asName,
    this.pftGender,
    this.pftForm,
    this.ctId,
    this.ctName,
    this.pftNbLesson,
    this.pftTime,
    this.pftNbStudent,
    this.pftDetail,
  });

  String pftId;
  String pftSummary;
  String status;
  String cityId;
  String cityName;
  String cityDetail;
  String ctyDetailName;
  String pftPrice;
  String pftMonth;
  String asId;
  String asName;
  String pftGender;
  String pftForm;
  String ctId;
  String ctName;
  String pftNbLesson;
  String pftTime;
  String pftNbStudent;
  String pftDetail;

  factory DataInfo.fromJson(Map<String, dynamic> json) => DataInfo(
    pftId: json["pft_id"] == null ? null : json["pft_id"],
    pftSummary: json["pft_summary"] == null ? null : json["pft_summary"],
    status: json["status"] == null ? null : json["status"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    cityName: json["city_name"] == null ? null : json["city_name"],
    cityDetail: json["city_detail"] == null ? null : json["city_detail"],
    ctyDetailName: json["cty_detail_name"] == null ? null : json["cty_detail_name"],
    pftPrice: json["pft_price"] == null ? null : json["pft_price"],
    pftMonth: json["pft_month"] == null ? null : json["pft_month"],
    asId: json["as_id"] == null ? null : json["as_id"],
    asName: json["as_name"] == null ? null : json["as_name"],
    pftGender: json["pft_gender"] == null ? null : json["pft_gender"],
    pftForm: json["pft_form"] == null ? null : json["pft_form"],
    ctId: json["ct_id"] == null ? null : json["ct_id"],
    ctName: json["ct_name"] == null ? null : json["ct_name"],
    pftNbLesson: json["pft_nb_lesson"] == null ? null : json["pft_nb_lesson"],
    pftTime: json["pft_time"] == null ? null : json["pft_time"],
    pftNbStudent: json["pft_nb_student"] == null ? null : json["pft_nb_student"],
    pftDetail: json["pft_detail"] == null ? null : json["pft_detail"],
  );

  Map<String, dynamic> toJson() => {
    "pft_id": pftId == null ? null : pftId,
    "pft_summary": pftSummary == null ? null : pftSummary,
    "status": status == null ? null : status,
    "city_id": cityId == null ? null : cityId,
    "city_name": cityName == null ? null : cityName,
    "city_detail": cityDetail == null ? null : cityDetail,
    "cty_detail_name": ctyDetailName == null ? null : ctyDetailName,
    "pft_price": pftPrice == null ? null : pftPrice,
    "pft_month": pftMonth == null ? null : pftMonth,
    "as_id": asId == null ? null : asId,
    "as_name": asName == null ? null : asName,
    "pft_gender": pftGender == null ? null : pftGender,
    "pft_form": pftForm == null ? null : pftForm,
    "ct_id": ctId == null ? null : ctId,
    "ct_name": ctName == null ? null : ctName,
    "pft_nb_lesson": pftNbLesson == null ? null : pftNbLesson,
    "pft_time": pftTime == null ? null : pftTime,
    "pft_nb_student": pftNbStudent == null ? null : pftNbStudent,
    "pft_detail": pftDetail == null ? null : pftDetail,
  };
}

class Lichday {
  Lichday({
    this.tsId,
    this.ugsId,
    this.pftId,
    this.st2,
    this.st3,
    this.st4,
    this.st5,
    this.st6,
    this.st7,
    this.scn,
    this.ct2,
    this.ct3,
    this.ct4,
    this.ct5,
    this.ct6,
    this.ct7,
    this.ccn,
    this.tt2,
    this.tt3,
    this.tt4,
    this.tt5,
    this.tt6,
    this.tt7,
    this.tcn,
  });

  String tsId;
  String ugsId;
  String pftId;
  String st2;
  String st3;
  String st4;
  String st5;
  String st6;
  String st7;
  String scn;
  String ct2;
  String ct3;
  String ct4;
  String ct5;
  String ct6;
  String ct7;
  String ccn;
  String tt2;
  String tt3;
  String tt4;
  String tt5;
  String tt6;
  String tt7;
  String tcn;

  factory Lichday.fromJson(Map<String, dynamic> json) => Lichday(
    tsId: json["ts_id"] == null ? null : json["ts_id"],
    ugsId: json["ugs_id"] == null ? null : json["ugs_id"],
    pftId: json["pft_id"] == null ? null : json["pft_id"],
    st2: json["st2"] == null ? null : json["st2"],
    st3: json["st3"] == null ? null : json["st3"],
    st4: json["st4"] == null ? null : json["st4"],
    st5: json["st5"] == null ? null : json["st5"],
    st6: json["st6"] == null ? null : json["st6"],
    st7: json["st7"] == null ? null : json["st7"],
    scn: json["scn"] == null ? null : json["scn"],
    ct2: json["ct2"] == null ? null : json["ct2"],
    ct3: json["ct3"] == null ? null : json["ct3"],
    ct4: json["ct4"] == null ? null : json["ct4"],
    ct5: json["ct5"] == null ? null : json["ct5"],
    ct6: json["ct6"] == null ? null : json["ct6"],
    ct7: json["ct7"] == null ? null : json["ct7"],
    ccn: json["ccn"] == null ? null : json["ccn"],
    tt2: json["tt2"] == null ? null : json["tt2"],
    tt3: json["tt3"] == null ? null : json["tt3"],
    tt4: json["tt4"] == null ? null : json["tt4"],
    tt5: json["tt5"] == null ? null : json["tt5"],
    tt6: json["tt6"] == null ? null : json["tt6"],
    tt7: json["tt7"] == null ? null : json["tt7"],
    tcn: json["tcn"] == null ? null : json["tcn"],
  );

  Map<String, dynamic> toJson() => {
    "ts_id": tsId == null ? null : tsId,
    "ugs_id": ugsId == null ? null : ugsId,
    "pft_id": pftId == null ? null : pftId,
    "st2": st2 == null ? null : st2,
    "st3": st3 == null ? null : st3,
    "st4": st4 == null ? null : st4,
    "st5": st5 == null ? null : st5,
    "st6": st6 == null ? null : st6,
    "st7": st7 == null ? null : st7,
    "scn": scn == null ? null : scn,
    "ct2": ct2 == null ? null : ct2,
    "ct3": ct3 == null ? null : ct3,
    "ct4": ct4 == null ? null : ct4,
    "ct5": ct5 == null ? null : ct5,
    "ct6": ct6 == null ? null : ct6,
    "ct7": ct7 == null ? null : ct7,
    "ccn": ccn == null ? null : ccn,
    "tt2": tt2 == null ? null : tt2,
    "tt3": tt3 == null ? null : tt3,
    "tt4": tt4 == null ? null : tt4,
    "tt5": tt5 == null ? null : tt5,
    "tt6": tt6 == null ? null : tt6,
    "tt7": tt7 == null ? null : tt7,
    "tcn": tcn == null ? null : tcn,
  };
}

class ListClassLq {
  ListClassLq({
    this.empty,
    this.currentPage,
    this.limit,
    this.total,
  });

  List<Empty> empty;
  int currentPage;
  int limit;
  int total;

  factory ListClassLq.fromJson(Map<String, dynamic> json) => ListClassLq(
    empty: json[""] == null ? null : List<Empty>.from(json[""].map((x) => Empty.fromJson(x))),
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "": empty == null ? null : List<dynamic>.from(empty.map((x) => x.toJson())),
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}

class Empty {
  Empty({
    this.ugsAvatar,
    this.pftId,
    this.pftSummary,
    this.linkDetailClass,
    this.cityId,
    this.citName,
    this.pftDetail,
    this.pftPrice,
    this.pftMonth,
  });

  String ugsAvatar;
  String pftId;
  String pftSummary;
  String linkDetailClass;
  String cityId;
  String citName;
  String pftDetail;
  String pftPrice;
  String pftMonth;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    pftId: json["pft_id"] == null ? null : json["pft_id"],
    pftSummary: json["pft_summary"] == null ? null : json["pft_summary"],
    linkDetailClass: json["link_detailClass"] == null ? null : json["link_detailClass"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
    pftDetail: json["pft_detail"] == null ? null : json["pft_detail"],
    pftPrice: json["pft_price"] == null ? null : json["pft_price"],
    pftMonth: json["pft_month"] == null ? null : json["pft_month"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
    "pft_id": pftId == null ? null : pftId,
    "pft_summary": pftSummary == null ? null : pftSummary,
    "link_detailClass": linkDetailClass == null ? null : linkDetailClass,
    "city_id": cityId == null ? null : cityId,
    "cit_name": citName == null ? null : citName,
    "pft_detail": pftDetail == null ? null : pftDetail,
    "pft_price": pftPrice == null ? null : pftPrice,
    "pft_month": pftMonth == null ? null : pftMonth,
  };
}