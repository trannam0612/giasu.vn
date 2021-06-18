import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/authen/login/login_controller.dart';
import 'package:giasu_vn/screen/authen/login/login_screen.dart';
import 'package:giasu_vn/screen/authen/register/intro_login.dart';
import 'package:sp_util/sp_util.dart';

class SelectTypeLoginScreen extends StatelessWidget {
  const SelectTypeLoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) => Container(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.space16, vertical: AppDimens.space50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Chào mừng đến với',
                  style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                ),
                SizedBox(
                  height: AppDimens.space10,
                ),
                Image.asset(
                  Images.img_logo_giasu365,
                  color: AppColors.primary4C5BD4,
                  height: AppDimens.width * 0.14,
                ),
                SizedBox(
                  height: AppDimens.height * 0.05,
                ),
                Text(
                  'Đăng nhập',
                  style: AppTextStyles.regularW700(context, size: AppDimens.textSize24, color: AppColors.primary4C5BD4),
                ),
                SizedBox(
                  height: AppDimens.height * 0.07,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        SpUtil.putString(ConstString.USER_TYPE, '2');
                        Get.to(LoginScreen());
                      },
                      child: Container(
                        width: AppDimens.width * 0.35,
                        decoration: BoxDecoration(color: AppColors.primary4C5BD4, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(Images.img_teacher),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: AppDimens.space6),
                              child: Text(
                                'Gia sư',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize20, color: AppColors.whiteFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: AppDimens.space24,
                    ),
                    InkWell(
                      onTap: () {
                        SpUtil.putString(ConstString.USER_TYPE, '1');

                        Get.to(LoginScreen());
                      },
                      child: Container(
                        width: AppDimens.width * 0.35,
                        decoration: BoxDecoration(color: AppColors.primary4C5BD4, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(Images.img_parent),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: AppDimens.space6),
                              child: Text(
                                'Phụ huynh',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize20, color: AppColors.whiteFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimens.space32,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.email_forgot);
                  },
                  child: Text(
                    'Quên mật khẩu ?',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474, fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(
                  height: AppDimens.space16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bạn chưa có tài khoản?',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.black),
                    ),
                    SizedBox(
                      width: AppDimens.padding5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(IntroLoginScreen());
                      },
                      child: Text(
                        'Đăng ký',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.secondaryF8971C, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimens.space8,
                ),
                InkWell(
                  onTap: () {
                    // Get.toNamed(Routes.FORGOT);
                  },
                  child: Text(
                    'Truy cập không cần tài khoản',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regularW400(
                      context,
                      size: AppDimens.textSize16,
                      color: AppColors.primary4C5BD4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
