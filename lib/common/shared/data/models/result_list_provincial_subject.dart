// To parse this JSON data, do
//
//     final resultListProvincialSubjectClass = resultListProvincialSubjectClassFromJson(jsonString);

import 'dart:convert';

ResultListProvincialSubjectClass resultListProvincialSubjectClassFromJson(String str) => ResultListProvincialSubjectClass.fromJson(json.decode(str));

String resultListProvincialSubjectClassToJson(ResultListProvincialSubjectClass data) => json.encode(data.toJson());

class ResultListProvincialSubjectClass {
  ResultListProvincialSubjectClass({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultListProvincialSubjectClass.fromJson(Map<String, dynamic> json) => ResultListProvincialSubjectClass(
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
    this.dataCity,
    this.dataSubject,
    this.dataClass,
  });

  bool result;
  String message;
  List<DataCity> dataCity;
  List<DataSubject> dataSubject;
  List<DataClass> dataClass;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    dataCity: json["dataCity"] == null ? null : List<DataCity>.from(json["dataCity"].map((x) => DataCity.fromJson(x))),
    dataSubject: json["dataSubject"] == null ? null : List<DataSubject>.from(json["dataSubject"].map((x) => DataSubject.fromJson(x))),
    dataClass: json["dataClass"] == null ? null : List<DataClass>.from(json["dataClass"].map((x) => DataClass.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "dataCity": dataCity == null ? null : List<dynamic>.from(dataCity.map((x) => x.toJson())),
    "dataSubject": dataSubject == null ? null : List<dynamic>.from(dataSubject.map((x) => x.toJson())),
    "dataClass": dataClass == null ? null : List<dynamic>.from(dataClass.map((x) => x.toJson())),
  };
}

class DataCity {
  DataCity({
    this.citId,
    this.citName,
  });

  String citId;
  String citName;

  factory DataCity.fromJson(Map<String, dynamic> json) => DataCity(
    citId: json["cit_id"] == null ? null : json["cit_id"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
  );

  Map<String, dynamic> toJson() => {
    "cit_id": citId == null ? null : citId,
    "cit_name": citName == null ? null : citName,
  };
}

class DataClass {
  DataClass({
    this.ctId,
    this.ctName,
  });

  String ctId;
  String ctName;

  factory DataClass.fromJson(Map<String, dynamic> json) => DataClass(
    ctId: json["ct_id"] == null ? null : json["ct_id"],
    ctName: json["ct_name"] == null ? null : json["ct_name"],
  );

  Map<String, dynamic> toJson() => {
    "ct_id": ctId == null ? null : ctId,
    "ct_name": ctName == null ? null : ctName,
  };
}

class DataSubject {
  DataSubject({
    this.asId,
    this.asName,
  });

  String asId;
  String asName;

  factory DataSubject.fromJson(Map<String, dynamic> json) => DataSubject(
    asId: json["as_id"] == null ? null : json["as_id"],
    asName: json["as_name"] == null ? null : json["as_name"],
  );

  Map<String, dynamic> toJson() => {
    "as_id": asId == null ? null : asId,
    "as_name": asName == null ? null : asName,
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
