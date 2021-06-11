import 'package:flutter/material.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class CustomButton1 extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Color backColor;
  final String title;
  final VoidCallback onPressed;
  final bool hasRadius;

  const CustomButton1({Key key, this.color, this.title, this.textColor, this.onPressed, this.backColor = AppColors.whiteFFFFFF, this.hasRadius = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: backColor, // background
        onPrimary: Colors.white,
        // padding: EdgeInsets.symmetric(horizontal: AppDimens.padding30, vertical: AppDimens.smallPadding10),
        side: BorderSide(width: 0.5, color: color),
          shape: hasRadius ? RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ) : RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          )
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: AppTextStyles.regularW500(context, size: AppDimens.textSize14, color: textColor),

      ),
    );
  }
}
