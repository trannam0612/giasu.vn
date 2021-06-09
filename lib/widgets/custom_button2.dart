import 'package:flutter/material.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class CustomButton2 extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String title;
  final VoidCallback onPressed;
  final bool hasRadius;

  const CustomButton2({Key key, this.color = AppColors.primary1574D0, this.title, this.textColor = AppColors.whiteFFFFFF, this.onPressed, this.hasRadius = false,}) : super
      (key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color, // background
        onPrimary: color,
        // padding: EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.smallPadding10),
          shape: hasRadius ? RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ) : null
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: textColor),
      ),
    );
  }
}
