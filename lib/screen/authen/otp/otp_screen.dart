import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/authen/register/intro_login.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import 'otp_controller.dart';

class OTPScreen extends StatelessWidget {
  final VoidCallback back;

  const OTPScreen({Key key, this.back}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OTPController>(
      init: OTPController(),
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
                    onPressed: back),
                elevation: 0,
                backgroundColor: AppColors.greyf6f6f6,
              ),
              body: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.greyf6f6f6,
                  ),
                  child: Column(
                    children: [
                      Container(
                        // height: AppDimens.height*0.8,
                        padding: EdgeInsets.all(AppDimens.padding16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Nhập mã OTP',
                              style: AppTextStyles.regularW700(context, size: AppDimens.textSize24, color: AppColors.primary4C5BD4),
                            ),
                            SizedBox(
                              height: AppDimens.height * 0.02,
                            ),
                            Container(
                                padding: EdgeInsets.all(16),
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Container(
                                        decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(12))),
                                        padding: EdgeInsets.all(10),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: AppDimens.padding16),
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8)), boxShadow: [
                                            BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 5,
                                              spreadRadius: 12,
                                              offset: Offset(0, 5),
                                            )
                                          ]),
                                          // width: double.infinity,
                                          // height: 272,
                                          child: PinInputTextField(
                                            controller: controller.otpUser,
                                            pinLength: 6,
                                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                            decoration: UnderlineDecoration(
                                              textStyle: AppTextStyles.regularW500(context, size: 30),
                                              gapSpace: AppDimens.space20,
                                              lineHeight: 1.5,
                                              colorBuilder: PinListenColorBuilder(AppColors.primary4C5BD4, AppColors.grey747474),
                                            ),
                                            // controller: controller.codeVerifyOtp2faTextEditingController,
                                            textInputAction: TextInputAction.done,
                                            autoFocus: true,
                                            keyboardType: TextInputType.number,
                                            textCapitalization: TextCapitalization.characters,
                                            onChanged: (value) {},
                                            enableInteractiveSelection: false,
                                          ),
                                        )))),
                            controller.seconds.value == 0
                                ? SizedBox(
                                    height: AppDimens.space16,
                                  )
                                : Container(),

                            Obx(
                              () => controller.seconds.value == 0
                                  ? InkWell(
                                      onTap: () {
                                        controller.startTimer();
                                        controller.reSendOTPRegister();
                                      },
                                      child: Text(
                                        'Gửi lại',
                                        style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.primary4C5BD4),
                                      ),
                                    )
                                  : Container(),
                            ),
                            SizedBox(
                              height: AppDimens.space16,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              width: AppDimens.width,
                              height: AppDimens.height * 0.07,
                              child: CustomButton2(
                                onPressed: () {
                                  controller.checkButtonOTP();
                                  // controller.pass.clear();
                                },
                                title: 'Xác nhận',
                                textColor: AppColors.whiteFFFFFF,
                                color: AppColors.primary4C5BD4,
                              ),
                            ),
                            // SizedBox(
                            //   width: AppDimens.width * 0.3,
                            //   height: AppDimens.height * 0.07,
                            //   child: CustomButton2(
                            //     onPressed: () {
                            //       controller.startTimer();
                            //       controller.reSendOTPRegister();
                            //     },
                            //     title: 'Xác nhận',
                            //     textColor: AppColors.whiteFFFFFF,
                            //     color: AppColors.primary4C5BD4,
                            //   ),
                            // ),

                            SizedBox(
                              height: AppDimens.space16,
                            ),
                            Obx(
                              () => RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Vui lòng kiểm tra Email để nhận mã OTP.\n nếu bạn chưa nhận được mã sau',
                                  style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18),
                                  children: <TextSpan>[
                                    controller.seconds.value != 0
                                        ? TextSpan(
                                            text: ' ${controller.seconds.value}s ',
                                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.secondaryF8971C),
                                          )
                                        : TextSpan(
                                            text: ' ',
                                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18),
                                          ),
                                    TextSpan(
                                      text: ' hãy ấn vào nút ',
                                      style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18),
                                    ),
                                    TextSpan(
                                      text: '"Gửi lại"',
                                      style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.primary4C5BD4),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: AppDimens.height * 0.05,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Bạn đã có tài khoản?',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.black),
                                ),
                                SizedBox(
                                  width: AppDimens.padding5,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Routes.LOGIN);
                                  },
                                  child: Text(
                                    'Đăng nhập',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4, fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
