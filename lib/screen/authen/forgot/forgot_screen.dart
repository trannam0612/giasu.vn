import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/authen/register/register_phuhuynh/register_phuhuynh_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';
import 'package:giasu_vn/screen/authen/forgot/forgot_controller.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class ForgotScreen extends StatelessWidget {
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
                child: Column(
                  children: [
                    Text(
                      'Quên mật khẩu',
                      style: AppTextStyles.regularW500(context, size: AppDimens.textSize20, color: AppColors.primary4C5BD4),
                    ),
                    SizedBox(
                      height: AppDimens.height * 0.1,
                    ),
                    Text(
                      'Vui lòng nhập địa chỉ Email của bạn chúng tôi gửi mã OTP để thục hiện thao tác lấy lại mật khẩu',
                      style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.grey282828, lineHeight: 16.41),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: AppDimens.height * 0.05,
                    ),
                    CustomTextField(
                      textEditingController: controller.email,
                      title: 'Email',
                      isTitle: true,
                      hintText: 'phuhuynh@gmail.com',
                      colorBorder: AppColors.grey747474,
                    ),
                    SizedBox(
                      height: AppDimens.height * 0.1,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: AppDimens.padding16),
                      width: AppDimens.width,
                      height: AppDimens.height * 0.07,
                      child: CustomButton2(
                        hasRadius: true,
                        onPressed: () {
                          // controller.login();
                          // controller.pass.clear();
                        },
                        title: 'Gửi về Email',
                        textColor: AppColors.whiteFFFFFF,
                        color: AppColors.primary4C5BD4,
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.height * 0.03,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Bạn đã có tài khoản? ',
                        style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Đăng nhập',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                lineHeight: AppDimens.space18,
                                color: AppColors.primary4C5BD4,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
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
