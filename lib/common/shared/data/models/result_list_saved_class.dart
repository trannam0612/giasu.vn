// To parse this JSON data, do
//
//     final resultListSavedClass = resultListSavedClassFromJson(jsonString);

import 'dart:convert';

ResultListSavedClass resultListSavedClassFromJson(String str) => ResultListSavedClass.fromJson(json.decode(str));

String resultListSavedClassToJson(ResultListSavedClass data) => json.encode(data.toJson());

class ResultListSavedClass {
  ResultListSavedClass({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultListSavedClass.fromJson(Map<String, dynamic> json) => ResultListSavedClass(
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
    this.danhSachLopDaLuu,
    this.trangSo,
    this.tongSoBanGhiTrongTrang,
    this.total,
  });

  bool result;
  String message;
  List<DanhSachLopDaLuu> danhSachLopDaLuu;
  int trangSo;
  int tongSoBanGhiTrongTrang;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    danhSachLopDaLuu: json["Danh_sach_lop_da_luu"] == null ? null : List<DanhSachLopDaLuu>.from(json["Danh_sach_lop_da_luu"].map((x) => DanhSachLopDaLuu.fromJson(x))),
    trangSo: json["trang_so"] == null ? null : json["trang_so"],
    tongSoBanGhiTrongTrang: json["tong_so_ban_ghi_trong_trang"] == null ? null : json["tong_so_ban_ghi_trong_trang"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "Danh_sach_lop_da_luu": danhSachLopDaLuu == null ? null : List<dynamic>.from(danhSachLopDaLuu.map((x) => x.toJson())),
    "trang_so": trangSo == null ? null : trangSo,
    "tong_so_ban_ghi_trong_trang": tongSoBanGhiTrongTrang == null ? null : tongSoBanGhiTrongTrang,
    "total": total == null ? null : total,
  };
}

class DanhSachLopDaLuu {
  DanhSachLopDaLuu({
    this.avatar,
    this.className,
    this.classId,
    this.subject,
    this.createdAt,
    this.classDescribe,
    this.status,
    this.url,
  });

  String avatar;
  String className;
  String classId;
  String subject;
  String createdAt;
  String classDescribe;
  String status;
  String url;

  factory DanhSachLopDaLuu.fromJson(Map<String, dynamic> json) => DanhSachLopDaLuu(
    avatar: json["avatar"] == null ? null : json["avatar"],
    className: json["class_name"] == null ? null : json["class_name"],
    classId: json["class_id"] == null ? null : json["class_id"],
    subject: json["subject"] == null ? null : json["subject"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    classDescribe: json["class_describe"] == null ? null : json["class_describe"],
    status: json["status"] == null ? null : json["status"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar == null ? null : avatar,
    "class_name": className == null ? null : className,
    "class_id": classId == null ? null : classId,
    "subject": subject == null ? null : subject,
    "created_at": createdAt == null ? null : createdAt,
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
