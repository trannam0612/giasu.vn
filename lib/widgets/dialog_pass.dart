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

class DialogErrorPass extends StatelessWidget {
  const DialogErrorPass({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteFFFFFF,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppDimens.space20, vertical: AppDimens.space20),
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
                'Mật khẩu bao gồm chữ hoa, chữ thường và ít nhất một chữ số',
                textAlign: TextAlign.center,
                style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.grey686F7A, lineHeight: 22),
              ),
            ),
            Divider(
              color: AppColors.grey747474,
              thickness: 0.25,
            ),
            SizedBox(
              height: AppDimens.space20,
            ),
            InkWell(
              onTap: () => Get.back(),
              child: Text(
                'Hủy',
                style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.primary4C5BD4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
