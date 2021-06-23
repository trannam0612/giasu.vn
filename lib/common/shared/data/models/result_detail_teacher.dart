// To parse this JSON data, do
//
//     final resultDetailTeacher = resultDetailTeacherFromJson(jsonString);

import 'dart:convert';

ResultDetailTeacher resultDetailTeacherFromJson(String str) => ResultDetailTeacher.fromJson(json.decode(str));

String resultDetailTeacherToJson(ResultDetailTeacher data) => json.encode(data.toJson());

class ResultDetailTeacher {
  ResultDetailTeacher({
    this.data,
    this.error,
  });

  ResultDetailTeacherData data;
  Error error;

  factory ResultDetailTeacher.fromJson(Map<String, dynamic> json) => ResultDetailTeacher(
    data: json["data"] == null ? null : ResultDetailTeacherData.fromJson(json["data"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "error": error == null ? null : error.toJson(),
  };
}

class ResultDetailTeacherData {
  ResultDetailTeacherData({
    this.result,
    this.message,
    this.data,
  });

  bool result;
  String message;
  DataData data;

  factory ResultDetailTeacherData.fromJson(Map<String, dynamic> json) => ResultDetailTeacherData(
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
    this.lichday,
    this.dataClassLq,
    this.currentPage,
    this.limit,
    this.total,
  });

  DataInfo dataInfo;
  Lichday lichday;
  List<dynamic> dataClassLq;
  int currentPage;
  int limit;
  int total;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
    dataInfo: json["dataInfo"] == null ? null : DataInfo.fromJson(json["dataInfo"]),
    lichday: json["lichday"] == null ? null : Lichday.fromJson(json["lichday"]),
    dataClassLq: json["dataClassLQ"] == null ? null : List<dynamic>.from(json["dataClassLQ"].map((x) => x)),
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "dataInfo": dataInfo == null ? null : dataInfo.toJson(),
    "lichday": lichday == null ? null : lichday.toJson(),
    "dataClassLQ": dataClassLq == null ? null : List<dynamic>.from(dataClassLq.map((x) => x)),
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}

class DataInfo {
  DataInfo({
    this.ugsAvatar,
    this.ugsView,
    this.ugsId,
    this.ugsName,
    this.ugsAboutUs,
    this.ugsBrithday,
    this.ugsGender,
    this.ugsMarriage,
    this.nametype,
    this.ugsAddress,
    this.ugsDayNow,
    this.ugsExperienceYear,
    this.ugsFormality,
    this.citName,
    this.citDetail,
    this.asName,
    this.asDetail,
    this.ctName,
    this.ugsTitle,
    this.ugsYearStart,
    this.ugsYearEnd,
    this.ugsJobDescription,
    this.ugsAchievements,
    this.checkSave,
    this.checkMinusPoint,
  });

  String ugsAvatar;
  String ugsView;
  String ugsId;
  String ugsName;
  String ugsAboutUs;
  String ugsBrithday;
  String ugsGender;
  String ugsMarriage;
  String nametype;
  String ugsAddress;
  String ugsDayNow;
  String ugsExperienceYear;
  String ugsFormality;
  String citName;
  String citDetail;
  String asName;
  String asDetail;
  String ctName;
  String ugsTitle;
  String ugsYearStart;
  String ugsYearEnd;
  String ugsJobDescription;
  String ugsAchievements;
  bool checkSave;
  bool checkMinusPoint;

  factory DataInfo.fromJson(Map<String, dynamic> json) => DataInfo(
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    ugsView: json["ugs_view"] == null ? null : json["ugs_view"],
    ugsId: json["ugs_id"] == null ? null : json["ugs_id"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    ugsAboutUs: json["ugs_about_us"] == null ? null : json["ugs_about_us"],
    ugsBrithday: json["ugs_brithday"] == null ? null : json["ugs_brithday"],
    ugsGender: json["ugs_gender"] == null ? null : json["ugs_gender"],
    ugsMarriage: json["ugs_marriage"] == null ? null : json["ugs_marriage"],
    nametype: json["nametype"] == null ? null : json["nametype"],
    ugsAddress: json["ugs_address"] == null ? null : json["ugs_address"],
    ugsDayNow: json["ugs_day_now"] == null ? null : json["ugs_day_now"],
    ugsExperienceYear: json["ugs_experience_year"] == null ? null : json["ugs_experience_year"],
    ugsFormality: json["ugs_formality"] == null ? null : json["ugs_formality"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
    citDetail: json["cit_detail"] == null ? null : json["cit_detail"],
    asName: json["as_name"] == null ? null : json["as_name"],
    asDetail: json["as_detail"] == null ? null : json["as_detail"],
    ctName: json["ct_name"] == null ? null : json["ct_name"],
    ugsTitle: json["ugs_title"] == null ? null : json["ugs_title"],
    ugsYearStart: json["ugs_year_start"] == null ? null : json["ugs_year_start"],
    ugsYearEnd: json["ugs_year_end"] == null ? null : json["ugs_year_end"],
    ugsJobDescription: json["ugs_job_description"] == null ? null : json["ugs_job_description"],
    ugsAchievements: json["ugs_achievements"] == null ? null : json["ugs_achievements"],
    checkSave: json["check_save"] == null ? null : json["check_save"],
    checkMinusPoint: json["check_minus_point"] == null ? null : json["check_minus_point"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
    "ugs_view": ugsView == null ? null : ugsView,
    "ugs_id": ugsId == null ? null : ugsId,
    "ugs_name": ugsName == null ? null : ugsName,
    "ugs_about_us": ugsAboutUs == null ? null : ugsAboutUs,
    "ugs_brithday": ugsBrithday == null ? null : ugsBrithday,
    "ugs_gender": ugsGender == null ? null : ugsGender,
    "ugs_marriage": ugsMarriage == null ? null : ugsMarriage,
    "nametype": nametype == null ? null : nametype,
    "ugs_address": ugsAddress == null ? null : ugsAddress,
    "ugs_day_now": ugsDayNow == null ? null : ugsDayNow,
    "ugs_experience_year": ugsExperienceYear == null ? null : ugsExperienceYear,
    "ugs_formality": ugsFormality == null ? null : ugsFormality,
    "cit_name": citName == null ? null : citName,
    "cit_detail": citDetail == null ? null : citDetail,
    "as_name": asName == null ? null : asName,
    "as_detail": asDetail == null ? null : asDetail,
    "ct_name": ctName == null ? null : ctName,
    "ugs_title": ugsTitle == null ? null : ugsTitle,
    "ugs_year_start": ugsYearStart == null ? null : ugsYearStart,
    "ugs_year_end": ugsYearEnd == null ? null : ugsYearEnd,
    "ugs_job_description": ugsJobDescription == null ? null : ugsJobDescription,
    "ugs_achievements": ugsAchievements == null ? null : ugsAchievements,
    "check_save": checkSave == null ? null : checkSave,
    "check_minus_point": checkMinusPoint == null ? null : checkMinusPoint,
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
