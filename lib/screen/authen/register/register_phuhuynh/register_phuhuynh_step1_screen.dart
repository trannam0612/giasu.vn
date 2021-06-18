import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/authen/register/register_phuhuynh/register_phuhuynh_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';

class RegisterParentStep1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPhuHuynhController>(
        init: RegisterPhuHuynhController(),
        builder: (controller) => GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              child: SafeArea(
                  child: Scaffold(
                backgroundColor: AppColors.greyf6f6f6,
                appBar: AppBar(
                  backgroundColor: AppColors.primary4C5BD4,
                  title: Text(
                    'Đăng ký',
                    style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
                  ),
                  leading: IconButton(
                    icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(AppDimens.padding16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. Thông tin đăng nhập  (Phụ huynh)',
                          style: AppTextStyles.regularW400(context, size: AppDimens.textSize18, color: AppColors.secondaryF8971C),
                        ),
                        SizedBox(
                          height: AppDimens.height * 0.07,
                        ),
                        CustomTextField(
                          textEditingController: controller.email,
                          obligatory: true,
                          error: controller.checkEmail(),
                          onPressed: () {
                            // controller.imgFromGallery();
                          },
                          title: 'Email',
                          hintText: 'nguyenvana@gmail.com',
                          isPassword: false,
                          isShowIcon: false,
                          iconSuffix: Images.ic_file_upload,
                        ),
                        SizedBox(
                          height: AppDimens.space10,
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
                          title: 'Mật khẩu',
                          textEditingController: controller.passWord,
                          hintText: 'Mật khẩu',
                          keyboardType: TextInputType.text,
                          isPassword: controller.isShowPassword,
                          iconSuffix: controller.isShowPassword ? Images.ic_eye_on : Images.ic_eye_off,
                          error: controller.checkPassword(),
                        ),
                        SizedBox(
                          height: AppDimens.space10,
                        ),
                        CustomTextField(
                          maxLine: 1,
                          isShowIcon: true,
                          obligatory: true,
                          keyboardType: TextInputType.text,
                          textEditingController: controller.rePassWord,
                          onPressed: () {
                            controller.changeValueRePassword();
                          },
                          title: 'Nhập lại mật khẩu',
                          hintText: 'Nhập lại mật khẩu',
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
                                controller.checkButtonStep1();
                              },
                              title: 'Tiếp theo',
                              textColor: AppColors.whiteFFFFFF,
                              color: AppColors.primary4C5BD4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ));
  }
}
