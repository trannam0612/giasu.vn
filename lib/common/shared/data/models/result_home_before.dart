// To parse this JSON data, do
//
//     final resultHomeBefore = resultHomeBeforeFromJson(jsonString);

import 'dart:convert';

ResultHomeBefore resultHomeBeforeFromJson(String str) => ResultHomeBefore.fromJson(json.decode(str));

String resultHomeBeforeToJson(ResultHomeBefore data) => json.encode(data.toJson());

class ResultHomeBefore {
  ResultHomeBefore({
    this.data,
    this.error,
  });

  Data data;
  dynamic error;

  factory ResultHomeBefore.fromJson(Map<String, dynamic> json) => ResultHomeBefore(
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
    this.danhSachGiaSuNoiBat,
    this.danhSachGiaSuDangTimViec,
    this.danhSachLopAngTimGiaSu,
    this.listImgSlide,
    this.listBaiviet,
  });

  bool result;
  String message;
  List<DanhSachGiaSuNoiBatBefore> danhSachGiaSuNoiBat;
  List<DanhSachGiaSuDangTimViecBefore> danhSachGiaSuDangTimViec;
  List<DanhSachLopAngTimGiaSuBefore> danhSachLopAngTimGiaSu;
  ListImgSlide listImgSlide;
  List<ListBaivietBefore> listBaiviet;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : json["result"],
    message: json["message"] == null ? null : json["message"],
    danhSachGiaSuNoiBat: json["Danh_sach_gia_su_noi_bat"] == null ? null : List<DanhSachGiaSuNoiBatBefore>.from(json["Danh_sach_gia_su_noi_bat"].map((x) => DanhSachGiaSuNoiBatBefore.fromJson(x))),
    danhSachGiaSuDangTimViec: json["Danh_sach_gia_su_dang_tim_viec"] == null ? null : List<DanhSachGiaSuDangTimViecBefore>.from(json["Danh_sach_gia_su_dang_tim_viec"].map((x) => DanhSachGiaSuDangTimViecBefore.fromJson(x))),
    danhSachLopAngTimGiaSu: json["Danh_sach_lop_đang_tim_gia_su"] == null ? null : List<DanhSachLopAngTimGiaSuBefore>.from(json["Danh_sach_lop_đang_tim_gia_su"].map((x) => DanhSachLopAngTimGiaSuBefore.fromJson(x))),
    listImgSlide: json["list_img_slide"] == null ? null : ListImgSlide.fromJson(json["list_img_slide"]),
    listBaiviet: json["list_baiviet"] == null ? null : List<ListBaivietBefore>.from(json["list_baiviet"].map((x) => ListBaivietBefore.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? null : result,
    "message": message == null ? null : message,
    "Danh_sach_gia_su_noi_bat": danhSachGiaSuNoiBat == null ? null : List<dynamic>.from(danhSachGiaSuNoiBat.map((x) => x.toJson())),
    "Danh_sach_gia_su_dang_tim_viec": danhSachGiaSuDangTimViec == null ? null : List<dynamic>.from(danhSachGiaSuDangTimViec.map((x) => x.toJson())),
    "Danh_sach_lop_đang_tim_gia_su": danhSachLopAngTimGiaSu == null ? null : List<dynamic>.from(danhSachLopAngTimGiaSu.map((x) => x.toJson())),
    "list_img_slide": listImgSlide == null ? null : listImgSlide.toJson(),
    "list_baiviet": listBaiviet == null ? null : List<dynamic>.from(listBaiviet.map((x) => x.toJson())),
  };
}

class DanhSachGiaSuDangTimViecBefore {
  DanhSachGiaSuDangTimViecBefore({
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

  factory DanhSachGiaSuDangTimViecBefore.fromJson(Map<String, dynamic> json) => DanhSachGiaSuDangTimViecBefore(
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

class DanhSachGiaSuNoiBatBefore {
  DanhSachGiaSuNoiBatBefore({
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

  factory DanhSachGiaSuNoiBatBefore.fromJson(Map<String, dynamic> json) => DanhSachGiaSuNoiBatBefore(
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

class DanhSachLopAngTimGiaSuBefore {
  DanhSachLopAngTimGiaSuBefore({
    this.avatar,
    this.classId,
    this.className,
    this.classDescribe,
    this.fee,
    this.address,
    this.url,
    this.methodTeach,
  });

  String avatar;
  String classId;
  String className;
  String classDescribe;
  String fee;
  String address;
  String url;
  String methodTeach;

  factory DanhSachLopAngTimGiaSuBefore.fromJson(Map<String, dynamic> json) => DanhSachLopAngTimGiaSuBefore(
    avatar: json["avatar"] == null ? null : json["avatar"],
    classId: json["class_id"] == null ? null : json["class_id"],
    className: json["class_name"] == null ? null : json["class_name"],
    classDescribe: json["class_describe"] == null ? null : json["class_describe"],
    fee: json["fee"] == null ? null : json["fee"],
    address: json["address"] == null ? null : json["address"],
    url: json["url"] == null ? null : json["url"],
    methodTeach: json["method_teach"] == null ? null : json["method_teach"],
  );

  Map<String, dynamic> toJson() => {
    "avatar": avatar == null ? null : avatar,
    "class_id": classId == null ? null : classId,
    "class_name": className == null ? null : className,
    "class_describe": classDescribe == null ? null : classDescribe,
    "fee": fee == null ? null : fee,
    "address": address == null ? null : address,
    "url": url == null ? null : url,
    "method_teach": methodTeach == null ? null : methodTeach,
  };
}

class ListBaivietBefore {
  ListBaivietBefore({
    this.urlPost,
    this.urlPicture,
  });

  String urlPost;
  String urlPicture;

  factory ListBaivietBefore.fromJson(Map<String, dynamic> json) => ListBaivietBefore(
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
