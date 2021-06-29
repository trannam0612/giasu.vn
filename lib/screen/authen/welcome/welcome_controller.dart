import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_parent.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_teaacher.dart';
import 'package:giasu_vn/common/shared/data/repositories/user_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/screen/authen/login/login_controller.dart';
import 'package:giasu_vn/screen/authen/login/select_type_login_screen.dart';
import 'package:giasu_vn/screen/authen/welcome/welcome_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_screen.dart';
import 'package:giasu_vn/screen/home/home_before/home_before_screen.dart';
import 'package:giasu_vn/screen/information/information_parent/update_info_parent_controller.dart';
import 'package:giasu_vn/screen/navigation/navigation_controller.dart';
import 'package:giasu_vn/screen/navigation/navigation_screen.dart';
import 'package:sp_util/sp_util.dart';

class WelcomeController extends GetxController {
  UserRepositories userRepositories = UserRepositories();
  LoginController loginController = Get.put(LoginController());
  RxInt value = 0.obs;
  RxString user = ''.obs;
  RxString token = ''.obs;

  void changeValue() {
    value.value++;
    value.value > 1 ? Get.to(SelectTypeLoginScreen()) : null;
    print(value.value);
  }

  void checkUser() {
    token.value == ''
        ? Get.to(SelectTypeLoginScreen())
        : user.value == ''
            ? Get.to(WelcomeScreen())
            : user.value == '2'
                ? getInfoTeacher()
                : getInfoParent();
    value.value > 1 ? Get.to(SelectTypeLoginScreen()) : null;
    print(value.value);
  }

  @override
  void onInit() async {
    user.value = SpUtil.getString(ConstString.Status_user);
    token.value = SpUtil.getString(ConstString.token);
    print(user.value);
    await Future.delayed(Duration(seconds: 2), () => checkUser());
    // getInfoParent();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getInfoParent() async {
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await userRepositories.getInfoParent(token);
    ResultGetInfoParent resultGetInfoParent = resultGetInfoParentFromJson(res.data);
    if (resultGetInfoParent.data != null) {
      Get.to(NavigationScreen());
      Utils.showToast(resultGetInfoParent.data.message);
    } else {
      Get.to(SelectTypeLoginScreen());
      Utils.showToast(resultGetInfoParent.error.message);
    }
    update();
  }

  Future<void> getInfoTeacher() async {
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await userRepositories.getInfoTeacher(token);
    ResultGetInfoTeacher resultGetInfoTeacher = resultGetInfoTeacherFromJson(res.data);
    if (resultGetInfoTeacher.data != null) {
      Get.to(NavigationScreen());
      Utils.showToast(resultGetInfoTeacher.data.message);
    } else {
      Get.to(SelectTypeLoginScreen());
      Utils.showToast(resultGetInfoTeacher.error.message);
    }
    update();
  }
}
