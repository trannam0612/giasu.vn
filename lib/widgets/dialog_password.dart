import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';

class DialogPassword extends StatelessWidget {
  const DialogPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      insetPadding: EdgeInsets.all(AppDimens.padding16),
      child: Container(
        width: AppDimens.width,
        padding: EdgeInsets.symmetric(horizontal: AppDimens.padding20, vertical: AppDimens.height * 0.06),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.whiteFFFFFF),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              Images.img_check_green,
              width: AppDimens.width * 0.3,
            ),
            SizedBox(
              height: AppDimens.height * 0.05,
            ),
            Text(
              'Chúc mừng bạn\n thay đổi mật khẩu thành công',
              textAlign: TextAlign.center,
              style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.grey747474, lineHeight: AppDimens.textSize18),
            ),
            Divider(
              height: AppDimens.space32,
              thickness: 1,
              color: AppColors.grey747474,
            ),
            SizedBox(
              height: AppDimens.padding8,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Text(
                'Đồng ý',
                style: AppTextStyles.regularW700(context, size: AppDimens.textSize14, color: AppColors.primary4C5BD4),
              ),
            )
          ],
        ),
      ),
    );
  }
}
