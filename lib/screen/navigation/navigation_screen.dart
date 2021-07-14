import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/screen/post/post_screen.dart';
import 'package:giasu_vn/widgets/dialog_error_login.dart';
import 'package:sp_util/sp_util.dart';
import 'navigation_controller.dart';

// ignore: must_be_immutable
class NavigationScreen extends StatefulWidget {
  // PageController _pageController;

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  DateTime currentBackPressTime;

  NavigationController navigationController = Get.put(NavigationController());

  @override
  void initState() {
    navigationController.userType = SpUtil.getString(ConstString.USER_TYPE);
    print('navigationController.userType');
    print(navigationController.userType);
    // TODO: implement initState
    super.initState();
  }

  Future<void> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Utils.showToast('Bấm trở về lần nữa để thoát');
      return Future.value();
    }
    return Future.value(exit(0));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      init: NavigationController(),
      builder: (controller) => WillPopScope(
        onWillPop: () => onWillPop(),
        child: Scaffold(
            floatingActionButton: controller.userType == '1'
                ? FloatingActionButton(
                    onPressed: () {
                      // Get.to(CreatePostScreen(
                      //   back: () => Get.back(),
                      // ));
                      Get.to(PostScreen());
                    },
                    child: SvgPicture.asset(
                      Images.ic_plus,
                      width: 20,
                    ),
                    backgroundColor: AppColors.secondaryF8971C,
                  )
                : null,
            body: NavigationController.to.currentPage.value,
            backgroundColor: AppColors.whiteFFFFFF,
            bottomNavigationBar: BottomNavigationBar(
              showSelectedLabels: controller.token !='' ? true : false,
              showUnselectedLabels: false,
              backgroundColor: AppColors.whiteFFFFFF,
              currentIndex: NavigationController.to.pageIndex.value,
              onTap: controller.token != '' ? NavigationController.to.changePage : null,
              items: [
                _buildBottomNavItem(
                    SvgPicture.asset(
                      Images.ic_home,
                      width: 20,
                      color: controller.pageIndex.value == 0 ? AppColors.primary4C5BD4 : AppColors.greyAAAAAA,
                    ),
                    context),
                _buildBottomNavItem(
                    SvgPicture.asset(
                      Images.ic_message,
                      width: 20,
                      color: controller.token =='' ? AppColors.greyAAAAAA : controller.pageIndex.value == 1 ? AppColors.primary4C5BD4 : AppColors.greyAAAAAA,
                    ),
                    context),
                _buildBottomNavItem(
                    SvgPicture.asset(
                      Images.ic_notification,
                      width: 20,
                      color:controller.token =='' ? AppColors.greyAAAAAA :  controller.pageIndex.value == 2 ? AppColors.primary4C5BD4 : AppColors.greyAAAAAA,
                    ),
                    context),
                _buildBottomNavItem(
                    SvgPicture.asset(
                      Images.ic_setting,
                      width: 20,
                      color: controller.token =='' ? AppColors.greyAAAAAA : controller.pageIndex.value == 3 ? AppColors.primary4C5BD4 : AppColors.greyAAAAAA,
                    ),
                    context),
              ],
            )),
      ),
    );
  }
}

BottomNavigationBarItem _buildBottomNavItem(icon, BuildContext context) {
  return BottomNavigationBarItem(
    backgroundColor: AppColors.whiteFFFFFF,
    icon: icon,
    label: '',
  );
}
