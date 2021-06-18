import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_after_parent.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_after_teacher.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_provincial_subject.dart';
import 'package:giasu_vn/common/shared/data/models/result_login_parent.dart';
import 'package:giasu_vn/common/shared/data/models/result_login_teacher.dart';
import 'package:giasu_vn/common/shared/data/models/result_register_parent.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_screen.dart';
import 'package:intl/intl.dart';

import 'package:sp_util/sp_util.dart';

class LoginController extends GetxController {
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  ResultListProvincialSubjectClass resultListProvincialSubjectClass = ResultListProvincialSubjectClass();
  HomeRepositories homeRepositories = HomeRepositories();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  ResultHomeAfterParent resultHomeAfterParent = ResultHomeAfterParent();
  ResultHomeAfterTeacher resultHomeAfterTeacher = ResultHomeAfterTeacher();
  String userType = SpUtil.getString(ConstString.USER_TYPE);

  // ResultListData resultListData = ResultListData();
  List<String> listGender = [];
  List<String> listProvincial = [];
  List<String> listFormTeaching = [];
  List<String> listKVday = [];
  List<String> listKieuGS = [];
  List<String> listLuong = [];
  List<String> listClass = [];
  List<String> listSubject = [];
  List<DataDsgs> listGSGD = [];
  List<DataDsgs> listGSPB = [];
  List<DataDslh> listLHGD = [];
  List<DataDslh> listLHGDMore = [];
  List<DataDslh> listLHPB = [];

  bool isShowPass = true;

  Future<void> loginParent() async {
    ResultData res = await authenticationRepositories.loginParent(email.text, pass.text);
    ResultLogin resultLogin = resultLoginFromJson(res.data);
    if (resultLogin.data != null) {
      print(resultLogin.data.data.token);
      print(resultLogin.data.data.email);
      print(resultLogin.data.data.id);
      SpUtil.putString(ConstString.token, resultLogin.data.data.token);
      SpUtil.putString(ConstString.ID_USER, resultLogin.data.data.id);
      SpUtil.putString(ConstString.EMAIL, resultLogin.data.data.email);
      SpUtil.putString(ConstString.NAME, resultLogin.data.data.nameParent);
      Utils.showToast(resultLogin.data.message);
      // homeAfterParent(1, 10);
    } else {
      Get.back();
      Utils.showToast(resultLogin.error.message);
    }
    update();
  }

  Future<void> loginTeacher() async {
    ResultData res = await authenticationRepositories.loginTeacher(email.text, pass.text);

    ResultLoginTeacher resultLoginTeacher = resultLoginTeacherFromJson(res.data);
    if (resultLoginTeacher.data != null) {
      print(resultLoginTeacher.data.data.token);
      print(resultLoginTeacher.data.data.email);
      print(resultLoginTeacher.data.data.id);
      SpUtil.putString(ConstString.token, resultLoginTeacher.data.data.token);
      SpUtil.putString(ConstString.ID_USER, resultLoginTeacher.data.data.id);
      SpUtil.putString(ConstString.EMAIL, resultLoginTeacher.data.data.email);
      SpUtil.putString(ConstString.NAME, resultLoginTeacher.data.data.nameTutor);
      Utils.showToast(resultLoginTeacher.data.message);
      Get.to(HomeAfterTeacherScreen());
    } else {
      // Get.back();
      Utils.showToast(resultLoginTeacher.error.message);
    }
    update();
  }

  Future<void> listCitySubject() async {
    ResultData res = await authenticationRepositories.listCitySubject();
    resultListProvincialSubjectClass = resultListProvincialSubjectClassFromJson(res.data);
    if (resultListProvincialSubjectClass.data != null) {
      Utils.showToast(resultListProvincialSubjectClass.data.message);
      listDataCity = resultListProvincialSubjectClass.data.dataCity;
      listDataSubject = resultListProvincialSubjectClass.data.dataSubject;
      listDataClass = resultListProvincialSubjectClass.data.dataClass;
      listStringClass = resultListProvincialSubjectClass.data.dataClass.map((e) => e.ctName).toList();
    } else {
      Utils.showToast(resultListProvincialSubjectClass.error.message);
    }
  }

  Future<void> homeAfterParent(int currentPage, int limit) async {
    print('homeAfterParent');
    print(userType);
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.homeAfter(token, currentPage, limit);
    resultHomeAfterParent = resultHomeAfterParentFromJson(res.data);
    if (resultHomeAfterParent.data != null) {
      listGSGD = resultHomeAfterParent.data.dataTutorGd.dataDsgsgd;
      listGSPB = resultHomeAfterParent.data.dataTutorPb.dataDsgspb;
      Get.to(HomeAfterParentScreen());
    }
    update();
  }

  Future<void> homeAfterTeacher(int currentPage, int limit) async {
    print('homeAfterTeacher');
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.homeAfter(token, currentPage, limit);
    resultHomeAfterTeacher = resultHomeAfterTeacherFromJson(res.data);
    if (resultHomeAfterTeacher.data != null) {
      listLHGD = resultHomeAfterTeacher.data.dataClassGd.dataDslhgd;
      listLHPB = resultHomeAfterTeacher.data.dataClassPb.dataDslhpb;
      Get.to(HomeAfterTeacherScreen());
    }
    update();
  }

  String timeAgo(int timestamp) {
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000 * 1000);
    var now = new DateTime.now();
    var format = new DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    var time = DateTime.parse(format.format(date));
    var diff = now.difference(time);
    if (diff.inDays > 365) return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "năm" : "năm"} trước";
    if (diff.inDays > 30) return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "tháng" : "tháng"} trước";
    if (diff.inDays > 7) return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "tuần" : "tuần"} trước";
    if (diff.inDays > 0) return "${diff.inDays} ${diff.inDays == 1 ? "ngày" : "ngày"} trước";
    if (diff.inHours > 0) return "${diff.inHours} ${diff.inHours == 1 ? "giờ" : "giờ"} trước";
    if (diff.inMinutes > 0) return "${diff.inMinutes} ${diff.inMinutes == 1 ? "phút" : "phút"} trước";
    return "vừa xong";
  }

//
// Future<void> getListData() async {
//   print('getListData');
//   ResultData res = await authenticationRepositories.getListData();
//   resultListData = resultListDataFromJson(res.data);
//   if (res.result) {
//     SpUtil.putString(ConstString.Status_user, '1');
//     listProvincial = resultListData.data.danhSachThanhPho.map((e) => e.citName).toList();
//     listFormTeaching = resultListData.data.danhSachHinhThucGiangDay.map((e) => e.methodName).toList();
//     listKVday = resultListData.data.danhSachKhuVucGiangDay.map((e) => e.citName).toList();
//     listKieuGS = resultListData.data.danhSachKieuGiaSu.map((e) => e.nameType).toList();
//     listLuong = resultListData.data.danhSachLuongTheo.map((e) => e.name).toList();
//     listClass = resultListData.data.danhSachLopHocSeDay.map((e) => e.levelClassName).toList();
//     listSubject = resultListData.data.danhSachMonHoc.map((e) => e.subject).toList();
//     listGender = resultListData.data.danhSachGioiTinh.map((e) => e.sexName).toList();
//     // print(listProvincial);
//     // print(listFormTeaching);
//     // print(listKVday);
//     // print(listKieuGS);
//     // print(listLuong);
//     // print(listClass);
//     // print(listSubject);
//     // print(resultListData.data.danhSchGiiTnh);
//     print('200');
//   }
//   update();
// }
  @override
  void onInit() {
    print(userType);
    listCitySubject();
    super.onInit();
  }
}}
