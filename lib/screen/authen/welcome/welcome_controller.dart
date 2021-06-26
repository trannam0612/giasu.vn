import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/screen/authen/login/select_type_login_screen.dart';
import 'package:giasu_vn/screen/authen/welcome/welcome_screen.dart';
import 'package:giasu_vn/screen/home/home_before/home_before_screen.dart';
import 'package:sp_util/sp_util.dart';

class WelcomeController extends GetxController {
  RxInt value = 0.obs;
  RxString user = ''.obs;

  void changeValue() {
    value.value++;
    value.value > 1 ? Get.to(SelectTypeLoginScreen()) : null;
    print(value.value);
  }

  void checkUser() {
    user.value == '' ? Get.to(WelcomeScreen()) : Get.to(SelectTypeLoginScreen());
    value.value > 1 ? Get.to(SelectTypeLoginScreen()) : null;
    print(value.value);
  }

  @override
  void onInit() async {
    user.value = SpUtil.getString(ConstString.Status_user);
    print(user.value);
    await Future.delayed(Duration(seconds: 2), () => checkUser());

    // TODO: implement onInit
    super.onInit();
  }
}
