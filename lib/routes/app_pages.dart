import 'package:get/get.dart';
import 'package:giasu_vn/screen/authen/forgot/forgot_binding.dart';
import 'package:giasu_vn/screen/authen/forgot/forgot_screen.dart';
import 'package:giasu_vn/screen/authen/login/login_binding.dart';
import 'package:giasu_vn/screen/authen/login/login_screen.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_step1_binding.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_step2_screen.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_step3_screen.dart';

class Routes {
  //authen
  static const LOGIN = '/login';
  static const REGISTER_TEACHER_STEP2 = '/register_teacher_step2';
  static const REGISTER_TEACHER_STEP3 = '/register_teacher_step3';
  static const email_forgot = '/email_forgot';
}

class AppPages {
  // value page
  // static const WELCOME = Routes.WELCOME;
  static const LOGIN = Routes.LOGIN;
  static const REGISTER_TEACHER_STEP2 = Routes.REGISTER_TEACHER_STEP2;
  static const REGISTER_TEACHER_STEP3 = Routes.REGISTER_TEACHER_STEP3;
  static const email_forgot = Routes.email_forgot;

  //
  //
  //
  // //PAGE
  static final routes = [
    GetPage(name: Routes.LOGIN, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: Routes.REGISTER_TEACHER_STEP2, page: () => RegisterGiaSuStep2Screen(), binding: RegisterGiaSuBinding()),
    GetPage(name: Routes.REGISTER_TEACHER_STEP3, page: () => RegisterGiaSuStep3Screen(), binding: RegisterGiaSuBinding()),
    GetPage(name: Routes.email_forgot, page: () => ForgotScreen(), binding: ForgotBinding()),
    //   GetPage(name: Routes.WELCOME, page: () => WelcomeScreen(), binding: WelcomeBinding()),
    //   //authen
    //
  ];
}
