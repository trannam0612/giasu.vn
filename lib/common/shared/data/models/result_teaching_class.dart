// To parse this JSON data, do
//
//     final resultTeachingClass = resultTeachingClassFromJson(jsonString);

import 'dart:convert';

ResultTeachingClass resultTeachingClassFromJson(String str) => ResultTeachingClass.fromJson(json.decode(str));

String resultTeachingClassToJson(ResultTeachingClass data) => json.encode(data.toJson());

class ResultTeachingClass {
  ResultTeachingClass({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultTeachingClass.fromJson(Map<String, dynamic> json) => ResultTeachingClass(
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
    this.danhSachLopDaNhanDay,
    this.trangSo,
    this.tongSoBanGhiTrongTrang,
    this.total,
  });

  bool result;
  String message;
  List<DanhSachLopDaNhanDay> danhSachLopDaNhanDay;
  int trangSo;
  int tongSoBanGhiTrongTrang;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    danhSachLopDaNhanDay: json["Danh_sach_lop_da_nhan_day"] == null ? null : List<DanhSachLopDaNhanDay>.from(json["Danh_sach_lop_da_nhan_day"].map((x) => DanhSachLopDaNhanDay.fromJson(x))),
    trangSo: json["trang_so"] == null ? null : json["trang_so"],
    tongSoBanGhiTrongTrang: json["tong_so_ban_ghi_trong_trang"] == null ? null : json["tong_so_ban_ghi_trong_trang"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "Danh_sach_lop_da_nhan_day": danhSachLopDaNhanDay == null ? null : List<dynamic>.from(danhSachLopDaNhanDay.map((x) => x.toJson())),
    "trang_so": trangSo == null ? null : trangSo,
    "tong_so_ban_ghi_trong_trang": tongSoBanGhiTrongTrang == null ? null : tongSoBanGhiTrongTrang,
    "total": total == null ? null : total,
  };
}

class DanhSachLopDaNhanDay {
  DanhSachLopDaNhanDay({
    this.avatar,
    this.className,
    this.classId,
    this.subject,
    this.dayGet,
    this.classDescribe,
    this.status,
    this.url,
  });

  String avatar;
  String className;
  String classId;
  String subject;
  String dayGet;
  String classDescribe;
  String status;
  String url;

  factory DanhSachLopDaNhanDay.fromJson(Map<String, dynamic> json) => DanhSachLopDaNhanDay(
    avatar: json["avatar"] == null ? null : json["avatar"],
    className: json["class_name"] == null ? null : json["class_name"],
    classId: json["class_id"] == null ? null : json["class_id"],
    subject: json["subject"] == null ? null : json["subject"],
    dayGet: json["day_get"] == null ? null : json["day_get"],
    classDescribe: json["class_describe"] == null ? null : json["class_describe"],
    status: json["status"] == null ? null : json["status"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar == null ? null : avatar,
    "class_name": className == null ? null : className,
    "class_id": classId == null ? null : classId,
    "subject": subject == null ? null : subject,
    "day_get": dayGet == null ? null : dayGet,
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
