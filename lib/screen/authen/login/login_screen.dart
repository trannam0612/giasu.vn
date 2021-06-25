import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/authen/register/intro_login.dart';
import 'package:giasu_vn/screen/home/home_before/home_before_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_colors.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeBeforeController homeBeforeController = Get.put(HomeBeforeController());
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: SvgPicture.asset(Images.ic_arrow_left_iphone, color: AppColors.primary4C5BD4,),
              onPressed: () {
                Get.back();
              },),
              backgroundColor: AppColors.whiteFFFFFF,
              elevation: 0,
            ),
            backgroundColor: AppColors.greyf6f6f6,
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                color: AppColors.whiteFFFFFF,
              ),
              child: Column(
                children: [
                  Container(
                    // height: AppDimens.height*0.8,
                    padding: EdgeInsets.symmetric(horizontal: AppDimens.space16, vertical: AppDimens.space50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.space16),
                          child: Column(
                            children: [
                              CustomTextField(
                                onPressed: () {},
                                textEditingController: controller.email,
                                title: 'Email',
                                hintText: 'giasu365@gmail.com',
                                isPassword: false,
                                iconSuffix: Images.ic_plus,
                              ),
                              SizedBox(
                                height: AppDimens.space16,
                              ),
                              CustomTextField(
                                textEditingController: controller.pass,
                                onPressed: () {
                                  // controller.changeShowPass();
                                },
                                title: 'Mật khẩu',
                                hintText: 'Mật khẩu',
                                // isPassword: controller.isShowPass,
                                isShowIcon: true,
                                colorIcon: AppColors.greyf6f6f6,
                                iconSuffix: Images.ic_eye_off,
                              ),
                              SizedBox(
                                height: AppDimens.space32,
                              ),
                              SizedBox(
                                width: AppDimens.width,
                                height: AppDimens.height * 0.06,
                                child: CustomButton2(
                                  onPressed: () {
                                    controller.userType == '1' ? controller.loginParent() : controller.loginTeacher();
                                    controller.pass.clear();
                                  },
                                  title: 'ĐĂNG NHẬP',
                                  textColor: AppColors.whiteFFFFFF,
                                  color: AppColors.primary4C5BD4,
                                ),
                              ),
                              SizedBox(
                                height: AppDimens.space32,
                              ),
                              InkWell(
                                onTap: () {
                                  // Get.toNamed(Routes.FORGOT);
                                  Get.toNamed(Routes.email_forgot);
                                },
                                child: Text(
                                  'Quên mật khẩu ?',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474, fontStyle: FontStyle.italic),
                                ),
                              ),
                              SizedBox(
                                height: AppDimens.space8,
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
                                height: AppDimens.space20,
                              ),
                              InkWell(
                                onTap: () {
                                  homeBeforeController.homeBefore();
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
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
