import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_login.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_screen.dart';

import 'package:sp_util/sp_util.dart';

class LoginController extends GetxController {
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  // ResultListData resultListData = ResultListData();
  List<String> listGender = [];
  List<String> listProvincial = [];
  List<String> listFormTeaching = [];
  List<String> listKVday = [];
  List<String> listKieuGS = [];
  List<String> listLuong = [];
  List<String> listClass = [];
  List<String> listSubject = [];
  bool isShowPass = true;
  //
  // void onInit() {
  //   // called immediately after the widget is allocated memory
  //   getListData();
  //   super.onInit();
  // }
  //
  // void changeShowPass() {
  //   print('changeShowPass');
  //   isShowPass = !isShowPass;
  //   update();
  // }
  //
  Future<void> login() async {
    ResultData res = await authenticationRepositories.login(email.text, pass.text);
    ResultLogin resultLogin = resultLoginFromJson(res.data);
    if (resultLogin.data != null) {
      print(resultLogin.data.data.token);
      print(resultLogin.data.data.email);
      print(resultLogin.data.data.id);
      SpUtil.putString(ConstString.token, resultLogin.data.data.token);
      SpUtil.putString(ConstString.ID_USER, resultLogin.data.data.id);
      SpUtil.putString(ConstString.EMAIL, resultLogin.data.data.email);
      SpUtil.putString(ConstString.NAME, resultLogin.data.data.nameTeacher);
      Utils.showToast(resultLogin.data.message);
      await Get.to(HomeAfterParentScreen());
    } else {
      Get.back();
      Utils.showToast(resultLogin.error.message);
    }
    update();
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
}
