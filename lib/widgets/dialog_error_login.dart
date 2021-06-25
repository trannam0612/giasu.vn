import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';

import '../routes/app_pages.dart';
import '../screen/authen/register/intro_login.dart';

class DialogErrorLogin extends StatelessWidget {
  const DialogErrorLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteFFFFFF,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimens.space20, vertical: AppDimens.space58),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Images.ic_warning),
            SizedBox(
              height: AppDimens.space16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.space40),
              child: Text(
                'Bạn cần đăng nhập để thực hiện thao tác này.',
                textAlign: TextAlign.center,
                style: AppTextStyles.regularW400(context,
                    size: AppDimens.textSize14, color: AppColors.grey686F7A),
              ),
            ),
            Divider(
              color: AppColors.grey747474,
              thickness: 0.25,
            ),
            SizedBox(
              height: 30,
              child: CustomButton2(
                color: AppColors.primary4C5BD4,
                textColor: AppColors.whiteFFFFFF,
                title: 'Đồng ý',
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SizedBox(
              height: AppDimens.space16,
            ),
            InkWell(
              onTap: () => Get.toNamed(Routes.select_type_login),
              child: Text(
                'Đăng nhập',
                style: AppTextStyles.regularW400(context,
                    size: AppDimens.textSize14, color: AppColors.primary4C5BD4),
              ),
            ),
            SizedBox(height: AppDimens.space6,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bạn chưa có tài khoản? ', style: AppTextStyles.regularW400(context, size: AppDimens.textSize14),),
                InkWell(
                  onTap: () => Get.to(IntroLoginScreen()),
                  child: Text(
                    'Đăng kí',
                    style: AppTextStyles.regularW400(context,
                        size: AppDimens.textSize14,
                        color: AppColors.secondaryF8971C),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
