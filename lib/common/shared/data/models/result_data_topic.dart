// To parse this JSON data, do
//
//     final resultDataTopic = resultDataTopicFromJson(jsonString);

import 'dart:convert';

ResultDataTopic resultDataTopicFromJson(String str) => ResultDataTopic.fromJson(json.decode(str));

String resultDataTopicToJson(ResultDataTopic data) => json.encode(data.toJson());

class ResultDataTopic {
  ResultDataTopic({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultDataTopic.fromJson(Map<String, dynamic> json) => ResultDataTopic(
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
    this.danhSachMonHocChiTietTheoMonHoc,
  });

  bool result;
  String message;
  List<DanhSachMonHocChiTietTheoMonHoc> danhSachMonHocChiTietTheoMonHoc;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    danhSachMonHocChiTietTheoMonHoc: json["Danh_sach_mon_hoc_chi_tiet_theo_mon_hoc"] == null ? null : List<DanhSachMonHocChiTietTheoMonHoc>.from(json["Danh_sach_mon_hoc_chi_tiet_theo_mon_hoc"].map((x) => DanhSachMonHocChiTietTheoMonHoc.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "Danh_sach_mon_hoc_chi_tiet_theo_mon_hoc": danhSachMonHocChiTietTheoMonHoc == null ? null : List<dynamic>.from(danhSachMonHocChiTietTheoMonHoc.map((x) => x.toJson())),
  };
}

class DanhSachMonHocChiTietTheoMonHoc {
  DanhSachMonHocChiTietTheoMonHoc({
    this.topicId,
    this.nameTopic,
    this.idSubject,
    this.subject,
  });

  int topicId;
  String nameTopic;
  int idSubject;
  String subject;

  factory DanhSachMonHocChiTietTheoMonHoc.fromJson(Map<String, dynamic> json) => DanhSachMonHocChiTietTheoMonHoc(
    topicId: json["topic_id"] == null ? null : json["topic_id"],
    nameTopic: json["NameTopic"] == null ? null : json["NameTopic"],
    idSubject: json["id_subject"] == null ? null : json["id_subject"],
    subject: json["subject"] == null ? null : json["subject"],
  );

  Map<String, dynamic> toJson() => {
    "topic_id": topicId == null ? null : topicId,
    "NameTopic": nameTopic == null ? null : nameTopic,
    "id_subject": idSubject == null ? null : idSubject,
    "subject": subject == null ? null : subject,
  };
}

class Error {
  Error({
    this.result,
    this.message,
  });

  bool result;
  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
  };
}
