// To parse this JSON data, do
//
//     final resultTutorInvited = resultTutorInvitedFromJson(jsonString);

import 'dart:convert';

ResultTutorInvited resultTutorInvitedFromJson(String str) => ResultTutorInvited.fromJson(json.decode(str));

String resultTutorInvitedToJson(ResultTutorInvited data) => json.encode(data.toJson());

class ResultTutorInvited {
  ResultTutorInvited({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultTutorInvited.fromJson(Map<String, dynamic> json) => ResultTutorInvited(
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
    this.listGsmd,
    this.currentPage,
    this.limit,
    this.total,
  });

  bool result;
  String message;
  List<ListGsmd> listGsmd;
  String currentPage;
  int limit;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    listGsmd: json["listGSMD"] == null ? null : List<ListGsmd>.from(json["listGSMD"].map((x) => ListGsmd.fromJson(x))),
    currentPage: json["current_page"] == null ? null : json["current_page"],
    limit: json["limit"] == null ? null : json["limit"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "listGSMD": listGsmd == null ? null : List<dynamic>.from(listGsmd.map((x) => x.toJson())),
    "current_page": currentPage == null ? null : currentPage,
    "limit": limit == null ? null : limit,
    "total": total == null ? null : total,
  };
}

class ListGsmd {
  ListGsmd({
    this.ugsId,
    this.ugsAvatar,
    this.ugsName,
    this.linkDetailTutor,
    this.pftId,
    this.pftSummary,
    this.linkDetailClass,
    this.itAddress,
    this.pftForm,
    this.asDetail,
    this.asDetailName,
    this.pftPrice,
    this.pftMonth,
    this.dayInvitationTeach,
    this.checkSave,
  });

  String ugsId;
  String ugsAvatar;
  String ugsName;
  String linkDetailTutor;
  String pftId;
  String pftSummary;
  String linkDetailClass;
  String itAddress;
  String pftForm;
  String asDetail;
  List<String> asDetailName;
  String pftPrice;
  String pftMonth;
  String dayInvitationTeach;
  bool checkSave;

  factory ListGsmd.fromJson(Map<String, dynamic> json) => ListGsmd(
    ugsId: json["ugs_id"] == null ? null : json["ugs_id"],
    ugsAvatar: json["ugs_avatar"] == null ? null : json["ugs_avatar"],
    ugsName: json["ugs_name"] == null ? null : json["ugs_name"],
    linkDetailTutor: json["link_detailTutor"] == null ? null : json["link_detailTutor"],
    pftId: json["pft_id"] == null ? null : json["pft_id"],
    pftSummary: json["pft_summary"] == null ? null : json["pft_summary"],
    linkDetailClass: json["link_detailClass"] == null ? null : json["link_detailClass"],
    itAddress: json["it_address"] == null ? null : json["it_address"],
    pftForm: json["pft_form"] == null ? null : json["pft_form"],
    asDetail: json["as_detail"] == null ? null : json["as_detail"],
    asDetailName: json["as_detail_name"] == null ? null : List<String>.from(json["as_detail_name"].map((x) => x)),
    pftPrice: json["pft_price"] == null ? null : json["pft_price"],
    pftMonth: json["pft_month"] == null ? null : json["pft_month"],
    dayInvitationTeach: json["day_invitation_teach"] == null ? null : json["day_invitation_teach"],
    checkSave: json["check_save"] == null ? null : json["check_save"],
  );

  Map<String, dynamic> toJson() => {
    "ugs_id": ugsId == null ? null : ugsId,
    "ugs_avatar": ugsAvatar == null ? null : ugsAvatar,
    "ugs_name": ugsName == null ? null : ugsName,
    "link_detailTutor": linkDetailTutor == null ? null : linkDetailTutor,
    "pft_id": pftId == null ? null : pftId,
    "pft_summary": pftSummary == null ? null : pftSummary,
    "link_detailClass": linkDetailClass == null ? null : linkDetailClass,
    "it_address": itAddress == null ? null : itAddress,
    "pft_form": pftForm == null ? null : pftForm,
    "as_detail": asDetail == null ? null : asDetail,
    "as_detail_name": asDetailName == null ? null : List<dynamic>.from(asDetailName.map((x) => x)),
    "pft_price": pftPrice == null ? null : pftPrice,
    "pft_month": pftMonth == null ? null : pftMonth,
    "day_invitation_teach": dayInvitationTeach == null ? null : dayInvitationTeach,
    "check_save": checkSave == null ? null : checkSave,
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
