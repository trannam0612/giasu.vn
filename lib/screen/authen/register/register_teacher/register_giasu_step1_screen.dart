import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/shared/local/validate.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_txf.dart';

class RegisterGiaSuStep1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterGiaSuController>(
        init: RegisterGiaSuController(),
        builder: (controller) => GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: AppColors.greyf6f6f6,
                appBar: AppBar(
                  backgroundColor: AppColors.primary4C5BD4,
                  title: Text(
                    'Đăng ký',
                    style: AppTextStyles.regularW500(context,
                        size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
                  ),
                  leading: IconButton(
                    icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                body: Container(
                  width: AppDimens.width,
                  height: AppDimens.height,
                  padding: EdgeInsets.all(AppDimens.padding16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. Thông tin đăng nhập  (Gia sư)',
                          style: AppTextStyles.regularW400(context, size: AppDimens.textSize18, color: AppColors.secondaryF8971C),
                        ),
                        SizedBox(
                          height: AppDimens.height * 0.07,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTxf(
                          keyText: controller.formEmailKey,
                          validator: (p0) => Validate.validateEmail(p0,checkMail: controller.valueCheckEmailGS.value),
                          textEditingController: controller.email,
                          obligatory: true,
                          title: 'Email',
                          hintText: 'Nhập email',
                          isPassword: false,
                          iconSuffix: Images.ic_plus,
                          onChanged: (p0) =>controller.onChangeHandler(p0),
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTxf(
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(' ')),
                          ],
                          validator: (p0) => Validate.validatePassword(p0),
                          maxLine: 1,
                          onPressedIcon: () {
                            controller.changeValuePassword();
                          },
                          isShowIcon: true,
                          obligatory: true,
                          keyText: controller.passWordKey,
                          title: 'Mật khẩu',
                          textEditingController: controller.passWord,
                          hintText: 'Mật khẩu',
                          keyboardType: TextInputType.text,
                          isPassword: controller.isShowPassword,
                          iconSuffix: controller.isShowPassword ? Images.ic_eye_on : Images.ic_eye_off,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTxf(
                          maxLine: 1,
                          isShowIcon: true,
                          obligatory: true,
                          keyText: controller.rePassWordKey,
                          keyboardType: TextInputType.text,
                          textEditingController: controller.rePassWord,
                          onPressedIcon: () {
                            controller.changeValueRePassword();
                          },
                          validator: (p0) => Validate.validateRePassword(p0, controller.passWord.text),
                          title: 'Nhập lại mật khẩu',
                          hintText: 'Nhập lại mật khẩu',
                          isPassword: controller.isShowRePassword,
                          iconSuffix: controller.isShowPassword ? Images.ic_eye_on : Images.ic_eye_off,
                          error: controller.checkRePassword(),
                        ),
                        SizedBox(
                          height: AppDimens.space40,
                        ),
                        Center(
                          child: CustomButton2(
                            title: 'TIẾP THEO',
                            onPressed: () {
                              controller.checkButtonStep1();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
