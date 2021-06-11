import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sp_util/sp_util.dart';

class LoginController extends GetxController {
  // AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  // TextEditingController email = TextEditingController();
  // TextEditingController pass = TextEditingController();
  // ResultListData resultListData = ResultListData();
  // List<String> listGender = [];
  // List<String> listProvincial = [];
  // List<String> listFormTeaching = [];
  // List<String> listKVday = [];
  // List<String> listKieuGS = [];
  // List<String> listLuong = [];
  // List<String> listClass = [];
  // List<String> listSubject = [];
  // bool isShowPass = true;
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
  // Future<void> login() async {
  //   Get.dialog(DialogLoading());
  //   ResultData res = await authenticationRepositories.login(email.text, pass.text);
  //   ResultDataLogin resultDataLogin = resultDataLoginFromJson(res.data);
  //   if (resultDataLogin.data != null) {
  //     Get.back();
  //     print(resultDataLogin.data.accessToken);
  //     print(resultDataLogin.data.userInfo.epEmail);
  //     print(resultDataLogin.data.userInfo.epId);
  //     SpUtil.putString(ConstString.token, resultDataLogin.data.accessToken);
  //     SpUtil.putString(ConstString.ID_USER, resultDataLogin.data.userInfo.epId);
  //     SpUtil.putString(ConstString.EMAIL, resultDataLogin.data.userInfo.epEmail);
  //     SpUtil.putString(ConstString.NAME, resultDataLogin.data.userInfo.epName);
  //     SpUtil.putString(ConstString.USER_TYPE, resultDataLogin.data.userInfo.userType);
  //     SpUtil.putString(ConstString.AVATAR, resultDataLogin.data.userInfo.avatar);
  //     Utils.showToast(resultDataLogin.data.message);
  //     await Get.toNamed(Routes.NAVIGATION);
  //   } else {
  //     Get.back();
  //     Utils.showToast(resultDataLogin.error.message);
  //   }
  //   update();
  // }
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
