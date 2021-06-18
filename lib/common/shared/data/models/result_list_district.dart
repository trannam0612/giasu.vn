// To parse this JSON data, do
//
//     final resultListDistrict = resultListDistrictFromJson(jsonString);

import 'dart:convert';

ResultListDistrict resultListDistrictFromJson(String str) => ResultListDistrict.fromJson(json.decode(str));

String resultListDistrictToJson(ResultListDistrict data) => json.encode(data.toJson());

class ResultListDistrict {
  ResultListDistrict({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultListDistrict.fromJson(Map<String, dynamic> json) => ResultListDistrict(
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
    this.dataDistrict,
  });

  bool result;
  String message;
  DataDistrict dataDistrict;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    dataDistrict: json["dataSubject"] == null ? null : DataDistrict.fromJson(json["dataSubject"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "dataSubject": dataDistrict == null ? null : dataDistrict.toJson(),
  };
}

class DataDistrict {
  DataDistrict({
    this.ugsCity,
    this.cityName,
    this.listDistrict,
  });

  String ugsCity;
  String cityName;
  List<ListDistrict> listDistrict;

  factory DataDistrict.fromJson(Map<String, dynamic> json) => DataDistrict(
    ugsCity: json["ugs_city"] == null ? null : json["ugs_city"],
    cityName: json["city_name"] == null ? null : json["city_name"],
    listDistrict: json["city_detail"] == null ? null : List<ListDistrict>.from(json["city_detail"].map((x) => ListDistrict.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ugs_city": ugsCity == null ? null : ugsCity,
    "city_name": cityName == null ? null : cityName,
    "city_detail": listDistrict == null ? null : List<dynamic>.from(listDistrict.map((x) => x.toJson())),
  };
}

class ListDistrict {
  ListDistrict({
    this.citId,
    this.citName,
  });

  String citId;
  String citName;

  factory ListDistrict.fromJson(Map<String, dynamic> json) => ListDistrict(
    citId: json["cit_id"] == null ? null : json["cit_id"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
  );

  Map<String, dynamic> toJson() => {
    "cit_id": citId == null ? null : citId,
    "cit_name": citName == null ? null : citName,
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
