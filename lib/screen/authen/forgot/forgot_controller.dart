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
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:giasu_vn/widgets/dialog_pass.dart';
import 'package:sp_util/sp_util.dart';

class ForgotController extends GetxController {
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  TextEditingController email = TextEditingController();
  TextEditingController otpUser = TextEditingController();
  TextEditingController passWord = TextEditingController();
  TextEditingController rePassWord = TextEditingController();
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

  String checkPassword() {
    print('checkPassword');
    if (errorShowPassword && passWord.text.isEmpty) {
      return 'Tr?????ng b???t bu???c!';
    } else if (errorShowPassword && passWord.text.length < 8) {
      return 'M???t kh???u t???i thi???u 8 k?? t???!';
    } else if (errorShowPassword && !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(passWord.text)) {
      return 'M???t kh???u sai ?????nh d???ng!';
    }
    return null;
  }

  String checkRePassword() {
    print('checkRePassword');
    if (errorShowRePassword && rePassWord.text.isEmpty) {
      return 'Tr?????ng b???t bu???c!';
    } else if (errorShowRePassword && passWord.text != rePassWord.text) {
      return 'M???t kh???u kh??ng kh???p!';
    }
    return null;
  }

  void checkButtonOTP() {
    print('checkButtonOTP');
    if (otpUser.text.isNotEmpty) {
      verifyForgotPassword();
    } else {
      Utils.showToast('OTP kh??ng ???????c ????? tr???ng!');
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
      Utils.showToast('X???y ra l???i. Vui l??ng th??? l???i!');
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
      Utils.showToast('X???y ra l???i. Vui l??ng th??? l???i!');
    }
    update();
  }

  void checkButton() {
    errorShowPassword = true;
    errorShowRePassword = true;
    if (passWord.text.length >= 8 && !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(passWord.text)) {
      Get.dialog(DialogErrorPass());
    } else {
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(passWord.text) && rePassWord.text == passWord.text
          ? newPasswordForgot()
          // Get.to(RegisterParentStep2Screen())
          : Get.dialog(DialogError(
              title: 'T???t c??? c??c th??ng tin tr??n l?? b???t bu???c.',
              onTap: () => Get.back(),
              textButton: 'Ok',
              richText: false,
            ));
      update();
    }
  }

  String checkEmail() {
    if (errorEmail && email.text.isEmpty) {
      return 'Tr?????ng b???t bu???c!';
    } else if (errorEmail && !email.text.contains('@') && !email.text.contains('.')) {
      return 'Email kh??ng h???p l???!';
    } else if (errorEmail && !email.text.contains('.')) {
      return 'Email kh??ng h???p l???!';
    } else {
      return null;
    }
  }

  void checkButtonSendEmail() {
    errorEmail = true;
    email.text.isNotEmpty ? {emailForgotPassword(), startTimer()} : Utils.showToast('Email kh??ng ???????c ????? tr???ng!');
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
      Utils.showToast('X???y ra l???i. Vui l??ng th??? l???i!');
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
//       title: '?????i m???t kh???u th??nh c??ng',
//       titleButton: '????ng Nh???p',
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
