import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_screen.dart';
import 'package:giasu_vn/screen/home/home_before/home_before_screen.dart';
import 'package:giasu_vn/screen/message/message_screen.dart';
import 'package:giasu_vn/screen/notifications/notifications_screen.dart';
import 'package:giasu_vn/screen/settings/settings_screen.dart';
import 'package:sp_util/sp_util.dart';

class NavigationController extends GetxController {
  static NavigationController get to => Get.put(NavigationController());
  RxInt pageIndex = 0.obs;
  RxBool checkLogin = false.obs;
  String userType;
  String token;
  PageController pageController = PageController();
  Rx<Widget> currentPage = Rx<Widget>(HomeBeforeScreen());

  // Rx<Widget> currentPage;


  @override
  void onInit() {
    print('NavigationController');
    // TODO: implement onInit
    userType = SpUtil.getString(ConstString.USER_TYPE);
    token = SpUtil.getString(ConstString.token);

    currentPage.value = token == ''
        ? HomeBeforeScreen()
        : userType == '1'
            ? HomeAfterParentScreen()
            : HomeAfterTeacherScreen();
    super.onInit();
    update();
  }

  void changePage(int index) {
    print('index:$index');
    pageController.jumpToPage(index);
    pageIndex.value = index;
    update();
  }
}
