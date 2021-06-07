// To parse this JSON data, do
//
//     final resultDataSearchCity = resultDataSearchCityFromJson(jsonString);

import 'dart:convert';

ResultDataSearchCity resultDataSearchCityFromJson(String str) => ResultDataSearchCity.fromJson(json.decode(str));

String resultDataSearchCityToJson(ResultDataSearchCity data) => json.encode(data.toJson());

class ResultDataSearchCity {
  ResultDataSearchCity({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultDataSearchCity.fromJson(Map<String, dynamic> json) => ResultDataSearchCity(
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
    this.resultSearch,
    this.trangSo,
    this.tongSoBanGhi,
    this.total,
  });

  bool result;
  String message;
  List<ResultSearch> resultSearch;
  int trangSo;
  int tongSoBanGhi;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    resultSearch: json["result_search"] == null ? null : List<ResultSearch>.from(json["result_search"].map((x) => ResultSearch.fromJson(x))),
    trangSo: json["trang_so"] == null ? null : json["trang_so"],
    tongSoBanGhi: json["tong_so_ban_ghi"] == null ? null : json["tong_so_ban_ghi"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "result_search": resultSearch == null ? null : List<dynamic>.from(resultSearch.map((x) => x.toJson())),
    "trang_so": trangSo == null ? null : trangSo,
    "tong_so_ban_ghi": tongSoBanGhi == null ? null : tongSoBanGhi,
    "total": total == null ? null : total,
  };
}

class ResultSearch {
  ResultSearch({
    this.avatar,
    this.className,
    this.classDescribe,
    this.classId,
    this.address,
    this.fee,
    this.methodTeach,
    this.checkSuggest,
  });

  String avatar;
  String className;
  String classDescribe;
  String classId;
  String address;
  String fee;
  String methodTeach;
  bool checkSuggest;

  factory ResultSearch.fromJson(Map<String, dynamic> json) => ResultSearch(
    avatar: json["avatar"] == null ? null : json["avatar"],
    className: json["class_name"] == null ? null : json["class_name"],
    classDescribe: json["class_describe"] == null ? null : json["class_describe"],
    classId: json["class_id"] == null ? null : json["class_id"],
    address: json["address"] == null ? null : json["address"],
    fee: json["fee"] == null ? null : json["fee"],
    methodTeach: json["method_teach"] == null ? null : json["method_teach"],
    checkSuggest: json["check_suggest"] == null ? null : json["check_suggest"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar == null ? null : avatar,
    "class_name": className == null ? null : className,
    "class_describe": classDescribe == null ? null : classDescribe,
    "class_id": classId == null ? null : classId,
    "address": address == null ? null : address,
    "fee": fee == null ? null : fee,
    "method_teach": methodTeach == null ? null : methodTeach,
    "check_suggest": checkSuggest == null ? null : checkSuggest,
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
