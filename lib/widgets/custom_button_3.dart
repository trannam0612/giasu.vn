import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class CustomButton3 extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String title;
  final VoidCallback onPressed;
  final bool hasSide;

  const CustomButton3({Key key, this.color = AppColors.primary1574D0, this.title, this.textColor = AppColors.whiteFFFFFF, this.onPressed, this.hasSide = false}) : super
      (key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width*0.19,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color, // background
          onPrimary: color,
          padding: EdgeInsets.symmetric(horizontal: AppDimens.padding12, vertical: AppDimens.padding12),
          side: hasSide ?  BorderSide(width: 0.5, color: AppColors.greyAAAAAA) : null,
          shadowColor: Colors.transparent
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: textColor),
        ),
      ),
    );
  }
}
