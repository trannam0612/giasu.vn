// To parse this JSON data, do
//
//     final resultClassCreated = resultClassCreatedFromJson(jsonString);

import 'dart:convert';

ResultClassCreated resultClassCreatedFromJson(String str) => ResultClassCreated.fromJson(json.decode(str));

String resultClassCreatedToJson(ResultClassCreated data) => json.encode(data.toJson());

class ResultClassCreated {
  ResultClassCreated({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultClassCreated.fromJson(Map<String, dynamic> json) => ResultClassCreated(
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
    this.listClassCreated,
    this.trangSo,
    this.tongSoBanGhiTrongTrang,
    this.total,
  });

  bool result;
  String message;
  List<ListClassCreated> listClassCreated;
  int trangSo;
  int tongSoBanGhiTrongTrang;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    listClassCreated: json["list_class_created"] == null ? null : List<ListClassCreated>.from(json["list_class_created"].map((x) => ListClassCreated.fromJson(x))),
    trangSo: json["trang_so"] == null ? null : json["trang_so"],
    tongSoBanGhiTrongTrang: json["tong_so_ban_ghi_trong_trang"] == null ? null : json["tong_so_ban_ghi_trong_trang"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "list_class_created": listClassCreated == null ? null : List<dynamic>.from(listClassCreated.map((x) => x.toJson())),
    "trang_so": trangSo == null ? null : trangSo,
    "tong_so_ban_ghi_trong_trang": tongSoBanGhiTrongTrang == null ? null : tongSoBanGhiTrongTrang,
    "total": total == null ? null : total,
  };
}

class ListClassCreated {
  ListClassCreated({
    this.avatar,
    this.className,
    this.classId,
    this.subject,
    this.createdAt,
    this.fee,
    this.methodTeach,
    this.url,
  });

  String avatar;
  String className;
  String classId;
  String subject;
  String createdAt;
  String fee;
  String methodTeach;
  String url;

  factory ListClassCreated.fromJson(Map<String, dynamic> json) => ListClassCreated(
    avatar: json["avatar"] == null ? null : json["avatar"],
    className: json["class_name"] == null ? null : json["class_name"],
    classId: json["class_id"] == null ? null : json["class_id"],
    subject: json["subject"] == null ? null : json["subject"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    fee: json["fee"] == null ? null : json["fee"],
    methodTeach: json["method_teach"] == null ? null : json["method_teach"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar == null ? null : avatar,
    "class_name": className == null ? null : className,
    "class_id": classId == null ? null : classId,
    "subject": subject == null ? null : subject,
    "created_at": createdAt == null ? null : createdAt,
    "fee": fee == null ? null : fee,
    "method_teach": methodTeach == null ? null : methodTeach,
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
