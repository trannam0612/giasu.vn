// To parse this JSON data, do
//
//     final resultListInvitedClass = resultListInvitedClassFromJson(jsonString);

import 'dart:convert';

ResultListInvitedClass resultListInvitedClassFromJson(String str) => ResultListInvitedClass.fromJson(json.decode(str));

String resultListInvitedClassToJson(ResultListInvitedClass data) => json.encode(data.toJson());

class ResultListInvitedClass {
  ResultListInvitedClass({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultListInvitedClass.fromJson(Map<String, dynamic> json) => ResultListInvitedClass(
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
    this.danhSachLopMoiDay,
    this.trangSo,
    this.soBanGhiTrongTrang,
    this.total,
  });

  bool result;
  String message;
  List<DanhSachLopMoiDay> danhSachLopMoiDay;
  int trangSo;
  int soBanGhiTrongTrang;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    danhSachLopMoiDay: json["Danh_sach_lop_moi_day"] == null ? null : List<DanhSachLopMoiDay>.from(json["Danh_sach_lop_moi_day"].map((x) => DanhSachLopMoiDay.fromJson(x))),
    trangSo: json["trang_so"] == null ? null : json["trang_so"],
    soBanGhiTrongTrang: json["so_ban_ghi_trong_trang"] == null ? null : json["so_ban_ghi_trong_trang"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "Danh_sach_lop_moi_day": danhSachLopMoiDay == null ? null : List<dynamic>.from(danhSachLopMoiDay.map((x) => x.toJson())),
    "trang_so": trangSo == null ? null : trangSo,
    "so_ban_ghi_trong_trang": soBanGhiTrongTrang == null ? null : soBanGhiTrongTrang,
    "total": total == null ? null : total,
  };
}

class DanhSachLopMoiDay {
  DanhSachLopMoiDay({
    this.avatar,
    this.className,
    this.classId,
    this.subject,
    this.daySuggest,
    this.classDescribe,
    this.status,
    this.url,
  });

  String avatar;
  String className;
  String classId;
  String subject;
  String daySuggest;
  String classDescribe;
  String status;
  String url;

  factory DanhSachLopMoiDay.fromJson(Map<String, dynamic> json) => DanhSachLopMoiDay(
    avatar: json["avatar"] == null ? null : json["avatar"],
    className: json["class_name"] == null ? null : json["class_name"],
    classId: json["class_id"] == null ? null : json["class_id"],
    subject: json["subject"] == null ? null : json["subject"],
    daySuggest: json["day_suggest"] == null ? null : json["day_suggest"],
    classDescribe: json["class_describe"] == null ? null : json["class_describe"],
    status: json["status"] == null ? null : json["status"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "img": avatar == null ? null : avatar,
    "class_name": className == null ? null : className,
    "class_id": classId == null ? null : classId,
    "subject": subject == null ? null : subject,
    "day_suggest": daySuggest == null ? null : daySuggest,
    "class_describe": classDescribe == null ? null : classDescribe,
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
