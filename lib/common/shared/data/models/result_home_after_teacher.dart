// To parse this JSON data, do
//
//     final resultHomeAfterTeacher = resultHomeAfterTeacherFromJson(jsonString);

import 'dart:convert';

ResultHomeAfterTeacher resultHomeAfterTeacherFromJson(String str) => ResultHomeAfterTeacher.fromJson(json.decode(str));

String resultHomeAfterTeacherToJson(ResultHomeAfterTeacher data) => json.encode(data.toJson());

class ResultHomeAfterTeacher {
  ResultHomeAfterTeacher({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultHomeAfterTeacher.fromJson(Map<String, dynamic> json) => ResultHomeAfterTeacher(
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
    this.lmd,
    this.lnd,
    this.ldnd,
    this.ldl,
    this.phdl,
    this.dataDslhgd,
    this.paningLhgd,
    this.dataDslhpb,
    this.paningLhpb,
  });

  bool result;
  String message;
  String lmd;
  String lnd;
  String ldnd;
  String ldl;
  String phdl;
  List<DataDslh> dataDslhgd;
  PaningLh paningLhgd;
  List<DataDslh> dataDslhpb;
  PaningLh paningLhpb;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    lmd: json["lmd"] == null ? null : json["lmd"],
    lnd: json["lnd"] == null ? null : json["lnd"],
    ldnd: json["ldnd"] == null ? null : json["ldnd"],
    ldl: json["ldl"] == null ? null : json["ldl"],
    phdl: json["phdl"] == null ? null : json["phdl"],
    dataDslhgd: json["dataDSLHGD"] == null ? null : List<DataDslh>.from(json["dataDSLHGD"].map((x) => DataDslh.fromJson(x))),
    paningLhgd: json["paning_lhgd"] == null ? null : PaningLh.fromJson(json["paning_lhgd"]),
    dataDslhpb: json["dataDSLHPB"] == null ? null : List<DataDslh>.from(json["dataDSLHPB"].map((x) => DataDslh.fromJson(x))),
    paningLhpb: json["paning_lhpb"] == null ? null : PaningLh.fromJson(json["paning_lhpb"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "lmd": lmd == null ? null : lmd,
    "lnd": lnd == null ? null : lnd,
    "ldnd": ldnd == null ? null : ldnd,
    "ldl": ldl == null ? null : ldl,
    "phdl": phdl == null ? null : phdl,
    "dataDSLHGD": dataDslhgd == null ? null : List<dynamic>.from(dataDslhgd.map((x) => x.toJson())),
    "paning_lhgd": paningLhgd == null ? null : paningLhgd.toJson(),
    "dataDSLHPB": dataDslhpb == null ? null : List<dynamic>.from(dataDslhpb.map((x) => x.toJson())),
    "paning_lhpb": paningLhpb == null ? null : paningLhpb.toJson(),
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
    this.checkSave,
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
  bool checkSave;
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
    asDetailName: json["as_detail_name"] == null ? '' : json["as_detail_name"],
    pftForm: json["pft_form"] == null ? null : json["pft_form"],
    pftPrice: json["pft_price"] == null ? null : json["pft_price"],
    pftMonth: json["pft_month"] == null ? null : json["pft_month"],
    dayPost: json["day_post"] == null ? null : json["day_post"],
    checkSave: json["check_save"] == null ? null : json["check_save"],
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
    "check_save": checkSave == null ? null : checkSave,
    "count_dnd": countDnd == null ? null : countDnd,
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
