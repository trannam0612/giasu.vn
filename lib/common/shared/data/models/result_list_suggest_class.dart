// To parse this JSON data, do
//
//     final resultListSuggestClass = resultListSuggestClassFromJson(jsonString);

import 'dart:convert';

ResultListSuggestClass resultListSuggestClassFromJson(String str) => ResultListSuggestClass.fromJson(json.decode(str));

String resultListSuggestClassToJson(ResultListSuggestClass data) => json.encode(data.toJson());

class ResultListSuggestClass {
  ResultListSuggestClass({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultListSuggestClass.fromJson(Map<String, dynamic> json) => ResultListSuggestClass(
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
    this.danhSachLopDeNghiDay,
    this.trangSo,
    this.tongSoBanGhiTrongTrang,
    this.total,
  });

  bool result;
  String message;
  List<DanhSachLopDeNghiDay> danhSachLopDeNghiDay;
  int trangSo;
  int tongSoBanGhiTrongTrang;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    danhSachLopDeNghiDay: json["Danh_sach_lop_de_nghi_day"] == null ? null : List<DanhSachLopDeNghiDay>.from(json["Danh_sach_lop_de_nghi_day"].map((x) => DanhSachLopDeNghiDay.fromJson(x))),
    trangSo: json["trang_so"] == null ? null : json["trang_so"],
    tongSoBanGhiTrongTrang: json["tong_so_ban_ghi_trong_trang"] == null ? null : json["tong_so_ban_ghi_trong_trang"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "Danh_sach_lop_de_nghi_day": danhSachLopDeNghiDay == null ? null : List<dynamic>.from(danhSachLopDeNghiDay.map((x) => x.toJson())),
    "trang_so": trangSo == null ? null : trangSo,
    "tong_so_ban_ghi_trong_trang": tongSoBanGhiTrongTrang == null ? null : tongSoBanGhiTrongTrang,
    "total": total == null ? null : total,
  };
}

class DanhSachLopDeNghiDay {
  DanhSachLopDeNghiDay({
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

  factory DanhSachLopDeNghiDay.fromJson(Map<String, dynamic> json) => DanhSachLopDeNghiDay(
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
    "avatar": avatar == null ? null : avatar,
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
