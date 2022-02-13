import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_change_password.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:giasu_vn/widgets/dialog_pass.dart';
import 'package:giasu_vn/widgets/dialog_password.dart';
import 'package:sp_util/sp_util.dart';

class ChangePasswordController extends GetxController {
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  TextEditingController oldPassWord = TextEditingController();
  TextEditingController otpUser = TextEditingController();
  TextEditingController passWord = TextEditingController();
  TextEditingController rePassWord = TextEditingController();

  final GlobalKey<FormState> oldPassWordKey = GlobalKey();
  final GlobalKey<FormState> passWordKey = GlobalKey();
  final GlobalKey<FormState> rePassWordKey = GlobalKey();

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



  void checkButton() {
    if (oldPassWordKey.currentState.validate() && passWordKey.currentState.validate() && rePassWordKey.currentState.validate()) {
      changePassword();
    } else {
      if(passWord.text.isNotEmpty&&rePassWord.text.isNotEmpty){
        Get.dialog(DialogErrorPass());
      }else{
        Get.dialog(DialogErrorPass(text: 'Vui nhập đầy đủ các trường!',));
      }


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
