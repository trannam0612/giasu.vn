import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_change_password.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:giasu_vn/widgets/dialog_pass.dart';
import 'package:giasu_vn/widgets/dialog_password.dart';
import 'package:sp_util/sp_util.dart';

import 'dialog_change_success.dart';

class ChangePasswordController extends GetxController {
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
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
    } else if (errorShowPassword && passWord.text.length < 8) {
      return 'Mật khẩu tối thiểu 8 kí tự!';
    } else if (errorShowPassword && !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(passWord.text)) {
      return 'Mật khẩu sai định dạng!';
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
    if (passWord.text.length >= 8 && !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(passWord.text)) {
      Get.dialog(DialogErrorPass());
    } else {
      oldPassWord.text.isNotEmpty &&
              RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(passWord.text) &&
              rePassWord.text == passWord.text &&
              passWord.text.length >= 6
          ? changePassword()
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

  Future<void> changePassword() async {
    Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await authenticationRepositories.changePassword(token, oldPassWord.text, passWord.text, rePassWord.text);
      ResultChangePassword resultChangePassword = resultChangePasswordFromJson(res.data);
      if (resultChangePassword.data != null) {
        Get.back();
        Get.dialog(DialogPassword());
        Utils.showToast(resultChangePassword.data.message);
      } else {
        Get.back();
        passWord.clear();
        rePassWord.clear();
        oldPassWord.clear();
        Utils.showToast(resultChangePassword.error.message);
      }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
  }
}
