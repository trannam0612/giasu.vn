// To parse this JSON data, do
//
//     final resultListDataQh = resultListDataQhFromJson(jsonString);

import 'dart:convert';

ResultListDataQh resultListDataQhFromJson(String str) => ResultListDataQh.fromJson(json.decode(str));

String resultListDataQhToJson(ResultListDataQh data) => json.encode(data.toJson());

class ResultListDataQh {
  ResultListDataQh({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultListDataQh.fromJson(Map<String, dynamic> json) => ResultListDataQh(
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
    this.danhSachQuanHuyenTheoTinhThanh,
  });

  bool result;
  String message;
  List<DanhSachQuanHuyenTheoTinhThanh> danhSachQuanHuyenTheoTinhThanh;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    danhSachQuanHuyenTheoTinhThanh: json["Danh_sach_quan_huyen_theo_tinh_thanh"] == null ? null : List<DanhSachQuanHuyenTheoTinhThanh>.from(json["Danh_sach_quan_huyen_theo_tinh_thanh"].map((x) => DanhSachQuanHuyenTheoTinhThanh.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "Danh_sach_quan_huyen_theo_tinh_thanh": danhSachQuanHuyenTheoTinhThanh == null ? null : List<dynamic>.from(danhSachQuanHuyenTheoTinhThanh.map((x) => x.toJson())),
  };
}

class DanhSachQuanHuyenTheoTinhThanh {
  DanhSachQuanHuyenTheoTinhThanh({
    this.districtId,
    this.districtName,
    this.citId,
    this.citName,
  });

  int districtId;
  String districtName;
  int citId;
  CitName citName;

  factory DanhSachQuanHuyenTheoTinhThanh.fromJson(Map<String, dynamic> json) => DanhSachQuanHuyenTheoTinhThanh(
    districtId: json["district_id"] == null ? null : json["district_id"],
    districtName: json["district_name"] == null ? null : json["district_name"],
    citId: json["cit_id"] == null ? null : json["cit_id"],
    citName: json["cit_name"] == null ? null : citNameValues.map[json["cit_name"]],
  );

  Map<String, dynamic> toJson() => {
    "district_id": districtId == null ? null : districtId,
    "district_name": districtName == null ? null : districtName,
    "cit_id": citId == null ? null : citId,
    "cit_name": citName == null ? null : citNameValues.reverse[citName],
  };
}

enum CitName { H_NI }

final citNameValues = EnumValues({
  "Hà Nội": CitName.H_NI
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
