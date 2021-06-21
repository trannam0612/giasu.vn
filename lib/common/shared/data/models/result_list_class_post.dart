// To parse this JSON data, do
//
//     final resultListClassPosted = resultListClassPostedFromJson(jsonString);

import 'dart:convert';

ResultListClassPosted resultListClassPostedFromJson(String str) => ResultListClassPosted.fromJson(json.decode(str));

String resultListClassPostedToJson(ResultListClassPosted data) => json.encode(data.toJson());

class ResultListClassPosted {
  ResultListClassPosted({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultListClassPosted.fromJson(Map<String, dynamic> json) => ResultListClassPosted(
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
    this.listClass,
    this.currentPage,
    this.limit,
    this.total,
  });

  bool result;
  String message;
  List<ListClass> listClass;
  String currentPage;
  int limit;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    listClass: json["listClass"] == null ? null : List<ListClass>.from(json["listClass"].map((x) => ListClass.fromJson(x))),
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "listClass": listClass == null ? null : List<dynamic>.from(listClass.map((x) => x.toJson())),
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}

class ListClass {
  ListClass({
    this.pftId,
    this.pftSummary,
    this.asId,
    this.asName,
    this.asDetail,
    this.asNameDetail,
    this.cityId,
    this.citName,
    this.cityDetail,
    this.ctyDetail,
    this.pftPrice,
    this.pftMonth,
    this.pftForm,
    this.pftAddress,
    this.linkDetailClass,
    this.dayPost,
  });

  String pftId;
  String pftSummary;
  String asId;
  String asName;
  String asDetail;
  String asNameDetail;
  String cityId;
  String citName;
  String cityDetail;
  String ctyDetail;
  String pftPrice;
  String pftMonth;
  String pftForm;
  String pftAddress;
  String linkDetailClass;
  String dayPost;

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
    pftId: json["pft_id"] == null ? null : json["pft_id"],
    pftSummary: json["pft_summary"] == null ? null : json["pft_summary"],
    asId: json["as_id"] == null ? null : json["as_id"],
    asName: json["as_name"] == null ? null : json["as_name"],
    asDetail: json["as_detail"] == null ? null : json["as_detail"],
    asNameDetail: json["as_name_detail"] == null ? null : json["as_name_detail"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
    cityDetail: json["city_detail"] == null ? null : json["city_detail"],
    ctyDetail: json["cty_detail"] == null ? null : json["cty_detail"],
    pftPrice: json["pft_price"] == null ? null : json["pft_price"],
    pftMonth: json["pft_month"] == null ? null : json["pft_month"],
    pftForm: json["pft_form"] == null ? null : json["pft_form"],
    pftAddress: json["pft_address"] == null ? null : json["pft_address"],
    linkDetailClass: json["link_detailClass"] == null ? null : json["link_detailClass"],
    dayPost: json["day_post"] == null ? null : json["day_post"],
  );

  Map<String, dynamic> toJson() => {
    "pft_id": pftId == null ? null : pftId,
    "pft_summary": pftSummary == null ? null : pftSummary,
    "as_id": asId == null ? null : asId,
    "as_name": asName == null ? null : asName,
    "as_detail": asDetail == null ? null : asDetail,
    "as_name_detail": asNameDetail == null ? null : asNameDetail,
    "city_id": cityId == null ? null : cityId,
    "cit_name": citName == null ? null : citName,
    "city_detail": cityDetail == null ? null : cityDetail,
    "cty_detail": ctyDetail == null ? null : ctyDetail,
    "pft_price": pftPrice == null ? null : pftPrice,
    "pft_month": pftMonth == null ? null : pftMonth,
    "pft_form": pftForm == null ? null : pftForm,
    "pft_address": pftAddress == null ? null : pftAddress,
    "link_detailClass": linkDetailClass == null ? null : linkDetailClass,
    "day_post": dayPost == null ? null : dayPost,
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
