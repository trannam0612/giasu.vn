import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_email_forgot.dart';
import 'package:giasu_vn/common/shared/data/models/result_new_password_forgot.dart';
import 'package:giasu_vn/common/shared/data/models/result_verify_forgot.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/authen/login/select_type_login_screen.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:giasu_vn/widgets/dialog_pass.dart';
import 'package:sp_util/sp_util.dart';

class ForgotController extends GetxController {
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  TextEditingController email = TextEditingController();
  TextEditingController otpUser = TextEditingController();
  TextEditingController passWord = TextEditingController();
  TextEditingController rePassWord = TextEditingController();

  final GlobalKey<FormState> emailKey = GlobalKey();
  final GlobalKey<FormState> passWordKey = GlobalKey();
  final GlobalKey<FormState> rePassWordKey = GlobalKey();

  bool errorShowPassword = false;
  bool errorShowRePassword = false;
  bool isShowRePassword = true;
  bool isShowPassword = true;
  bool errorEmail = false;

  @override
  void onInit() {
    email.addListener(() {
      update();
    });
    otpUser.addListener(() {
      update();
    });
    passWord.addListener(() {
      update();
    });
    rePassWord.addListener(() {
      update();
    });
    // TODO: implement onInit
    super.onInit();
  }

  void changeValuePassword() {
    print('changeValuePassword');
    isShowPassword = !isShowPassword;
    update();
  }

  void changeValueRePassword() {
    print('changeValueRePassword');
    isShowRePassword = !isShowRePassword;
    update();
  }



  void checkButtonOTP() {
    print('checkButtonOTP');
    if (otpUser.text.isNotEmpty) {
      verifyForgotPassword();
    } else {
      Utils.showToast('OTP không được để trống!');
      otpUser.clear();
    }
    update();
  }

  Timer _timer;
  RxInt seconds = 30.obs;

  void startTimer() {
    print(' startTimer();');
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

  Future<void> verifyForgotPassword() async {
    Get.dialog(DialogLoading());
    try{
    String tokenForgot = SpUtil.getString(ConstString.token_forgot);
    ResultData res = await authenticationRepositories.verifyForgotPassword(tokenForgot, otpUser.text);
    ResultVerifyForgot resultVerifyForgot = resultVerifyForgotFromJson(res.data);
    if (resultVerifyForgot.data != null) {
      Get.back();
      Utils.showToast(resultVerifyForgot.data.message);
      Get.toNamed(Routes.new_password_forgot);
    } else {
      Get.back();

      Utils.showToast(resultVerifyForgot.error.message);
      otpUser.clear();
    }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> newPasswordForgot() async {
    Get.dialog(DialogLoading());
    try{
    String tokenForgot = SpUtil.getString(ConstString.token_forgot);
    ResultData res = await authenticationRepositories.newPasswordForgot(tokenForgot, passWord.text, rePassWord.text);
    ResultNewPasswordForgot resultNewPasswordForgot = resultNewPasswordForgotFromJson(res.data);
    if (resultNewPasswordForgot.data != null) {
      Get.back();
      Utils.showToast(resultNewPasswordForgot.data.message);
      // Get.(Routes.LOGIN);
      Get.offAll(SelectTypeLoginScreen());
    } else {
      Get.back();
      Utils.showToast(resultNewPasswordForgot.error.message);
      passWord.clear();
      rePassWord.clear();
    }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  void checkButton() {
    if (passWordKey.currentState.validate() && rePassWordKey.currentState.validate()) {
      newPasswordForgot();
    } else {
      Get.dialog(DialogErrorPass());

      passWordKey.currentState.validate();
      rePassWordKey.currentState.validate();
      update();
    }
  }

  String checkEmail() {
    if (errorEmail && email.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorEmail && !email.text.contains('@') && !email.text.contains('.')) {
      return 'Email không hợp lệ!';
    } else if (errorEmail && !email.text.contains('.')) {
      return 'Email không hợp lệ!';
    } else {
      return null;
    }
  }

  void checkButtonSendEmail() {
    if (emailKey.currentState.validate()) {
      emailForgotPassword();
      startTimer();
    } else {
      emailKey.currentState.validate();
      Utils.showToast('Email không được để trống!');
    }
    update();
  }

  Future<void> emailForgotPassword() async {
    // await Future.delayed(Duration(milliseconds: 1));
    Get.dialog(DialogLoading());
    try{
    ResultData res = await authenticationRepositories.mailForgotPassword(email.text);
    ResultEmailForgot resultEmailForgot = resultEmailForgotFromJson(res.data);
    if (resultEmailForgot.data != null) {
      Get.back();

      SpUtil.putString(ConstString.token_forgot, resultEmailForgot.data.dataUser.token);
      Utils.showToast(resultEmailForgot.data.message);
      Get.toNamed(Routes.verify_forgot);
    } else {
      Get.back();
      email.clear();
      Utils.showToast(resultEmailForgot.error.message);
    }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
// Future<void> confirmOtpForgot() async {
//   String token = SpUtil.getString(ConstString.token);
//   print(token);
//   ResultData res = await authenticationRepositories.confirmOtpForgot(token, otpUser.text);
//   ResultConfirmOtpForgot resultConfirmOtpForgot = resultConfirmOtpForgotFromJson(res.data);
//   if(resultConfirmOtpForgot.data != null)
//   {
//     Utils.showToast(resultConfirmOtpForgot.data.message);
//     SpUtil.putString(ConstString.token,
//         resultConfirmOtpForgot.data.accessToken);
//     Get.toNamed(Routes.FORGOTNEWPASSWORD);
//   }
//   else {
//     Utils.showToast(resultConfirmOtpForgot.error.message);
//   }
// }
// Future<void> resetPass() async {
//   String token = SpUtil.getString(ConstString.token);
//   print(token);
//   ResultData res = await authenticationRepositories.resetPass(token, newPass.text, reNewPass.text);
//   ResultDataRestPass resultDataRestPass = resultDataRestPassFromJson(res.data);
//   if(resultDataRestPass.data != null) {
//     print(resultDataRestPass.data.message);
//     print(resultDataRestPass.data.accessToken);
//     SpUtil.putString(ConstString.token,
//         resultDataRestPass.data.accessToken);
//     Get.dialog(DialogSuccess(
//       title: 'Đổi mật khẩu thành công',
//       titleButton: 'Đăng Nhập',
//       onTap: () => Get.offAllNamed(Routes.LOGIN),
//     ));
//   }
//   else {
//     Utils.showToast(resultDataRestPass.error.message);
//   }
// }
// Future<void> reSendOtp() async {
//   await Future.delayed(Duration(milliseconds: 1));
//   Get.dialog(DialogLoading());
//   ResultData res = await authenticationRepositories.resendOtp(email.text);
//   resultResendOtp = resultResendOtpFromJson(res.data);
//   if(resultResendOtp.data != null) {
//     Get.back();
//     Utils.showToast(resultResendOtp.data.message);
//   }
//   else {
//     Utils.showToast(resultResendOtp.error.message);
//   }
//   update();
// }
}
