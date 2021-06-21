import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/authen/change_password/change_password_screen.dart';
import 'package:giasu_vn/screen/authen/forgot/forgot_new_password.dart';
import 'package:giasu_vn/screen/authen/forgot/forgot_screen.dart';
import 'package:giasu_vn/screen/authen/login/login_screen.dart';
import 'package:giasu_vn/screen/authen/login/select_type_login_screen.dart';
import 'package:giasu_vn/screen/authen/otp/otp_screen.dart';
import 'package:giasu_vn/screen/authen/register/register_phuhuynh/register_phuhuynh_step1_screen.dart';
import 'package:giasu_vn/screen/authen/register/register_phuhuynh/register_phuhuynh_step2_screen.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_step1_screen.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_step2_screen.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_step3_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_screen.dart';
import 'package:giasu_vn/screen/home/home_before/home_before_screen.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/checkbox_list_class.dart';
import 'package:giasu_vn/screen/information/information_parent/update_info_parent_screen.dart';
import 'package:giasu_vn/screen/information/information_teacher/update_info_teacher_step1_screen.dart';
import 'package:giasu_vn/screen/information/information_teacher/update_info_teacher_step2_screen.dart';
import 'package:giasu_vn/screen/navigation/navigation_screen.dart';
import 'package:giasu_vn/screen/notifications/notifications_screen.dart';
import 'package:giasu_vn/screen/post/post_screen.dart';
import 'package:giasu_vn/screen/settings/settings_screen.dart';
import 'package:giasu_vn/search/search_screen.dart';
import 'package:sp_util/sp_util.dart';

import 'common/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primary4C5BD4,
    ));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      getPages: AppPages.routes,
      home: SelectTypeLoginScreen(),
    );
  }
}
