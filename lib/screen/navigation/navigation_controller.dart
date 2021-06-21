import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/screen/home/home_before/home_before_screen.dart';
import 'package:giasu_vn/screen/notifications/notifications_screen.dart';
import 'package:giasu_vn/screen/post/post_screen.dart';
import 'package:giasu_vn/screen/settings/settings_screen.dart';
import 'package:sp_util/sp_util.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.put(NavigationController());
  RxInt pageIndex = 0.obs;
  RxBool checkLogin = false.obs;
  String userType;
  String token;

  Rx<Widget> currentPage = Rx<Widget>(HomeBeforeScreen());

  @override
  void onInit() {
    print('NavigationController');
    print('userType');
    print(userType);
    // TODO: implement onInit
    userType = SpUtil.getString(ConstString.USER_TYPE);

    currentPage.value = HomeBeforeScreen();
    super.onInit();
    update();
  }

  void changePage(int index) {
    token = SpUtil.getString(ConstString.token);
    pageIndex.value = index;
    print("changePage");
    switch (index) {
      case 0:
        // if (token != '') {
          pageIndex.value = 0;
          currentPage.value = HomeBeforeScreen();
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
          currentPage.value = PostScreen();
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

  void changePageOut(Widget widget) {
    print('changePageOut');
    currentPage.value = widget;
    update();
  }
}
