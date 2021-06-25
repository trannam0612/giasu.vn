// To parse this JSON data, do
//
//     final resultNotification = resultNotificationFromJson(jsonString);

import 'dart:convert';

ResultNotification resultNotificationFromJson(String str) => ResultNotification.fromJson(json.decode(str));

String resultNotificationToJson(ResultNotification data) => json.encode(data.toJson());

class ResultNotification {
  ResultNotification({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultNotification.fromJson(Map<String, dynamic> json) => ResultNotification(
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
    this.dataNoti,
  });

  bool result;
  String message;
  List<DataNoti> dataNoti;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    dataNoti: json["data_noti"] == null ? null : List<DataNoti>.from(json["data_noti"].map((x) => DataNoti.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "data_noti": dataNoti == null ? null : List<dynamic>.from(dataNoti.map((x) => x.toJson())),
  };
}

class DataNoti {
  DataNoti({
    this.ugsPh,
    this.idClass,
    this.ugsName,
    this.content,
    this.ugsAvatar,
    this.notiDate,
    this.type,
  });

  String ugsPh;
  String idClass;
  String ugsName;
  String content;
  String ugsAvatar;
  String notiDate;
  int type;

  factory DataNoti.fromJson(Map<String, dynamic> json) => DataNoti(
    ugsPh: json["ugs_ph"] == null ? null : json["ugs_ph"],
    idClass: json["id_class"] == null ? null : json["id_class"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    content: json["content"] == null ? null : json["content"],
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    notiDate: json["noti_date"] == null ? null : json["noti_date"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_ph": ugsPh == null ? null : ugsPh,
    "id_class": idClass == null ? null : idClass,
    "ugs_name": ugsName == null ? null : ugsName,
    "content": content == null ? null : content,
    "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
    "noti_date": notiDate == null ? null : notiDate,
    "type": type == null ? null : type,
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
