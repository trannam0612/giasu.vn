import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_email_forgot.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
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
      return 'Trường bắt buộc!';
    } else if (errorShowPassword && passWord.text.length < 6) {
      return 'Mật khẩu tối thiểu 6 kí tự!';
    }
    return null;
  }

  String checkRePassword() {
    print('checkRePassword');
    if (errorShowRePassword && rePassWord.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorShowRePassword && passWord.text != rePassWord.text) {
      return 'Mật khẩu không khớp!';
    }
    return null;
  }

  void checkButton() {
    errorShowPassword = true;
    errorShowRePassword = true;
    passWord.text.length >= 6 && rePassWord.text == passWord.text
        ? print('oke')
        // Get.to(RegisterParentStep2Screen())
        : Get.dialog(DialogError(
            title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
            onTap: () => Get.back(),
            textButton: 'Ok',
            richText: false,
          ));
    update();
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
    errorEmail = true;
    email.text.isNotEmpty ? emailForgotPassword() : Utils.showToast('Email không được để trống!');
    update();
  }

  Future<void> emailForgotPassword() async {
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    ResultData res = await authenticationRepositories.mailForgotPassword(email.text);
    ResultEmailForgot resultEmailForgot = resultEmailForgotFromJson(res.data);
    if (resultEmailForgot.data != null) {
      Get.back();
      // SpUtil.putString(ConstString.token, resultEmailForgetPassword.data.accessToken);
      Utils.showToast(resultEmailForgot.data.message);
      // Get.toNamed(Routes.CONFIRMOTPFORGOT);
    } else {
      email.clear();
      Utils.showToast(resultEmailForgot.error.message);
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
