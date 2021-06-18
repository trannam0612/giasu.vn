// To parse this JSON data, do
//
//     final resultClassAccepted = resultClassAcceptedFromJson(jsonString);

import 'dart:convert';

ResultClassAccepted resultClassAcceptedFromJson(String str) => ResultClassAccepted.fromJson(json.decode(str));

String resultClassAcceptedToJson(ResultClassAccepted data) => json.encode(data.toJson());

class ResultClassAccepted {
  ResultClassAccepted({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultClassAccepted.fromJson(Map<String, dynamic> json) => ResultClassAccepted(
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
    this.listPhdnd,
    this.currentPage,
    this.limit,
    this.total,
  });

  bool result;
  String message;
  List<ListPhdnd> listPhdnd;
  String currentPage;
  int limit;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    listPhdnd: json["listPHDND"] == null ? null : List<ListPhdnd>.from(json["listPHDND"].map((x) => ListPhdnd.fromJson(x))),
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "listPHDND": listPhdnd == null ? null : List<dynamic>.from(listPhdnd.map((x) => x.toJson())),
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}

class ListPhdnd {
  ListPhdnd({
    this.itClassCode,
    this.pftSummary,
    this.linkDetailClass,
    this.dayPost,
    this.ugsParent,
    this.ugsName,
    this.linkDetailTutor,
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
    this.dayInvitationTeach,
    this.receivedDate,
    this.status,
  });

  String itClassCode;
  String pftSummary;
  String linkDetailClass;
  String dayPost;
  String ugsParent;
  String ugsName;
  String linkDetailTutor;
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
  String dayInvitationTeach;
  String receivedDate;
  String status;

  factory ListPhdnd.fromJson(Map<String, dynamic> json) => ListPhdnd(
    itClassCode: json["it_class_code"] == null ? null : json["it_class_code"],
    pftSummary: json["pft_summary"] == null ? null : json["pft_summary"],
    linkDetailClass: json["link_detailClass"] == null ? null : json["link_detailClass"],
    dayPost: json["day_post"] == null ? null : json["day_post"],
    ugsParent: json["ugs_parent"] == null ? null : json["ugs_parent"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    linkDetailTutor: json["link_detailTutor"] == null ? null : json["link_detailTutor"],
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
    dayInvitationTeach: json["day_invitation_teach"] == null ? null : json["day_invitation_teach"],
    receivedDate: json["received_date"] == null ? null : json["received_date"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "it_class_code": itClassCode == null ? null : itClassCode,
    "pft_summary": pftSummary == null ? null : pftSummary,
    "link_detailClass": linkDetailClass == null ? null : linkDetailClass,
    "day_post": dayPost == null ? null : dayPost,
    "ugs_parent": ugsParent == null ? null : ugsParent,
    "ugs_name": ugsName == null ? null : ugsName,
    "link_detailTutor": linkDetailTutor == null ? null : linkDetailTutor,
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
    "day_invitation_teach": dayInvitationTeach == null ? null : dayInvitationTeach,
    "received_date": receivedDate == null ? null : receivedDate,
    "status": status == null ? null : status,
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
