// To parse this JSON data, do
//
//     final resultClassOffered = resultClassOfferedFromJson(jsonString);

import 'dart:convert';

ResultClassOffered resultClassOfferedFromJson(String str) => ResultClassOffered.fromJson(json.decode(str));

String resultClassOfferedToJson(ResultClassOffered data) => json.encode(data.toJson());

class ResultClassOffered {
  ResultClassOffered({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultClassOffered.fromJson(Map<String, dynamic> json) => ResultClassOffered(
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
    this.listLddn,
    this.currentPage,
    this.limit,
    this.total,
  });

  bool result;
  String message;
  List<ListLddn> listLddn;
  String currentPage;
  int limit;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    listLddn: json["listLDDN"] == null ? null : List<ListLddn>.from(json["listLDDN"].map((x) => ListLddn.fromJson(x))),
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "listLDDN": listLddn == null ? null : List<dynamic>.from(listLddn.map((x) => x.toJson())),
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}

class ListLddn {
  ListLddn({
    this.pftId,
    this.pftSummary,
    this.linkDetailClass,
    this.otDate,
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
    this.otStatus,
  });

  String pftId;
  String pftSummary;
  String linkDetailClass;
  String otDate;
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
  String otStatus;

  factory ListLddn.fromJson(Map<String, dynamic> json) => ListLddn(
    pftId: json["pft_id"] == null ? null : json["pft_id"],
    pftSummary: json["pft_summary"] == null ? null : json["pft_summary"],
    linkDetailClass: json["link_detailClass"] == null ? null : json["link_detailClass"],
    otDate: json["ot_date"] == null ? null : json["ot_date"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
    cityDetail: json["city_detail"] == null ? null : json["city_detail"],
    ctyDetail: json["cty_detail"] == null ? null : json["cty_detail"],
    asId: json["as_id"] == null ? null : json["as_id"],
    asName: json["as_name"] == null ? null : json["as_name"],
    asDetail: json["as_detail"] == null ? null : json["as_detail"],
    asDetailName: json["as_detail_name"] == null ? '' : json["as_detail_name"],
    pftForm: json["pft_form"] == null ? null : json["pft_form"],
    pftPrice: json["pft_price"] == null ? null : json["pft_price"],
    pftMonth: json["pft_month"] == null ? null : json["pft_month"],
    dayPost: json["day_post"] == null ? null : json["day_post"],
    otStatus: json["ot_status"] == null ? null : json["ot_status"],
  );

  Map<String, dynamic> toJson() => {
    "pft_id": pftId == null ? null : pftId,
    "pft_summary": pftSummary == null ? null : pftSummary,
    "link_detailClass": linkDetailClass == null ? null : linkDetailClass,
    "ot_date": otDate == null ? null : otDate,
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
    "ot_status": otStatus == null ? null : otStatus,
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
