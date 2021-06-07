// To parse this JSON data, do
//
//     final resultListData = resultListDataFromJson(jsonString);

import 'dart:convert';

ResultListData resultListDataFromJson(String str) => ResultListData.fromJson(json.decode(str));

String resultListDataToJson(ResultListData data) => json.encode(data.toJson());

class ResultListData {
  ResultListData({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultListData.fromJson(Map<String, dynamic> json) => ResultListData(
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
    this.danhSachLopHocSeDay,
    this.danhSachGioiTinh,
    this.danhSachThanhPho,
    this.danhSachKhuVucGiangDay,
    this.danhSachMonHoc,
    this.danhSachHinhThucGiangDay,
    this.danhSachLuongTheo,
    this.danhSachKieuGiaSu,
  });

  bool result;
  String message;
  List<DanhSachLopHocSeDay> danhSachLopHocSeDay;
  List<DanhSachGioiTinh> danhSachGioiTinh;
  List<DanhSachThanhPho> danhSachThanhPho;
  List<DanhSachKhuVucGiangDay> danhSachKhuVucGiangDay;
  List<DanhSachMonHoc> danhSachMonHoc;
  List<DanhSachHinhThucGiangDay> danhSachHinhThucGiangDay;
  List<DanhSachLuongTheo> danhSachLuongTheo;
  List<DanhSachKieuGiaSu> danhSachKieuGiaSu;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    danhSachLopHocSeDay: json["Danh_sach_lop_hoc_se_day"] == null ? null : List<DanhSachLopHocSeDay>.from(json["Danh_sach_lop_hoc_se_day"].map((x) => DanhSachLopHocSeDay.fromJson(x))),
    danhSachGioiTinh: json["Danh_sach_gioi_tinh"] == null ? null : List<DanhSachGioiTinh>.from(json["Danh_sach_gioi_tinh"].map((x) => DanhSachGioiTinh.fromJson(x))),
    danhSachThanhPho: json["Danh_sach_thanh_pho"] == null ? null : List<DanhSachThanhPho>.from(json["Danh_sach_thanh_pho"].map((x) => DanhSachThanhPho.fromJson(x))),
    danhSachKhuVucGiangDay: json["Danh_sach khu vuc_giang_day"] == null ? null : List<DanhSachKhuVucGiangDay>.from(json["Danh_sach khu vuc_giang_day"].map((x) => DanhSachKhuVucGiangDay.fromJson(x))),
    danhSachMonHoc: json["Danh_sach_mon_hoc"] == null ? null : List<DanhSachMonHoc>.from(json["Danh_sach_mon_hoc"].map((x) => DanhSachMonHoc.fromJson(x))),
    danhSachHinhThucGiangDay: json["Danh_sach_hinh_thuc_giang_day"] == null ? null : List<DanhSachHinhThucGiangDay>.from(json["Danh_sach_hinh_thuc_giang_day"].map((x) => DanhSachHinhThucGiangDay.fromJson(x))),
    danhSachLuongTheo: json["Danh_sach_luong_theo"] == null ? null : List<DanhSachLuongTheo>.from(json["Danh_sach_luong_theo"].map((x) => DanhSachLuongTheo.fromJson(x))),
    danhSachKieuGiaSu: json["Danh_sach_kieu_gia_su"] == null ? null : List<DanhSachKieuGiaSu>.from(json["Danh_sach_kieu_gia_su"].map((x) => DanhSachKieuGiaSu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "Danh_sach_lop_hoc_se_day": danhSachLopHocSeDay == null ? null : List<dynamic>.from(danhSachLopHocSeDay.map((x) => x.toJson())),
    "Danh_sach_gioi_tinh": danhSachGioiTinh == null ? null : List<dynamic>.from(danhSachGioiTinh.map((x) => x.toJson())),
    "Danh_sach_thanh_pho": danhSachThanhPho == null ? null : List<dynamic>.from(danhSachThanhPho.map((x) => x.toJson())),
    "Danh_sach khu vuc_giang_day": danhSachKhuVucGiangDay == null ? null : List<dynamic>.from(danhSachKhuVucGiangDay.map((x) => x.toJson())),
    "Danh_sach_mon_hoc": danhSachMonHoc == null ? null : List<dynamic>.from(danhSachMonHoc.map((x) => x.toJson())),
    "Danh_sach_hinh_thuc_giang_day": danhSachHinhThucGiangDay == null ? null : List<dynamic>.from(danhSachHinhThucGiangDay.map((x) => x.toJson())),
    "Danh_sach_luong_theo": danhSachLuongTheo == null ? null : List<dynamic>.from(danhSachLuongTheo.map((x) => x.toJson())),
    "Danh_sach_kieu_gia_su": danhSachKieuGiaSu == null ? null : List<dynamic>.from(danhSachKieuGiaSu.map((x) => x.toJson())),
  };
}

class DanhSachGioiTinh {
  DanhSachGioiTinh({
    this.sexId,
    this.sexName,
  });

  int sexId;
  String sexName;

  factory DanhSachGioiTinh.fromJson(Map<String, dynamic> json) => DanhSachGioiTinh(
    sexId: json["sex_id"] == null ? null : json["sex_id"],
    sexName: json["sex_name"] == null ? null : json["sex_name"],
  );

  Map<String, dynamic> toJson() => {
    "sex_id": sexId == null ? null : sexId,
    "sex_name": sexName == null ? null : sexName,
  };
}

class DanhSachHinhThucGiangDay {
  DanhSachHinhThucGiangDay({
    this.methodId,
    this.methodName,
  });

  int methodId;
  String methodName;

  factory DanhSachHinhThucGiangDay.fromJson(Map<String, dynamic> json) => DanhSachHinhThucGiangDay(
    methodId: json["method_id"] == null ? null : json["method_id"],
    methodName: json["method_name"] == null ? null : json["method_name"],
  );

  Map<String, dynamic> toJson() => {
    "method_id": methodId == null ? null : methodId,
    "method_name": methodName == null ? null : methodName,
  };
}

class DanhSachKhuVucGiangDay {
  DanhSachKhuVucGiangDay({
    this.areaId,
    this.citName,
  });

  int areaId;
  String citName;

  factory DanhSachKhuVucGiangDay.fromJson(Map<String, dynamic> json) => DanhSachKhuVucGiangDay(
    areaId: json["area_id"] == null ? null : json["area_id"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
  );

  Map<String, dynamic> toJson() => {
    "area_id": areaId == null ? null : areaId,
    "cit_name": citName == null ? null : citName,
  };
}

class DanhSachKieuGiaSu {
  DanhSachKieuGiaSu({
    this.typeId,
    this.nameType,
  });

  int typeId;
  String nameType;

  factory DanhSachKieuGiaSu.fromJson(Map<String, dynamic> json) => DanhSachKieuGiaSu(
    typeId: json["type_id"] == null ? null : json["type_id"],
    nameType: json["NameType"] == null ? null : json["NameType"],
  );

  Map<String, dynamic> toJson() => {
    "type_id": typeId == null ? null : typeId,
    "NameType": nameType == null ? null : nameType,
  };
}

class DanhSachLopHocSeDay {
  DanhSachLopHocSeDay({
    this.levelClassId,
    this.levelClassName,
  });

  int levelClassId;
  String levelClassName;

  factory DanhSachLopHocSeDay.fromJson(Map<String, dynamic> json) => DanhSachLopHocSeDay(
    levelClassId: json["level_class_id"] == null ? null : json["level_class_id"],
    levelClassName: json["level_class_name"] == null ? null : json["level_class_name"],
  );

  Map<String, dynamic> toJson() => {
    "level_class_id": levelClassId == null ? null : levelClassId,
    "level_class_name": levelClassName == null ? null : levelClassName,
  };
}

class DanhSachLuongTheo {
  DanhSachLuongTheo({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory DanhSachLuongTheo.fromJson(Map<String, dynamic> json) => DanhSachLuongTheo(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}

class DanhSachMonHoc {
  DanhSachMonHoc({
    this.idSubject,
    this.subject,
  });

  int idSubject;
  String subject;

  factory DanhSachMonHoc.fromJson(Map<String, dynamic> json) => DanhSachMonHoc(
    idSubject: json["id_subject"] == null ? null : json["id_subject"],
    subject: json["subject"] == null ? null : json["subject"],
  );

  Map<String, dynamic> toJson() => {
    "id_subject": idSubject == null ? null : idSubject,
    "subject": subject == null ? null : subject,
  };
}

class DanhSachThanhPho {
  DanhSachThanhPho({
    this.citId,
    this.citName,
  });

  int citId;
  String citName;

  factory DanhSachThanhPho.fromJson(Map<String, dynamic> json) => DanhSachThanhPho(
    citId: json["cit_id"] == null ? null : json["cit_id"],
    citName: json["cit_name"] == null ? null : json["cit_name"],
  );

  Map<String, dynamic> toJson() => {
    "cit_id": citId == null ? null : citId,
    "cit_name": citName == null ? null : citName,
  };
}
