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
import 'package:giasu_vn/common/shared/data/models/result_resend_OTP_register.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/authen/otp/otp_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_screen.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:intl/intl.dart';

import 'package:sp_util/sp_util.dart';

class LoginController extends GetxController {
  HomeAfterTeacherController homeAfterTeacherController = Get.put(HomeAfterTeacherController());
  HomeAfterParentController homeAfterParentController = Get.put(HomeAfterParentController());
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  ResultListProvincialSubjectClass resultListProvincialSubjectClass = ResultListProvincialSubjectClass();
  HomeRepositories homeRepositories = HomeRepositories();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  ResultHomeAfterParent resultHomeAfterParent = ResultHomeAfterParent();
  ResultHomeAfterTeacher resultHomeAfterTeacher = ResultHomeAfterTeacher();

  // ResultListData resultListData = ResultListData();
  List<String> listGender = [];
  List<String> listProvincial = [];
  List<String> listFormTeaching = [];
  List<String> listKVday = [];
  List<String> listKieuGS = [];
  List<String> listLuong = [];
  List<String> listClass = [];
  List<String> listSubject = [];
  String userType;
  bool isShowPass = true;

  void changeValuePassword() {
    print('changeValuePassword');
    isShowPass = !isShowPass;
    update();
  }

  Future<void> loginParent() async {
    Get.dialog(DialogLoading());
    try {
      ResultData res = await authenticationRepositories.loginParent(email.text, pass.text);
      ResultLogin resultLogin = resultLoginFromJson(res.data);
      if (resultLogin.data != null) {
        Get.back();
        SpUtil.putString(ConstString.Status_user, '1');
        print(resultLogin.data.data.token);
        print(resultLogin.data.data.email);
        print(resultLogin.data.data.id);
        SpUtil.putString(ConstString.token, resultLogin.data.data.token);
        SpUtil.putString(ConstString.ID_USER, resultLogin.data.data.id);
        SpUtil.putString(ConstString.EMAIL, resultLogin.data.data.email);
        SpUtil.putString(ConstString.NAME, resultLogin.data.data.nameParent);
        SpUtil.putString(ConstString.USER_TYPE, '1');
        Utils.showToast(resultLogin.data.message);
        homeAfterParentController.homeAfterParent(1, 10);
        // Get.toNamed(Routes.navigation);
        // homeAfterParent(1, 10);
      } else {
        if (resultLogin.error.code == 401) {
          reSendOTPRegister();
          Get.back();
        } else {
          Get.back();
          Utils.showToast(resultLogin.error.message);
        }
      }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> reSendOTPRegister() async {
    Get.dialog(DialogLoading());
    try {
      String email = SpUtil.getString(ConstString.EMAIL);
      ResultData res = await authenticationRepositories.reSendOTPRegister(email);
      ResultReSendOtpRegister resultReSendOtpRegister = resultReSendOtpRegisterFromJson(res.data);
      if (resultReSendOtpRegister.data != null) {
        Get.back();
        Get.to(OTPScreen(
          back: () => Get.back(),
        ));
        SpUtil.putString(ConstString.token_register, resultReSendOtpRegister.data.token);

        Utils.showToast(resultReSendOtpRegister.data.message);
      } else {
        Get.back();
        Utils.showToast(resultReSendOtpRegister.error.message);
      }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> loginTeacher() async {
    Get.dialog(DialogLoading());
    try {
      ResultData res = await authenticationRepositories.loginTeacher(email.text, pass.text);

      ResultLoginTeacher resultLoginTeacher = resultLoginTeacherFromJson(res.data);
      if (resultLoginTeacher.data != null) {
        Get.back();
        SpUtil.putString(ConstString.Status_user, '1');
        print(resultLoginTeacher.data.data.token);
        print(resultLoginTeacher.data.data.email);
        print(resultLoginTeacher.data.data.id);
        SpUtil.putString(ConstString.token, resultLoginTeacher.data.data.token);
        SpUtil.putString(ConstString.ID_USER, resultLoginTeacher.data.data.id);
        SpUtil.putString(ConstString.EMAIL, resultLoginTeacher.data.data.email);
        SpUtil.putString(ConstString.NAME, resultLoginTeacher.data.data.nameTutor);
        SpUtil.putString(ConstString.USER_TYPE, '2');
        Utils.showToast(resultLoginTeacher.data.message);
        homeAfterTeacherController.homeAfterTeacher(1, 10);
        // Get.toNamed(Routes.navigation);
      } else {
        if (resultLoginTeacher.error.code == 401) {
          reSendOTPRegister();
          Get.back();
        } else {
          Get.back();
          Utils.showToast(resultLoginTeacher.error.message);
        }
      }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> listCitySubject() async {
    try {
      ResultData res = await authenticationRepositories.listCitySubject();
      resultListProvincialSubjectClass = resultListProvincialSubjectClassFromJson(res.data);
      if (resultListProvincialSubjectClass.data != null) {
        // Utils.showToast(resultListProvincialSubjectClass.data.message);
        listDataCity = resultListProvincialSubjectClass.data.dataCity;
        listDataSubject = resultListProvincialSubjectClass.data.dataSubject;
        listDataClass = resultListProvincialSubjectClass.data.dataClass;
        listStringClass = resultListProvincialSubjectClass.data.dataClass.map((e) => e.ctName).toList();
      } else {
        // Utils.showToast(resultListProvincialSubjectClass.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
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
    update();
    return "vừa xong";
  }

  @override
  void onInit() {
    email.text = SpUtil.getString(ConstString.EMAIL);
     userType = SpUtil.getString(ConstString.USER_TYPE);
     print('userType${userType}');
    print(userType);
    listCitySubject();

    super.onInit();
  }
}
