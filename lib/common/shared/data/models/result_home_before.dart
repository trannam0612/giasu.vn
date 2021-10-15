// To parse this JSON data, do
//
//     final resultHomeBefore = resultHomeBeforeFromJson(jsonString);

import 'dart:convert';

ResultHomeBefore resultHomeBeforeFromJson(String str) => ResultHomeBefore.fromJson(json.decode(str));

String resultHomeBeforeToJson(ResultHomeBefore data) => json.encode(data.toJson());

class ResultHomeBefore {
  ResultHomeBefore({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultHomeBefore.fromJson(Map<String, dynamic> json) => ResultHomeBefore(
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
    this.dataGs,
    this.paningGs,
    this.dataDslh,
    this.paningLh,
  });

  bool result;
  String message;
  List<DataG> dataGs;
  PaningGs paningGs;
  List<DataDslh> dataDslh;
  PaningLh paningLh;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        result: json["result"] == null ? null : json["result"],
        message: json["message"] == null ? null : json["message"],
        dataGs: json["dataGs"] == null ? null : List<DataG>.from(json["dataGs"].map((x) => DataG.fromJson(x))),
        paningGs: json["paning_gs"] == null ? null : PaningGs.fromJson(json["paning_gs"]),
        dataDslh: json["dataDSLH"] == null ? null : List<DataDslh>.from(json["dataDSLH"].map((x) => DataDslh.fromJson(x))),
        paningLh: json["paning_lh"] == null ? null : PaningLh.fromJson(json["paning_lh"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result,
        "message": message == null ? null : message,
        "dataGs": dataGs == null ? null : List<dynamic>.from(dataGs.map((x) => x.toJson())),
        "paning_gs": paningGs == null ? null : paningGs.toJson(),
        "dataDSLH": dataDslh == null ? null : List<dynamic>.from(dataDslh.map((x) => x.toJson())),
        "paning_lh": paningLh == null ? null : paningLh.toJson(),
      };
}

class DataDslh {
  DataDslh({
    this.pftId,
    this.pftSummary,
    this.linkDetailClass,
    this.cityId,
    this.citName,
    this.cityDetail,
    this.ctyDetail,
    this.asId,
    this.asName,
    this.asDetail,
    this.asDetailName,
    this.pftForm,
    this.pftPrice,
    this.pftMonth,
    this.dayPost,
    this.countDnd,
  });

  String pftId;
  String pftSummary;
  String linkDetailClass;
  String cityId;
  String citName;
  String cityDetail;
  String ctyDetail;
  String asId;
  String asName;
  String asDetail;
  String asDetailName;
  String pftForm;
  String pftPrice;
  String pftMonth;
  String dayPost;
  String countDnd;

  factory DataDslh.fromJson(Map<String, dynamic> json) => DataDslh(
        pftId: json["pft_id"] == null ? null : json["pft_id"],
        pftSummary: json["pft_summary"] == null ? null : json["pft_summary"],
        linkDetailClass: json["link_detailClass"] == null ? null : json["link_detailClass"],
        cityId: json["city_id"] == null ? null : json["city_id"],
        citName: json["cit_name"] == null ? null : json["cit_name"],
        cityDetail: json["city_detail"] == null ? null : json["city_detail"],
        ctyDetail: json["cty_detail"] == null ? null : json["cty_detail"],
        asId: json["as_id"] == null ? null : json["as_id"],
        asName: json["as_name"] == null ? null : json["as_name"],
        asDetail: json["as_detail"] == null ? null : json["as_detail"],
        asDetailName: json["as_detail_name"] == null ? null : json["as_detail_name"],
        pftForm: json["pft_form"] == null ? null : json["pft_form"],
        pftPrice: json["pft_price"] == null ? null : json["pft_price"],
        pftMonth: json["pft_month"] == null ? null : json["pft_month"],
        dayPost: json["day_post"] == null ? null : json["day_post"],
        countDnd: json["count_dnd"] == null ? null : json["count_dnd"],
      );

  Map<String, dynamic> toJson() => {
        "pft_id": pftId == null ? null : pftId,
        "pft_summary": pftSummary == null ? null : pftSummary,
        "link_detailClass": linkDetailClass == null ? null : linkDetailClass,
        "city_id": cityId == null ? null : cityId,
        "cit_name": citName == null ? null : citName,
        "city_detail": cityDetail == null ? null : cityDetail,
        "cty_detail": ctyDetail == null ? null : ctyDetail,
        "as_id": asId == null ? null : asId,
        "as_name": asName == null ? null : asName,
        "as_detail": asDetail == null ? null : asDetail,
        "as_detail_name": asDetailName == null ? null : asDetailName,
        "pft_form": pftForm == null ? null : pftForm,
        "pft_price": pftPrice == null ? null : pftPrice,
        "pft_month": pftMonth == null ? null : pftMonth,
        "day_post": dayPost == null ? null : dayPost,
        "count_dnd": countDnd == null ? null : countDnd,
      };
}

class DataG {
  DataG({
    this.ugsId,
    this.ugsAvatar,
    this.ugsName,
    this.linkDetailTutor,
    this.asId,
    this.asName,
    this.asDetail,
    this.asDetailName,
    this.ugsCity,
    this.citName,
    this.ugsCounty,
    this.cityDetailName,
    this.ugsAboutUs,
    this.ugsUnitPrice,
    this.ugsSalary,
    this.ugsMonth,
  });

  String ugsId;
  String ugsAvatar;
  String ugsName;
  String linkDetailTutor;
  String asId;
  List<String> asName;
  String asDetail;
  List<String> asDetailName;
  String ugsCity;
  String citName;
  String ugsCounty;
  List<String> cityDetailName;
  String ugsAboutUs;
  String ugsUnitPrice;
  String ugsSalary;
  String ugsMonth;

  factory DataG.fromJson(Map<String, dynamic> json) => DataG(
        ugsId: json["ugs_id"] == null ? null : json["ugs_id"],
        ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
        ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
        linkDetailTutor: json["link_detailTutor"] == null ? null : json["link_detailTutor"],
        asId: json["as_id"] == null ? null : json["as_id"],
        asName: json["as_name"] == null ? null : List<String>.from(json["as_name"].map((x) => x)),
        asDetail: json["as_detail"] == null ? null : json["as_detail"],
        asDetailName: json["as_detail_name"] == null ? null : List<String>.from(json["as_detail_name"].map((x) => x)),
        ugsCity: json["ugs_city"] == null ? null : json["ugs_city"],
        citName: json["cit_name"] == null ? null : json["cit_name"],
        ugsCounty: json["ugs_county"] == null ? null : json["ugs_county"],
        cityDetailName: json["city_detail_name"] == null ? null : List<String>.from(json["city_detail_name"].map((x) => x)),
        ugsAboutUs: json["ugs_about_us"] == null ? null : json["ugs_about_us"],
        ugsUnitPrice: json["ugs_unit_price"] == null ? null : json["ugs_unit_price"],
        ugsSalary: json["ugs_salary"] == null ? null : json["ugs_salary"],
        ugsMonth: json["ugs_month"] == null ? null : json["ugs_month"],
      );

  Map<String, dynamic> toJson() => {
        "ugs_id": ugsId == null ? null : ugsId,
        "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
        "ugs_name": ugsName == null ? null : ugsName,
        "link_detailTutor": linkDetailTutor == null ? null : linkDetailTutor,
        "as_id": asId == null ? null : asId,
        "as_name": asName == null ? null : List<dynamic>.from(asName.map((x) => x)),
        "as_detail": asDetail == null ? null : asDetail,
        "as_detail_name": asDetailName == null ? null : List<dynamic>.from(asDetailName.map((x) => x)),
        "ugs_city": ugsCity == null ? null : ugsCity,
        "cit_name": citName == null ? null : citName,
        "ugs_county": ugsCounty == null ? null : ugsCounty,
        "city_detail_name": cityDetailName == null ? null : List<dynamic>.from(cityDetailName.map((x) => x)),
        "ugs_about_us": ugsAboutUs == null ? null : ugsAboutUs,
        "ugs_unit_price": ugsUnitPrice == null ? null : ugsUnitPrice,
        "ugs_salary": ugsSalary == null ? null : ugsSalary,
        "ugs_month": ugsMonth == null ? null : ugsMonth,
      };
}

class PaningGs {
  PaningGs({
    this.currentPage,
    this.limit,
    this.total,
  });

  int currentPage;
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

class PaningLh {
  PaningLh({
    this.currentPage,
    this.limit,
    this.total,
  });

  String currentPage;
  int limit;
  int total;

  factory PaningLh.fromJson(Map<String, dynamic> json) => PaningLh(
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
