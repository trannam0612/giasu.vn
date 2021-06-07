// To parse this JSON data, do
//
//     final resultNotificationPh = resultNotificationPhFromJson(jsonString);

import 'dart:convert';

ResultNotificationPh resultNotificationPhFromJson(String str) => ResultNotificationPh.fromJson(json.decode(str));

String resultNotificationPhToJson(ResultNotificationPh data) => json.encode(data.toJson());

class ResultNotificationPh {
  ResultNotificationPh({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultNotificationPh.fromJson(Map<String, dynamic> json) => ResultNotificationPh(
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
    this.notiParent,
  });

  bool result;
  String message;
  List<NotiParent> notiParent;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    notiParent: json["noti_parent"] == null ? null : List<NotiParent>.from(json["noti_parent"].map((x) => NotiParent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "noti_parent": notiParent == null ? null : List<dynamic>.from(notiParent.map((x) => x.toJson())),
  };
}

class NotiParent {
  NotiParent({
    this.content,
    this.time,
    this.notiId,
    this.avatar,
    this.classId,
    this.teacherId,
    this.userName,
    this.checkGetClass,
    this.checkCancel,
  });

  String content;
  int time;
  String notiId;
  String avatar;
  String classId;
  String teacherId;
  String userName;
  bool checkGetClass;
  bool checkCancel;

  factory NotiParent.fromJson(Map<String, dynamic> json) => NotiParent(
    content: json["content"] == null ? null : json["content"],
    time: json["time"] == null ? null : json["time"],
    notiId: json["noti_id"] == null ? null : json["noti_id"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    classId: json["class_id"] == null ? null : json["class_id"],
    teacherId: json["teacher_id"] == null ? null : json["teacher_id"],
    userName: json["user_name"] == null ? null : json["user_name"],
    checkGetClass: json["check_get_class"] == null ? null : json["check_get_class"],
    checkCancel: json["check_cancel"] == null ? null : json["check_cancel"],
  );

  Map<String, dynamic> toJson() => {
    "content": content == null ? null : content,
    "time": time == null ? null : time,
    "noti_id": notiId == null ? null : notiId,
    "avatar": avatar == null ? null : avatar,
    "class_id": classId == null ? null : classId,
    "teacher_id": teacherId == null ? null : teacherId,
    "user_name": userName == null ? null : userName,
    "check_get_class": checkGetClass == null ? null : checkGetClass,
    "check_cancel": checkCancel == null ? null : checkCancel,
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
