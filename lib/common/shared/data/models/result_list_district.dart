// To parse this JSON data, do
//
//     final resultListDistrict = resultListDistrictFromJson(jsonString);

import 'dart:convert';

ResultListDistrict resultListDistrictFromJson(String str) => ResultListDistrict.fromJson(json.decode(str));

String resultListDistrictToJson(ResultListDistrict data) => json.encode(data.toJson());

class ResultListDistrict {
  ResultListDistrict({
    this.code,
    this.result,
    this.data,
    this.error,
  });

  int code;
  bool result;
  Data data;
  Error error;

  factory ResultListDistrict.fromJson(Map<String, dynamic> json) => ResultListDistrict(
    code: json["code"] == null ? null : json["code"],
    result: json["result"] == null ? null : json["result"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    error: json["error"] == null ? null : Error.fromJson(json["error"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "result": result == null ? null : result,
    "data": data == null ? null : data.toJson(),
    "error": error == null ? null : error.toJson(),
  };
}

class Data {
  Data({
    this.result,
    this.message,
    this.listCity,
  });

  bool result;
  String message;
  List<ListDistrict> listCity;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    listCity: json["listCity"] == null ? null : List<ListDistrict>.from(json["listCity"].map((x) => ListDistrict.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "listCity": listCity == null ? null : List<dynamic>.from(listCity.map((x) => x.toJson())),
  };
}

class ListDistrict {
  ListDistrict({
    this.idCity,
    this.nameCity,
  });

  String idCity;
  String nameCity;

  factory ListDistrict.fromJson(Map<String, dynamic> json) => ListDistrict(
    idCity: json["id_city"] == null ? null : json["id_city"],
    nameCity: json["name_city"] == null ? null : json["name_city"],
  );

  Map<String, dynamic> toJson() => {
    "id_city": idCity == null ? null : idCity,
    "name_city": nameCity == null ? null : nameCity,
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
