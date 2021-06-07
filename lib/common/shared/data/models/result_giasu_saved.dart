// To parse this JSON data, do
//
//     final resultGiaSuSaved = resultGiaSuSavedFromJson(jsonString);

import 'dart:convert';

ResultGiaSuSaved resultGiaSuSavedFromJson(String str) => ResultGiaSuSaved.fromJson(json.decode(str));

String resultGiaSuSavedToJson(ResultGiaSuSaved data) => json.encode(data.toJson());

class ResultGiaSuSaved {
  ResultGiaSuSaved({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultGiaSuSaved.fromJson(Map<String, dynamic> json) => ResultGiaSuSaved(
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
    this.danhSachGiaSuDaLuu,
    this.trangSo,
    this.tongSoBanGhi,
  });

  bool result;
  String message;
  List<DanhSachGiaSuDaLuu> danhSachGiaSuDaLuu;
  int trangSo;
  int tongSoBanGhi;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    danhSachGiaSuDaLuu: json["Danh_sach_gia_su_da_luu"] == null ? null : List<DanhSachGiaSuDaLuu>.from(json["Danh_sach_gia_su_da_luu"].map((x) => DanhSachGiaSuDaLuu.fromJson(x))),
    trangSo: json["trang_so"] == null ? null : json["trang_so"],
    tongSoBanGhi: json["tong_so_ban_ghi"] == null ? null : json["tong_so_ban_ghi"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "Danh_sach_gia_su_da_luu": danhSachGiaSuDaLuu == null ? null : List<dynamic>.from(danhSachGiaSuDaLuu.map((x) => x.toJson())),
    "trang_so": trangSo == null ? null : trangSo,
    "tong_so_ban_ghi": tongSoBanGhi == null ? null : tongSoBanGhi,
  };
}

class DanhSachGiaSuDaLuu {
  DanhSachGiaSuDaLuu({
    this.idTeacher,
    this.avatar,
    this.userName,
    this.subject,
    this.daySave,
    this.url,
  });

  String idTeacher;
  String avatar;
  String userName;
  String subject;
  String daySave;
  String url;

  factory DanhSachGiaSuDaLuu.fromJson(Map<String, dynamic> json) => DanhSachGiaSuDaLuu(
    idTeacher: json["id_teacher"] == null ? null : json["id_teacher"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    userName: json["user_name"] == null ? null : json["user_name"],
    subject: json["subject"] == null ? null : json["subject"],
    daySave: json["day_save"] == null ? null : json["day_save"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id_teacher": idTeacher == null ? null : idTeacher,
    "avatar": avatar == null ? null : avatar,
    "user_name": userName == null ? null : userName,
    "subject": subject == null ? null : subject,
    "day_save": daySave == null ? null : daySave,
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
