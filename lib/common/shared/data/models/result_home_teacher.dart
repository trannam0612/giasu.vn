// To parse this JSON data, do
//
//     final resultHomeTeacher = resultHomeTeacherFromJson(jsonString);

import 'dart:convert';

ResultHomeTeacher resultHomeTeacherFromJson(String str) => ResultHomeTeacher.fromJson(json.decode(str));

String resultHomeTeacherToJson(ResultHomeTeacher data) => json.encode(data.toJson());

class ResultHomeTeacher {
  ResultHomeTeacher({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultHomeTeacher.fromJson(Map<String, dynamic> json) => ResultHomeTeacher(
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
    this.danhSachTinLopHocMoiNhat,
    this.infoPagingNew,
    this.danhSachLopAngTimGiaSu,
    this.infoPagingDtgs,
  });

  bool result;
  String message;
  List<DanhSach> danhSachTinLopHocMoiNhat;
  InfoPaging infoPagingNew;
  List<DanhSach> danhSachLopAngTimGiaSu;
  InfoPaging infoPagingDtgs;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    danhSachTinLopHocMoiNhat: json["Danh_sach_tin_lop_hoc_moi_nhat"] == null ? null : List<DanhSach>.from(json["Danh_sach_tin_lop_hoc_moi_nhat"].map((x) => DanhSach.fromJson(x))),
    infoPagingNew: json["info_paging_new"] == null ? null : InfoPaging.fromJson(json["info_paging_new"]),
    danhSachLopAngTimGiaSu: json["Danh_sach_lop_đang_tim_gia_su"] == null ? null : List<DanhSach>.from(json["Danh_sach_lop_đang_tim_gia_su"].map((x) => DanhSach.fromJson(x))),
    infoPagingDtgs: json["info_paging_dtgs"] == null ? null : InfoPaging.fromJson(json["info_paging_dtgs"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "Danh_sach_tin_lop_hoc_moi_nhat": danhSachTinLopHocMoiNhat == null ? null : List<dynamic>.from(danhSachTinLopHocMoiNhat.map((x) => x.toJson())),
    "info_paging_new": infoPagingNew == null ? null : infoPagingNew.toJson(),
    "Danh_sach_lop_đang_tim_gia_su": danhSachLopAngTimGiaSu == null ? null : List<dynamic>.from(danhSachLopAngTimGiaSu.map((x) => x.toJson())),
    "info_paging_dtgs": infoPagingDtgs == null ? null : infoPagingDtgs.toJson(),
  };
}

class DanhSach {
  DanhSach({
    this.avatar,
    this.classId,
    this.className,
    this.classDescribe,
    this.fee,
    this.address,
    this.url,
    this.methodTeach,
  });

  String avatar;
  String classId;
  String className;
  String classDescribe;
  String fee;
  String address;
  String url;
  String methodTeach;

  factory DanhSach.fromJson(Map<String, dynamic> json) => DanhSach(
    avatar: json["avatar"] == null ? null : json["avatar"],
    classId: json["class_id"] == null ? null : json["class_id"],
    className: json["class_name"] == null ? null : json["class_name"],
    classDescribe: json["class_describe"] == null ? null : json["class_describe"],
    fee: json["fee"] == null ? null : json["fee"],
    address: json["address"] == null ? null : json["address"],
    url: json["url"] == null ? null : json["url"],
    methodTeach: json["method_teach"] == null ? null : json["method_teach"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar == null ? null : avatar,
    "class_id": classId == null ? null : classId,
    "class_name": className == null ? null : className,
    "class_describe": classDescribe == null ? null : classDescribe,
    "fee": fee == null ? null : fee,
    "address": address == null ? null : address,
    "url": url == null ? null : url,
    "method_teach": methodTeach == null ? null : methodTeach,
  };
}

class InfoPaging {
  InfoPaging({
    this.trangSo,
    this.tongSoBanGhi,
    this.total,
  });

  int trangSo;
  int tongSoBanGhi;
  int total;

  factory InfoPaging.fromJson(Map<String, dynamic> json) => InfoPaging(
    trangSo: json["trang_so"] == null ? null : json["trang_so"],
    tongSoBanGhi: json["tong_so_ban_ghi"] == null ? null : json["tong_so_ban_ghi"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "trang_so": trangSo == null ? null : trangSo,
    "tong_so_ban_ghi": tongSoBanGhi == null ? null : tongSoBanGhi,
    "total": total == null ? null : total,
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
