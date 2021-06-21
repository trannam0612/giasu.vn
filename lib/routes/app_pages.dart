import 'package:get/get.dart';
import 'package:giasu_vn/screen/authen/forgot/forgot_binding.dart';
import 'package:giasu_vn/screen/authen/forgot/forgot_new_password.dart';
import 'package:giasu_vn/screen/authen/forgot/forgot_screen.dart';
import 'package:giasu_vn/screen/authen/forgot/otp__forgot_screen.dart';
import 'package:giasu_vn/screen/authen/login/login_binding.dart';
import 'package:giasu_vn/screen/authen/login/login_screen.dart';
import 'package:giasu_vn/screen/authen/login/select_type_login_screen.dart';
import 'package:giasu_vn/screen/authen/otp/otp_binding.dart';
import 'package:giasu_vn/screen/authen/otp/otp_screen.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_step1_binding.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_step2_screen.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_step3_screen.dart';
import 'package:giasu_vn/screen/navigation/navigation_binding.dart';
import 'package:giasu_vn/screen/navigation/navigation_screen.dart';

class Routes {
  //authen
  static const navigation = '/navigation';
  static const LOGIN = '/login';
  static const REGISTER_TEACHER_STEP2 = '/register_teacher_step2';
  static const REGISTER_TEACHER_STEP3 = '/register_teacher_step3';
  static const email_forgot = '/email_forgot';
  static const verify_forgot = '/verify_forgot';
  static const new_password_forgot = '/new_password_forgot';
  static const verify_register = '/verify_register';
  static const select_type_login = '/select_type_login';
}

class AppPages {
  // value page
  // static const WELCOME = Routes.WELCOME;
  static const navigation = Routes.navigation;
  static const LOGIN = Routes.LOGIN;
  static const REGISTER_TEACHER_STEP2 = Routes.REGISTER_TEACHER_STEP2;
  static const REGISTER_TEACHER_STEP3 = Routes.REGISTER_TEACHER_STEP3;
  static const email_forgot = Routes.email_forgot;
  static const verify_forgot = Routes.verify_forgot;
  static const new_password_forgot = Routes.new_password_forgot;
  static const verify_register = Routes.verify_register;
  static const select_type_login = Routes.select_type_login;

  //
  //
  //
  // //PAGE
  static final routes = [
    GetPage(name: Routes.navigation, page: () => NavigationScreen(), binding: NavigationBinding()),
    GetPage(name: Routes.LOGIN, page: () => LoginScreen(), binding: LoginBinding()),
    GetPage(name: Routes.REGISTER_TEACHER_STEP2, page: () => RegisterGiaSuStep2Screen(), binding: RegisterGiaSuBinding()),
    GetPage(name: Routes.REGISTER_TEACHER_STEP3, page: () => RegisterGiaSuStep3Screen(), binding: RegisterGiaSuBinding()),
    GetPage(name: Routes.email_forgot, page: () => ForgotScreen(), binding: ForgotBinding()),
    GetPage(name: Routes.verify_forgot, page: () => OTPForgotScreen(), binding: ForgotBinding()),
    GetPage(name: Routes.new_password_forgot, page: () => ForgotNewPasswordScreen(), binding: ForgotBinding()),
    GetPage(name: Routes.verify_register, page: () => OTPScreen(), binding: OTPBinding()),
    GetPage(name: Routes.select_type_login, page: () => SelectTypeLoginScreen(), binding: LoginBinding()),
    //   GetPage(name: Routes.WELCOME, page: () => WelcomeScreen(), binding: WelcomeBinding()),
    //   //authen
    //
  ];
}
