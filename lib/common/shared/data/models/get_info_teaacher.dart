// To parse this JSON data, do
//
//     final resultGetInfoTeacher = resultGetInfoTeacherFromJson(jsonString);

import 'dart:convert';

ResultGetInfoTeacher resultGetInfoTeacherFromJson(String str) => ResultGetInfoTeacher.fromJson(json.decode(str));

String resultGetInfoTeacherToJson(ResultGetInfoTeacher data) => json.encode(data.toJson());

class ResultGetInfoTeacher {
  ResultGetInfoTeacher({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultGetInfoTeacher.fromJson(Map<String, dynamic> json) => ResultGetInfoTeacher(
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
    this.infoTutor,
    this.lichday,
  });

  bool result;
  String message;
  InfoTutor infoTutor;
  Lichday lichday;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    infoTutor: json["infoTutor"] == null ? null : InfoTutor.fromJson(json["infoTutor"]),
    lichday: json["lichday"] == null ? null : Lichday.fromJson(json["lichday"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "infoTutor": infoTutor == null ? null : infoTutor.toJson(),
    "lichday": lichday == null ? null : lichday.toJson(),
  };
}

class InfoTutor {
  InfoTutor({
    this.ugsId,
    this.ugsPhone,
    this.ugsEmail,
    this.ugsAvatar,
    this.ugsName,
    this.ugsGender,
    this.ugsBrithday,
    this.ugsMarriage,
    this.nametype,
    this.ctName,
    this.ugsSchool,
    this.ugsGraduationYear,
    this.ugsSpecialized,
    this.ugsAddress,
    this.ugsWorkplace,
    this.ugsAboutUs,
    this.ugsAchievements,
    this.ugsExperence,
    this.ugsTitle,
    this.ugsYearStart,
    this.ugsYearEnd,
    this.ugsJobDescription,
    this.asId,
    this.asName,
    this.asDetailId,
    this.asDetail,
    this.ugsUnitPrice,
    this.ugsTime,
    this.ugsSalary,
    this.ugsMonth,
    this.ugsCity,
    this.citName,
    this.citDetailId,
    this.citDetail,
  });

  String ugsId;
  String ugsPhone;
  String ugsEmail;
  String ugsAvatar;
  String ugsName;
  String ugsGender;
  String ugsBrithday;
  String ugsMarriage;
  String nametype;
  String ctName;
  String ugsSchool;
  String ugsGraduationYear;
  String ugsSpecialized;
  String ugsAddress;
  String ugsWorkplace;
  String ugsAboutUs;
  String ugsAchievements;
  dynamic ugsExperence;
  String ugsTitle;
  String ugsYearStart;
  String ugsYearEnd;
  String ugsJobDescription;
  String asId;
  String asName;
  String asDetailId;
  List<String> asDetail;
  String ugsUnitPrice;
  String ugsTime;
  String ugsSalary;
  String ugsMonth;
  String ugsCity;
  String citName;
  String citDetailId;
  List<String> citDetail;

  factory InfoTutor.fromJson(Map<String, dynamic> json) => InfoTutor(
    ugsId: json["ugs_id"] == null ? null : json["ugs_id"],
    ugsPhone: json["ugs_phone"] == null ? null : json["ugs_phone"],
    ugsEmail: json["ugs_email"] == null ? null : json["ugs_email"],
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    ugsGender: json["ugs_gender"] == null ? null : json["ugs_gender"],
    ugsBrithday: json["ugs_brithday"] == null ? null : json["ugs_brithday"],
    ugsMarriage: json["ugs_marriage"] == null ? null : json["ugs_marriage"],
    nametype: json["nametype"] == null ? null : json["nametype"],
    ctName: json["ct_name"] == null ? null : json["ct_name"],
    ugsSchool: json["ugs_school"] == null ? null : json["ugs_school"],
    ugsGraduationYear: json["ugs_graduation_year"] == null ? null : json["ugs_graduation_year"],
    ugsSpecialized: json["ugs_specialized"] == null ? null : json["ugs_specialized"],
    ugsAddress: json["ugs_address"] == null ? null : json["ugs_address"],
    ugsWorkplace: json["ugs_workplace"] == null ? null : json["ugs_workplace"],
    ugsAboutUs: json["ugs_about_us"] == null ? null : json["ugs_about_us"],
    ugsAchievements: json["ugs_achievements"] == null ? null : json["ugs_achievements"],
    ugsExperence: json["ugs_experence"],
    ugsTitle: json["ugs_title"] == null ? null : json["ugs_title"],
    ugsYearStart: json["ugs_year_start"] == null ? null : json["ugs_year_start"],
    ugsYearEnd: json["ugs_year_end"] == null ? null : json["ugs_year_end"],
    ugsJobDescription: json["ugs_job_description"] == null ? null : json["ugs_job_description"],
    asId: json["as_id"] == null ? null : json["as_id"],
    asName: json["as_name"] == null ? null : json["as_name"],
    asDetailId: json["as_detail_id"] == null ? null : json["as_detail_id"],
    asDetail: json["as_detail"] == null ? null : List<String>.from(json["as_detail"].map((x) => x)),
    ugsUnitPrice: json["ugs_unit_price"] == null ? null : json["ugs_unit_price"],
    ugsTime: json["ugs_time"] == null ? null : json["ugs_time"],
    ugsSalary: json["ugs_salary"] == null ? null : json["ugs_salary"],
    ugsMonth: json["ugs_month"] == null ? null : json["ugs_month"],
    ugsCity: json["ugs_city"] == null ? null : json["ugs_city"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
    citDetailId: json["cit_detail_id"] == null ? null : json["cit_detail_id"],
    citDetail: json["cit_detail"] == null ? null : List<String>.from(json["cit_detail"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ugs_id": ugsId == null ? null : ugsId,
    "ugs_phone": ugsPhone == null ? null : ugsPhone,
    "ugs_email": ugsEmail == null ? null : ugsEmail,
    "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
    "ugs_name": ugsName == null ? null : ugsName,
    "ugs_gender": ugsGender == null ? null : ugsGender,
    "ugs_brithday": ugsBrithday == null ? null : ugsBrithday,
    "ugs_marriage": ugsMarriage == null ? null : ugsMarriage,
    "nametype": nametype == null ? null : nametype,
    "ct_name": ctName == null ? null : ctName,
    "ugs_school": ugsSchool == null ? null : ugsSchool,
    "ugs_graduation_year": ugsGraduationYear == null ? null : ugsGraduationYear,
    "ugs_specialized": ugsSpecialized == null ? null : ugsSpecialized,
    "ugs_address": ugsAddress == null ? null : ugsAddress,
    "ugs_workplace": ugsWorkplace == null ? null : ugsWorkplace,
    "ugs_about_us": ugsAboutUs == null ? null : ugsAboutUs,
    "ugs_achievements": ugsAchievements == null ? null : ugsAchievements,
    "ugs_experence": ugsExperence,
    "ugs_title": ugsTitle == null ? null : ugsTitle,
    "ugs_year_start": ugsYearStart == null ? null : ugsYearStart,
    "ugs_year_end": ugsYearEnd == null ? null : ugsYearEnd,
    "ugs_job_description": ugsJobDescription == null ? null : ugsJobDescription,
    "as_id": asId == null ? null : asId,
    "as_name": asName == null ? null : asName,
    "as_detail_id": asDetailId == null ? null : asDetailId,
    "as_detail": asDetail == null ? null : List<dynamic>.from(asDetail.map((x) => x)),
    "ugs_unit_price": ugsUnitPrice == null ? null : ugsUnitPrice,
    "ugs_time": ugsTime == null ? null : ugsTime,
    "ugs_salary": ugsSalary == null ? null : ugsSalary,
    "ugs_month": ugsMonth == null ? null : ugsMonth,
    "ugs_city": ugsCity == null ? null : ugsCity,
    "cit_name": citName == null ? null : citName,
    "cit_detail_id": citDetailId == null ? null : citDetailId,
    "cit_detail": citDetail == null ? null : List<dynamic>.from(citDetail.map((x) => x)),
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
