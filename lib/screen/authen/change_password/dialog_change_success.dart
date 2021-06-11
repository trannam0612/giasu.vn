import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';
class DialogChangeSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(32),
      backgroundColor: AppColors.blue3D99D8,
      child: Container(
        height: AppDimens.height * 0.4,
        width: AppDimens.width * 0.3,
        padding: EdgeInsets.symmetric(vertical: AppDimens.space32, horizontal: AppDimens.space16),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppDimens.space20)),
        child: Column(
          children: [
            Image.asset(
              Images.img_check_white,
              height: AppDimens.height * 0.2,
            ),
            Spacer(),
            SizedBox(height: AppDimens.space4,),
            Text(
              'Đổi mật khẩu thành công',
              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.whiteFFFFFF),
            ),
            SizedBox(height: AppDimens.space8,),
            CustomButton2(
              title: 'OK',
              textColor: AppColors.whiteFFFFFF,
              onPressed:() {},
            )
          ],
        ),
      ),
    );
  }
}
