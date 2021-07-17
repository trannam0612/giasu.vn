import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/check_token.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_parent.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_teaacher.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
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
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
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
    // token.value == ''
    //     ? Get.to(SelectTypeLoginScreen())
    //     : user.value == ''
    //         ? Get.to(WelcomeScreen())
    //         : checkToken();
    user.value != '1'
        ? Get.to(WelcomeScreen())
        : token.value == '1'
            ? Get.to(SelectTypeLoginScreen())
            : checkToken();
    value.value > 1 ? Get.to(SelectTypeLoginScreen()) : null;
    print(value.value);
  }

  @override
  void onInit() async {
    user.value = SpUtil.getString(ConstString.Status_user);
    token.value = SpUtil.getString(ConstString.token);
    print(user.value);
    print(token.value);
    await Future.delayed(Duration(seconds: 2), () => checkUser());
    // getInfoParent();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> checkToken() async {
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await authenticationRepositories.checkToken(token);
    ResultCheckToken resultCheckToken = resultCheckTokenFromJson(res.data);
    if (resultCheckToken.data != null) {
      Get.to(NavigationScreen());
      Utils.showToast(resultCheckToken.data.message);
    } else {
      Get.to(SelectTypeLoginScreen());
      // Utils.showToast(resultCheckToken.error.message);
    }
    update();
  }
}
