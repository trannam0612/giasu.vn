import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_screen.dart';
import 'package:giasu_vn/screen/home/home_before/home_before_screen.dart';
import 'package:giasu_vn/screen/message/message_screen.dart';
import 'package:giasu_vn/screen/notifications/notifications_screen.dart';
import 'package:giasu_vn/screen/post/post_screen.dart';
import 'package:giasu_vn/screen/settings/settings_screen.dart';
import 'package:giasu_vn/widgets/dialog_error_login.dart';
import 'package:sp_util/sp_util.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.put(NavigationController());
  RxInt pageIndex = 0.obs;
  RxBool checkLogin = false.obs;
  String userType;
  String token;

  Rx<Widget> currentPage = Rx<Widget>(HomeBeforeScreen());

  // Rx<Widget> currentPage;

  @override
  void onInit() {
    print('NavigationController');
    // TODO: implement onInit
    userType = SpUtil.getString(ConstString.USER_TYPE);
    token = SpUtil.getString(ConstString.token);

    currentPage.value = token == '' ? HomeBeforeScreen() : userType == '1' ? HomeAfterParentScreen() : HomeAfterTeacherScreen();
    super.onInit();
    update();
  }

  void changePage(int index) {
    token = SpUtil.getString(ConstString.token);
    pageIndex.value = index;
    switch (index) {
      case 0:
      // if (token != '') {
        pageIndex.value = 0;
        currentPage.value = userType == '1' ? HomeAfterParentScreen() : HomeAfterTeacherScreen();
        // } else {
        //   Get.dialog(DialogError2(
        //     button1: 'Đăng nhập',
        //     button2: 'Hủy',
        //     onTapButton1: () => Get.toNamed(Routes.LOGIN),
        //     onTapButton2: () => Get.back(),
        //   ));
        // }

        break;
      case 1:
      // if (token != '') {
        pageIndex.value = 1;
        currentPage.value = MessageScreen();
        // } else {
        //   Get.dialog(DialogError2(
        //     button1: 'Đăng nhập',
        //     button2: 'Hủy',
        //     onTapButton1: () => Get.toNamed(Routes.LOGIN),
        //     onTapButton2: () => Get.back(),
        //   ));
        // }
        break;
      case 2:
        pageIndex.value = 2;
        currentPage.value = NotificationsScreen();
        break;
      case 3:
      // if (token != '') {
        pageIndex.value = 3;
        currentPage.value = SettingsScreen();
        // } else {
        //   Get.dialog(DialogError2(
        //     button1: 'Đăng nhập',
        //     button2: 'Hủy',
        //     onTapButton1: () => Get.toNamed(Routes.LOGIN),
        //     onTapButton2: () => Get.back(),
        //   ));
        // }
        break;
    }
    update();
  }
}
