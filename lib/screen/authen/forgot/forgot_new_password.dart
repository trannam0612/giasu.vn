import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';
import 'package:giasu_vn/screen/authen/forgot/forgot_controller.dart';

class ForgotNewPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotController>(
      init: ForgotController(),
      builder: (controller) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.greyf6f6f6,
            appBar: AppBar(
              leading: IconButton(
                icon: SvgPicture.asset(
                  Images.ic_arrow_left_iphone,
                  color: AppColors.grey282828,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              elevation: 0,
              backgroundColor: AppColors.greyf6f6f6,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppDimens.padding16, vertical: AppDimens.space32),
                // margin: EdgeInsets.all(AppDimens.padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Cập nhật mật khẩu',
                      style: AppTextStyles.regularW700(context, size: AppDimens.textSize24, color: AppColors.primary4C5BD4),
                    ),
                    SizedBox(
                      height: AppDimens.height * 0.1,
                    ),
                    CustomTextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(' ')),
                      ],
                      maxLine: 1,
                      isShowIcon: true,
                      obligatory: true,
                      onPressed: () {
                        controller.changeValuePassword();
                      },
                      title: 'Nhập mật khẩu mới',
                      textEditingController: controller.passWord,
                      hintText: 'Nhập mật khẩu mới',
                      isPassword: controller.isShowPassword,
                      iconSuffix: controller.isShowPassword ? Images.ic_eye_on : Images.ic_eye_off,
                      error: controller.checkPassword(),
                    ),
                    SizedBox(
                      height: AppDimens.space20,
                    ),
                    CustomTextField(
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp(' ')),
                      ],
                      maxLine: 1,
                      isShowIcon: true,
                      obligatory: true,
                      textEditingController: controller.rePassWord,
                      onPressed: () {
                        controller.changeValueRePassword();
                      },
                      title: 'Nhập lại mật khẩu mới',
                      hintText: 'Nhập lại mật khẩu mới',
                      isPassword: controller.isShowRePassword,
                      iconSuffix: controller.isShowPassword ? Images.ic_eye_on : Images.ic_eye_off,
                      error: controller.checkRePassword(),
                    ),
                    SizedBox(
                      height: AppDimens.height * 0.07,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppDimens.space16),
                      child: SizedBox(
                        width: AppDimens.width,
                        height: AppDimens.height * 0.07,
                        child: CustomButton2(
                          onPressed: () {
                            controller.checkButton();
                          },
                          title: 'Cập nhật',
                          textColor: AppColors.whiteFFFFFF,
                          color: AppColors.primary4C5BD4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
