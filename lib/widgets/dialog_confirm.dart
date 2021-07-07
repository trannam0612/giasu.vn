import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class DialogConfirm extends StatelessWidget {
  final String title;
  final String titleButton1;
  final String titleButton2;
  final VoidCallback onTap;

  const DialogConfirm({Key key, this.onTap, this.title, this.titleButton1, this.titleButton2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: AppDimens.space30),
      backgroundColor: AppColors.whiteFFFFFF,
      child: Container(
        padding: EdgeInsets.fromLTRB(AppDimens.padding16, AppDimens.space40, AppDimens.padding16, AppDimens.space32),
        width: AppDimens.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Images.ic_logout2),
            SizedBox(
              height: AppDimens.space28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.space36),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey686F7A),
              ),
            ),
            // SizedBox(
            //   height: AppDimens.space10,
            // ),
            SizedBox(
              height: AppDimens.padding16,
            ),
            Divider(
              height: 0,
              color: AppColors.grey747474,
              thickness: 1,
            ),
            TextButton(
                child: Text(
                  titleButton1,
                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
                ),
                onPressed: onTap),
            Divider(
              height: 0,
              color: AppColors.grey747474,
              thickness: 1,
            ),
            TextButton(
              child: Text(
                titleButton2,
                style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey686F7A),
              ),
              onPressed: () => Get.back(),
            )
          ],
        ),
      ),
    );
  }
}
