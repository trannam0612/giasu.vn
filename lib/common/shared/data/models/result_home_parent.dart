// To parse this JSON data, do
//
//     final resultHomeParent = resultHomeParentFromJson(jsonString);

import 'dart:convert';

ResultHomeParent resultHomeParentFromJson(String str) => ResultHomeParent.fromJson(json.decode(str));

String resultHomeParentToJson(ResultHomeParent data) => json.encode(data.toJson());

class ResultHomeParent {
  ResultHomeParent({
    this.data,
    this.error,
  });

  Data data;
  Error error;

  factory ResultHomeParent.fromJson(Map<String, dynamic> json) => ResultHomeParent(
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
    this.danhSachGiaSuNoiBat,
    this.infoPagingGsNb,
    this.danhSachGiaSuDangTimViec,
    this.infoPagingGsDtv,
    this.listImgSlide,
    this.listBaiviet,
  });

  bool result;
  String message;
  List<DanhSachGiaSuNoiBat> danhSachGiaSuNoiBat;
  List<InfoPagingGsNb> infoPagingGsNb;
  List<DanhSachGiaSuDangTimViec> danhSachGiaSuDangTimViec;
  List<InfoPagingGsDtv> infoPagingGsDtv;
  ListImgSlide listImgSlide;
  List<ListBaiviet> listBaiviet;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    danhSachGiaSuNoiBat: json["Danh_sach_gia_su_noi_bat"] == null ? null : List<DanhSachGiaSuNoiBat>.from(json["Danh_sach_gia_su_noi_bat"].map((x) => DanhSachGiaSuNoiBat.fromJson(x))),
    infoPagingGsNb: json["info_paging_gs_nb"] == null ? null : List<InfoPagingGsNb>.from(json["info_paging_gs_nb"].map((x) => InfoPagingGsNb.fromJson(x))),
    danhSachGiaSuDangTimViec: json["Danh_sach_gia_su_dang_tim_viec"] == null ? null : List<DanhSachGiaSuDangTimViec>.from(json["Danh_sach_gia_su_dang_tim_viec"].map((x) => DanhSachGiaSuDangTimViec.fromJson(x))),
    infoPagingGsDtv: json["info_paging_gs_dtv"] == null ? null : List<InfoPagingGsDtv>.from(json["info_paging_gs_dtv"].map((x) => InfoPagingGsDtv.fromJson(x))),
    listImgSlide: json["list_img_slide"] == null ? null : ListImgSlide.fromJson(json["list_img_slide"]),
    listBaiviet: json["list_baiviet"] == null ? null : List<ListBaiviet>.from(json["list_baiviet"].map((x) => ListBaiviet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "Danh_sach_gia_su_noi_bat": danhSachGiaSuNoiBat == null ? null : List<dynamic>.from(danhSachGiaSuNoiBat.map((x) => x.toJson())),
    "info_paging_gs_nb": infoPagingGsNb == null ? null : List<dynamic>.from(infoPagingGsNb.map((x) => x.toJson())),
    "Danh_sach_gia_su_dang_tim_viec": danhSachGiaSuDangTimViec == null ? null : List<dynamic>.from(danhSachGiaSuDangTimViec.map((x) => x.toJson())),
    "info_paging_gs_dtv": infoPagingGsDtv == null ? null : List<dynamic>.from(infoPagingGsDtv.map((x) => x.toJson())),
    "list_img_slide": listImgSlide == null ? null : listImgSlide.toJson(),
    "list_baiviet": listBaiviet == null ? null : List<dynamic>.from(listBaiviet.map((x) => x.toJson())),
  };
}

class DanhSachGiaSuDangTimViec {
  DanhSachGiaSuDangTimViec({
    this.id,
    this.userName,
    this.userAddress,
    this.userAvatar,
    this.subject,
    this.methodTeach,
    this.url,
  });

  String id;
  String userName;
  String userAddress;
  String userAvatar;
  String subject;
  String methodTeach;
  String url;

  factory DanhSachGiaSuDangTimViec.fromJson(Map<String, dynamic> json) => DanhSachGiaSuDangTimViec(
    id: json["id"] == null ? null : json["id"],
    userName: json["user_name"] == null ? null : json["user_name"],
    userAddress: json["user_address"] == null ? null : json["user_address"],
    userAvatar: json["user_avatar"] == null ? null : json["user_avatar"],
    subject: json["subject"] == null ? null : json["subject"],
    methodTeach: json["method_teach"] == null ? null : json["method_teach"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_name": userName == null ? null : userName,
    "user_address": userAddress == null ? null : userAddress,
    "user_avatar": userAvatar == null ? null : userAvatar,
    "subject": subject == null ? null : subject,
    "method_teach": methodTeach == null ? null : methodTeach,
    "url": url == null ? null : url,
  };
}

class DanhSachGiaSuNoiBat {
  DanhSachGiaSuNoiBat({
    this.id,
    this.userName,
    this.view,
    this.userAvatar,
    this.url,
  });

  String id;
  String userName;
  String view;
  String userAvatar;
  String url;

  factory DanhSachGiaSuNoiBat.fromJson(Map<String, dynamic> json) => DanhSachGiaSuNoiBat(
    id: json["id"] == null ? null : json["id"],
    userName: json["user_name"] == null ? null : json["user_name"],
    view: json["view"] == null ? null : json["view"],
    userAvatar: json["user_avatar"] == null ? null : json["user_avatar"],
    url: json["url"] == null ? null : json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_name": userName == null ? null : userName,
    "view": view == null ? null : view,
    "user_avatar": userAvatar == null ? null : userAvatar,
    "url": url == null ? null : url,
  };
}

class InfoPagingGsDtv {
  InfoPagingGsDtv({
    this.trangSo,
    this.tongSoBanGhi,
    this.total,
  });

  int trangSo;
  int tongSoBanGhi;
  int total;

  factory InfoPagingGsDtv.fromJson(Map<String, dynamic> json) => InfoPagingGsDtv(
    trangSo: json["trang_so"] == null ? null : json["trang_so"],
    tongSoBanGhi: json["tong_so_ban_ghi"] == null ? null : json["tong_so_ban_ghi"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "trang_so": trangSo == null ? null : trangSo,
    "tong_so_ban_ghi": tongSoBanGhi == null ? null : tongSoBanGhi,
    "total": total == null ? null : total,
  };
}

class InfoPagingGsNb {
  InfoPagingGsNb({
    this.trangSo,
    this.tongSoBanGhiTrongTrang,
    this.total,
  });

  int trangSo;
  int tongSoBanGhiTrongTrang;
  int total;

  factory InfoPagingGsNb.fromJson(Map<String, dynamic> json) => InfoPagingGsNb(
    trangSo: json["trang_so"] == null ? null : json["trang_so"],
    tongSoBanGhiTrongTrang: json["tong_so_ban_ghi_trong_trang"] == null ? null : json["tong_so_ban_ghi_trong_trang"],
    total: json["total"] == null ? null : json["total"],
  );

  Map<String, dynamic> toJson() => {
    "trang_so": trangSo == null ? null : trangSo,
    "tong_so_ban_ghi_trong_trang": tongSoBanGhiTrongTrang == null ? null : tongSoBanGhiTrongTrang,
    "total": total == null ? null : total,
  };
}

class ListBaiviet {
  ListBaiviet({
    this.urlPost,
    this.urlPicture,
  });

  String urlPost;
  String urlPicture;

  factory ListBaiviet.fromJson(Map<String, dynamic> json) => ListBaiviet(
    urlPost: json["url_post"] == null ? null : json["url_post"],
    urlPicture: json["url_picture"] == null ? null : json["url_picture"],
  );

  Map<String, dynamic> toJson() => {
    "url_post": urlPost == null ? null : urlPost,
    "url_picture": urlPicture == null ? null : urlPicture,
  };
}

class ListImgSlide {
  ListImgSlide({
    this.imgSlide1,
    this.imgSlide2,
    this.imgSlide3,
  });

  String imgSlide1;
  String imgSlide2;
  String imgSlide3;

  factory ListImgSlide.fromJson(Map<String, dynamic> json) => ListImgSlide(
    imgSlide1: json["img_slide1"] == null ? null : json["img_slide1"],
    imgSlide2: json["img_slide2"] == null ? null : json["img_slide2"],
    imgSlide3: json["img_slide3"] == null ? null : json["img_slide3"],
  );

  Map<String, dynamic> toJson() => {
    "img_slide1": imgSlide1 == null ? null : imgSlide1,
    "img_slide2": imgSlide2 == null ? null : imgSlide2,
    "img_slide3": imgSlide3 == null ? null : imgSlide3,
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
