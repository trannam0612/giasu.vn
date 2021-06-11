import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_password.dart';
import 'package:sp_util/sp_util.dart';

import 'dialog_change_success.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldPassWord = TextEditingController();
  TextEditingController otpUser = TextEditingController();
  TextEditingController passWord = TextEditingController();
  TextEditingController rePassWord = TextEditingController();
  bool errorShowOldPassword = false;
  bool errorShowPassword = false;
  bool errorShowRePassword = false;
  bool isShowRePassword = true;
  bool isShowOldPassWord = true;
  bool isShowPassword = true;

  @override
  void onInit() {
    oldPassWord.addListener(() {
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

  void changeValueOldPassword() {
    print('changeValueRePassword');
    isShowOldPassWord = !isShowOldPassWord;
    update();
  }

  String checkOldPassword() {
    print('checkOldPassword');
    if (errorShowOldPassword && oldPassWord.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
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
    errorShowOldPassword = true;
    oldPassWord.text.isNotEmpty && passWord.text.length >= 6 && rePassWord.text == passWord.text
        ? Get.dialog(DialogPassword())
        // Get.to(RegisterParentStep2Screen())
        : Get.dialog(DialogError(
            title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
            onTap: () => Get.back(),
            textButton: 'Ok',
            richText: false,
          ));
    update();
  }
}
