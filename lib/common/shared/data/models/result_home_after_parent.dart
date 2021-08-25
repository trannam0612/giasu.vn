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
    this.gsdd,
    this.gstdl,
    this.dataDsgsgd,
    this.paningGsgd,
    this.dataDsgspb,
    this.paningGspb,
  });

  bool result;
  String message;
  String gsmd;
  String gsdnd;
  String tindang;
  String gsdl;
  String gsdd;
  String gstdl;
  List<DataDsgs> dataDsgsgd;
  PaningGs paningGsgd;
  List<DataDsgs> dataDsgspb;
  PaningGs paningGspb;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    gsmd: json["gsmd"] == null ? null : json["gsmd"],
    gsdnd: json["gsdnd"] == null ? null : json["gsdnd"],
    tindang: json["tindang"] == null ? null : json["tindang"],
    gsdl: json["gsdl"] == null ? null : json["gsdl"],
    gsdd: json["gsdd"] == null ? null : json["gsdd"],
    gstdl: json["gstdl"] == null ? null : json["gstdl"],
    dataDsgsgd: json["dataDSGSGD"] == null ? null : List<DataDsgs>.from(json["dataDSGSGD"].map((x) => DataDsgs.fromJson(x))),
    paningGsgd: json["paning_gsgd"] == null ? null : PaningGs.fromJson(json["paning_gsgd"]),
    dataDsgspb: json["dataDSGSPB"] == null ? null : List<DataDsgs>.from(json["dataDSGSPB"].map((x) => DataDsgs.fromJson(x))),
    paningGspb: json["paning_gspb"] == null ? null : PaningGs.fromJson(json["paning_gspb"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "gsmd": gsmd == null ? null : gsmd,
    "gsdnd": gsdnd == null ? null : gsdnd,
    "tindang": tindang == null ? null : tindang,
    "gsdl": gsdl == null ? null : gsdl,
    "gsdd": gsdd == null ? null : gsdd,
    "gstdl": gstdl == null ? null : gstdl,
    "dataDSGSGD": dataDsgsgd == null ? null : List<dynamic>.from(dataDsgsgd.map((x) => x.toJson())),
    "paning_gsgd": paningGsgd == null ? null : paningGsgd.toJson(),
    "dataDSGSPB": dataDsgspb == null ? null : List<dynamic>.from(dataDsgspb.map((x) => x.toJson())),
    "paning_gspb": paningGspb == null ? null : paningGspb.toJson(),
  };
}

class DataDsgs {
  DataDsgs({
    this.ugsId,
    this.ugsAvatar,
    this.ugsName,
    this.linkDetailTutor,
    this.asId,
    this.asIdName,
    this.asDetail,
    this.asDetailName,
    this.ugsCity,
    this.citName,
    this.ugsCounty,
    this.cityDetailName,
    this.ugsCityGs,
    this.cityNameGs,
    this.ugsCountyGs,
    this.cityDetailNameGs,
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
  List<String> asIdName;
  String asDetail;
  List<String> asDetailName;
  String ugsCity;
  String citName;
  String ugsCounty;
  List<String> cityDetailName;
  String ugsCityGs;
  String cityNameGs;
  String ugsCountyGs;
  String cityDetailNameGs;
  String ugsAboutUs;
  String ugsUnitPrice;
  String ugsMonth;
  bool checkSave;

  factory DataDsgs.fromJson(Map<String, dynamic> json) => DataDsgs(
    ugsId: json["ugs_id"] == null ? null : json["ugs_id"],
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    linkDetailTutor: json["link_detailTutor"] == null ? null : json["link_detailTutor"],
    asId: json["as_id"] == null ? null : json["as_id"],
    asIdName: json["as_id_name"] == null ? null : List<String>.from(json["as_id_name"].map((x) => x)),
    asDetail: json["as_detail"] == null ? null : json["as_detail"],
    asDetailName: json["as_detail_name"] == null ? null : List<String>.from(json["as_detail_name"].map((x) => x)),
    ugsCity: json["ugs_city"] == null ? null : json["ugs_city"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
    ugsCounty: json["ugs_county"] == null ? null : json["ugs_county"],
    cityDetailName: json["city_detail_name"] == null ? null : List<String>.from(json["city_detail_name"].map((x) => x)),
    ugsCityGs: json["ugs_city_gs"] == null ? null : json["ugs_city_gs"],
    cityNameGs: json["city_name_gs"] == null ? null : json["city_name_gs"],
    ugsCountyGs: json["ugs_county_gs"] == null ? null : json["ugs_county_gs"],
    cityDetailNameGs: json["city_detail_name_gs"] == null ? null : json["city_detail_name_gs"],
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
    "as_id_name": asIdName == null ? null : List<dynamic>.from(asIdName.map((x) => x)),
    "as_detail": asDetail == null ? null : asDetail,
    "as_detail_name": asDetailName == null ? null : List<dynamic>.from(asDetailName.map((x) => x)),
    "ugs_city": ugsCity == null ? null : ugsCity,
    "cit_name": citName == null ? null : citName,
    "ugs_county": ugsCounty == null ? null : ugsCounty,
    "city_detail_name": cityDetailName == null ? null : List<dynamic>.from(cityDetailName.map((x) => x)),
    "ugs_city_gs": ugsCityGs == null ? null : ugsCityGs,
    "city_name_gs": cityNameGs == null ? null : cityNameGs,
    "ugs_county_gs": ugsCountyGs == null ? null : ugsCountyGs,
    "city_detail_name_gs": cityDetailNameGs == null ? null : cityDetailNameGs,
    "ugs_about_us": ugsAboutUs == null ? null : ugsAboutUs,
    "ugs_unit_price": ugsUnitPrice == null ? null : ugsUnitPrice,
    "ugs_month": ugsMonth == null ? null : ugsMonth,
    "check_save": checkSave == null ? null : checkSave,
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
