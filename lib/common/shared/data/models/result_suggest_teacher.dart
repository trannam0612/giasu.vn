// To parse this JSON data, do
//
//     final resultSuggestTeacher = resultSuggestTeacherFromJson(jsonString);

import 'dart:convert';

ResultSuggestTeacher resultSuggestTeacherFromJson(String str) => ResultSuggestTeacher.fromJson(json.decode(str));

String resultSuggestTeacherToJson(ResultSuggestTeacher data) => json.encode(data.toJson());

class ResultSuggestTeacher {
  ResultSuggestTeacher({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultSuggestTeacher.fromJson(Map<String, dynamic> json) => ResultSuggestTeacher(
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
    this.danhSachGiaSuDaDeNghiDay,
    this.trangSo,
    this.soBanGhiTrongTrang,
    this.total,
  });

  bool result;
  String message;
  List<DanhSachGiaSuDaDeNghiDay> danhSachGiaSuDaDeNghiDay;
  int trangSo;
  int soBanGhiTrongTrang;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    danhSachGiaSuDaDeNghiDay: json["Danh_sach_gia_su_da_de_nghi_day"] == null ? null : List<DanhSachGiaSuDaDeNghiDay>.from(json["Danh_sach_gia_su_da_de_nghi_day"].map((x) => DanhSachGiaSuDaDeNghiDay.fromJson(x))),
    trangSo: json["trang_so"] == null ? null : json["trang_so"],
    soBanGhiTrongTrang: json["so_ban_ghi_trong_trang"] == null ? null : json["so_ban_ghi_trong_trang"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "Danh_sach_gia_su_da_de_nghi_day": danhSachGiaSuDaDeNghiDay == null ? null : List<dynamic>.from(danhSachGiaSuDaDeNghiDay.map((x) => x.toJson())),
    "trang_so": trangSo == null ? null : trangSo,
    "so_ban_ghi_trong_trang": soBanGhiTrongTrang == null ? null : soBanGhiTrongTrang,
    "total": total == null ? null : total,
  };
}

class DanhSachGiaSuDaDeNghiDay {
  DanhSachGiaSuDaDeNghiDay({
    this.idTeacher,
    this.avatar,
    this.userName,
    this.subject,
    this.daySuggest,
    this.methodTeach,
    this.status,
    this.url,
  });

  String idTeacher;
  String avatar;
  String userName;
  String subject;
  String daySuggest;
  String methodTeach;
  String status;
  String url;

  factory DanhSachGiaSuDaDeNghiDay.fromJson(Map<String, dynamic> json) => DanhSachGiaSuDaDeNghiDay(
    idTeacher: json["id_teacher"] == null ? null : json["id_teacher"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    userName: json["user_name"] == null ? null : json["user_name"],
    subject: json["subject"] == null ? null : json["subject"],
    daySuggest: json["day_suggest"] == null ? null : json["day_suggest"],
    methodTeach: json["method_teach"] == null ? null : json["method_teach"],
    status: json["status"] == null ? null : json["status"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id_teacher": idTeacher == null ? null : idTeacher,
    "avatar": avatar == null ? null : avatar,
    "user_name": userName == null ? null : userName,
    "subject": subject == null ? null : subject,
    "day_suggest": daySuggest == null ? null : daySuggest,
    "method_teach": methodTeach == null ? null : methodTeach,
    "status": status == null ? null : status,
    "url": url == null ? null : url,
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
