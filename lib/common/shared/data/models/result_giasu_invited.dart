// To parse this JSON data, do
//
//     final resultGiaSuInvited = resultGiaSuInvitedFromJson(jsonString);

import 'dart:convert';

ResultGiaSuInvited resultGiaSuInvitedFromJson(String str) => ResultGiaSuInvited.fromJson(json.decode(str));

String resultGiaSuInvitedToJson(ResultGiaSuInvited data) => json.encode(data.toJson());

class ResultGiaSuInvited {
  ResultGiaSuInvited({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultGiaSuInvited.fromJson(Map<String, dynamic> json) => ResultGiaSuInvited(
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
    this.listTeacherInvited,
    this.trangSo,
    this.tongSoBanGhi,
    this.total,
  });

  bool result;
  String message;
  List<ListTeacherInvited> listTeacherInvited;
  int trangSo;
  int tongSoBanGhi;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    listTeacherInvited: json["list_teacher_invited"] == null ? null : List<ListTeacherInvited>.from(json["list_teacher_invited"].map((x) => ListTeacherInvited.fromJson(x))),
    trangSo: json["trang_so"] == null ? null : json["trang_so"],
    tongSoBanGhi: json["tong_so_ban_ghi"] == null ? null : json["tong_so_ban_ghi"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "list_teacher_invited": listTeacherInvited == null ? null : List<dynamic>.from(listTeacherInvited.map((x) => x.toJson())),
    "trang_so": trangSo == null ? null : trangSo,
    "tong_so_ban_ghi": tongSoBanGhi == null ? null : tongSoBanGhi,
    "total": total == null ? null : total,
  };
}

class ListTeacherInvited {
  ListTeacherInvited({
    this.idTeacher,
    this.avatar,
    this.userName,
    this.subject,
    this.dayInvite,
    this.status,
    this.methodTeach,
    this.url,
  });

  String idTeacher;
  String avatar;
  String userName;
  String subject;
  String dayInvite;
  String status;
  String methodTeach;
  String url;

  factory ListTeacherInvited.fromJson(Map<String, dynamic> json) => ListTeacherInvited(
    idTeacher: json["id_teacher"] == null ? null : json["id_teacher"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    userName: json["user_name"] == null ? null : json["user_name"],
    subject: json["subject"] == null ? null : json["subject"],
    dayInvite: json["day_invite"] == null ? null : json["day_invite"],
    status: json["status"] == null ? null : json["status"],
    methodTeach: json["method_teach"] == null ? null : json["method_teach"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id_teacher": idTeacher == null ? null : idTeacher,
    "avatar": avatar == null ? null : avatar,
    "user_name": userName == null ? null : userName,
    "subject": subject == null ? null : subject,
    "day_invite": dayInvite == null ? null : dayInvite,
    "status": status == null ? null : status,
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
