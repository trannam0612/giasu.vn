import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_resend_OTP_register.dart';
import 'package:giasu_vn/common/shared/data/models/result_verify_forgot.dart';
import 'package:giasu_vn/common/shared/data/models/result_verify_register.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/authen/login/login_screen.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';

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
    Get.dialog(DialogLoading());
    try {
      ResultData res = await authenticationRepositories.verifyRegister(token, otpUser.text);
      resultVerifyRegister = resultVerifyRegisterFromJson(res.data);
      if (resultVerifyRegister.data != null) {
        Get.back();
        Utils.showToast(resultVerifyRegister.data.message);
        Get.offAndToNamed(Routes.LOGIN );
      } else {
        Get.back();
        Utils.showToast(resultVerifyRegister.error.message);
        otpUser.clear();
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
      ResultData res = await authenticationRepositories.reSendOTPRegister(email,userType);
      ResultReSendOtpRegister resultReSendOtpRegister = resultReSendOtpRegisterFromJson(res.data);
      if (resultReSendOtpRegister.data != null) {
        SpUtil.putString(ConstString.token_register, resultReSendOtpRegister.data.token);
        Get.back();
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

  Timer _timer;
  RxInt seconds = 30.obs;

  void startTimer() {
    seconds.value = 30;
    const period = const Duration(seconds: 1);
    _timer = Timer.periodic(period, (timer) {
      seconds--;

      if (seconds.value == 0) {
        // Countdown seconds 0, cancel timer
        if (_timer != null) {
          _timer.cancel();
          _timer = null;
        }
      }
    });
    update();
  }
String userType;
  @override
  void onInit() {
    startTimer();
    userType = SpUtil.getString(ConstString.USER_TYPE);
    print('userType${userType}');
    // TODO: implement onInit
    super.onInit();
  }
}
