// To parse this JSON data, do
//
//     final resultHomeAfterParent = resultHomeAfterParentFromJson(jsonString);

import 'dart:convert';

ResultHomeAfterParent resultHomeAfterParentFromJson(String str) => ResultHomeAfterParent.fromJson(json.decode(str));

String resultHomeAfterParentToJson(ResultHomeAfterParent data) => json.encode(data.toJson());

class ResultHomeAfterParent {
  ResultHomeAfterParent({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultHomeAfterParent.fromJson(Map<String, dynamic> json) => ResultHomeAfterParent(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    error: json["error"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "error": error,
  };
}

class Data {
  Data({
    this.result,
    this.message,
    this.gsmd,
    this.gsdnd,
    this.tindang,
    this.gsdl,
    this.dataTutorGd,
    this.paningGsgd,
    this.dataTutorPb,
    this.paningGspb,
  });

  bool result;
  String message;
  String gsmd;
  String gsdnd;
  String tindang;
  String gsdl;
  DataTutorGd dataTutorGd;
  PaningGs paningGsgd;
  DataTutorPb dataTutorPb;
  PaningGs paningGspb;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    gsmd: json["gsmd"] == null ? null : json["gsmd"],
    gsdnd: json["gsdnd"] == null ? null : json["gsdnd"],
    tindang: json["tindang"] == null ? null : json["tindang"],
    gsdl: json["gsdl"] == null ? null : json["gsdl"],
    dataTutorGd: json["dataTutorGD"] == null ? null : DataTutorGd.fromJson(json["dataTutorGD"]),
    paningGsgd: json["paning_gsgd"] == null ? null : PaningGs.fromJson(json["paning_gsgd"]),
    dataTutorPb: json["dataTutorPB"] == null ? null : DataTutorPb.fromJson(json["dataTutorPB"]),
    paningGspb: json["paning_gspb"] == null ? null : PaningGs.fromJson(json["paning_gspb"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "gsmd": gsmd == null ? null : gsmd,
    "gsdnd": gsdnd == null ? null : gsdnd,
    "tindang": tindang == null ? null : tindang,
    "gsdl": gsdl == null ? null : gsdl,
    "dataTutorGD": dataTutorGd == null ? null : dataTutorGd.toJson(),
    "paning_gsgd": paningGsgd == null ? null : paningGsgd.toJson(),
    "dataTutorPB": dataTutorPb == null ? null : dataTutorPb.toJson(),
    "paning_gspb": paningGspb == null ? null : paningGspb.toJson(),
  };
}

class DataTutorGd {
  DataTutorGd({
    this.dataDsgsgd,
  });

  List<DataDsgs> dataDsgsgd;

  factory DataTutorGd.fromJson(Map<String, dynamic> json) => DataTutorGd(
    dataDsgsgd: json["dataDSGSGD"] == null ? null : List<DataDsgs>.from(json["dataDSGSGD"].map((x) => DataDsgs.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "dataDSGSGD": dataDsgsgd == null ? null : List<dynamic>.from(dataDsgsgd.map((x) => x.toJson())),
  };
}

class DataDsgs {
  DataDsgs({
    this.ugsId,
    this.ugsAvatar,
    this.ugsName,
    this.linkDetailTutor,
    this.asId,
    this.asName,
    this.asDetail,
    this.ugsCity,
    this.citName,
    this.ugsCounty,
    this.ugsAboutUs,
    this.ugsUnitPrice,
    this.ugsMonth,
    this.checkSave,
  });

  String ugsId;
  String ugsAvatar;
  String ugsName;
  String linkDetailTutor;
  String asId;
  String asName;
  String asDetail;
  String ugsCity;
  String citName;
  String ugsCounty;
  String ugsAboutUs;
  String ugsUnitPrice;
  String ugsMonth;
  String checkSave;

  factory DataDsgs.fromJson(Map<String, dynamic> json) => DataDsgs(
    ugsId: json["ugs_id"] == null ? null : json["ugs_id"],
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    linkDetailTutor: json["link_detailTutor"] == null ? null : json["link_detailTutor"],
    asId: json["as_id"] == null ? null : json["as_id"],
    asName: json["as_name"] == null ? null : json["as_name"],
    asDetail: json["as_detail"] == null ? null : json["as_detail"],
    ugsCity: json["ugs_city"] == null ? null : json["ugs_city"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
    ugsCounty: json["ugs_county"] == null ? null : json["ugs_county"],
    ugsAboutUs: json["ugs_about_us"] == null ? null : json["ugs_about_us"],
    ugsUnitPrice: json["ugs_unit_price"] == null ? null : json["ugs_unit_price"],
    ugsMonth: json["ugs_month"] == null ? null : json["ugs_month"],
    checkSave: json["check_save"] == null ? null : json["check_save"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_id": ugsId == null ? null : ugsId,
    "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
    "ugs_name": ugsName == null ? null : ugsName,
    "link_detailTutor": linkDetailTutor == null ? null : linkDetailTutor,
    "as_id": asId == null ? null : asId,
    "as_name": asName == null ? null : asName,
    "as_detail": asDetail == null ? null : asDetail,
    "ugs_city": ugsCity == null ? null : ugsCity,
    "cit_name": citName == null ? null : citName,
    "ugs_county": ugsCounty == null ? null : ugsCounty,
    "ugs_about_us": ugsAboutUs == null ? null : ugsAboutUs,
    "ugs_unit_price": ugsUnitPrice == null ? null : ugsUnitPrice,
    "ugs_month": ugsMonth == null ? null : ugsMonth,
    "check_save": checkSave == null ? null : checkSave,
  };
}

class DataTutorPb {
  DataTutorPb({
    this.dataDsgspb,
  });

  List<DataDsgs> dataDsgspb;

  factory DataTutorPb.fromJson(Map<String, dynamic> json) => DataTutorPb(
    dataDsgspb: json["dataDSGSPB"] == null ? null : List<DataDsgs>.from(json["dataDSGSPB"].map((x) => DataDsgs.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "dataDSGSPB": dataDsgspb == null ? null : List<dynamic>.from(dataDsgspb.map((x) => x.toJson())),
  };
}

class PaningGs {
  PaningGs({
    this.currentPage,
    this.limit,
    this.total,
  });

  String currentPage;
  int limit;
  int total;

  factory PaningGs.fromJson(Map<String, dynamic> json) => PaningGs(
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}
