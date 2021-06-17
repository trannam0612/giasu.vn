import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_verify_register.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/screen/authen/login/login_screen.dart';

import 'package:sp_util/sp_util.dart';

class OTPController extends GetxController {
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  TextEditingController otpUser = TextEditingController();
  ResultVerifyRegister resultVerifyRegister = ResultVerifyRegister();
  String token;

  // String token;

  String checkOTP() {
    // ignore: unnecessary_statements
    otpUser.text.isEmpty ? "OTP không được để trống" : null;
  }

  void checkButtonOTP() {
    print('checkButtonOTP');
    print(checkOTP());
    token = SpUtil.getString(ConstString.token_register);
    if (otpUser.text.isNotEmpty) {
      verifyRegister(token);
    } else {
      Utils.showToast('OTP không được để trống!');
      otpUser.clear();
    }
    update();
  }

  Future<void> verifyRegister(String token) async {
    ResultData res = await authenticationRepositories.verifyRegister(token, otpUser.text);
    resultVerifyRegister = resultVerifyRegisterFromJson(res.data);
    if (resultVerifyRegister.data != null) {
      Utils.showToast(resultVerifyRegister.data.message);
      Get.to(LoginScreen());
    } else {
      Utils.showToast(resultVerifyRegister.error.message);
      otpUser.clear();
    }
    update();
  }
}
