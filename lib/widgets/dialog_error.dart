import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class DialogError extends StatelessWidget {
  final String title;
  final bool richText;
  final String textButton;
  final VoidCallback onTap;

  const DialogError({Key key, this.title, this.richText, this.textButton, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(AppDimens.padding16),
        // height: AppDimens.height * 0.28,
        width: AppDimens.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppDimens.space4), color: AppColors.whiteFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Images.ic_error),
            SizedBox(
              height: AppDimens.space16,
            ),
            if (richText)
              RichText(
                text: TextSpan(
                  text: 'Lưu ý: ',
                  style: AppTextStyles.regularW700(context, size: AppDimens.textSize14, color: AppColors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Tất cả các thông tin trên là bắt buộc để sử dụng ',
                      style:
                          AppTextStyles.regularW400(context, size: AppDimens.textSize14, lineHeight: AppDimens.space18, color: AppColors.grey747474),
                    ),
                    TextSpan(
                      text: 'Giasu365.com ',
                      style:
                          AppTextStyles.regularW400(context, size: AppDimens.textSize14, lineHeight: AppDimens.space18, color: AppColors.grey747474),
                    ),
                  ],
                ),
              )
            else
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, lineHeight: AppDimens.space18, color: AppColors.grey747474),
              ),
            SizedBox(
              height: AppDimens.padding20,
            ),
            Divider(
              height: 0,
              color: AppColors.grey747474,
              thickness: 1,
            ),
            SizedBox(
              height: AppDimens.padding16,
            ),
            TextButton(
                child: Text(
                  textButton,
                  style: AppTextStyles.regularW700(context, size: AppDimens.textSize14, color: AppColors.primary4C5BD4),
                ),
                onPressed: onTap)
          ],
        ),
      ),
    );
  }
}
