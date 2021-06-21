import 'package:flutter/material.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class DialogLoading extends StatelessWidget {
  const DialogLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return AlertDialog(
      insetPadding: EdgeInsets.symmetric(horizontal: AppDimens.space100),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      content: Container(
        height: height * 0.1,
        width: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.whiteFFFFFF,
              ),
            ),
            SizedBox(
              height: AppDimens.padding16,
            ),
            Text(
              'Loading...',
              style: AppTextStyles.regularW500(context, size: AppDimens.textSize12, color: AppColors.blue3D99D8),
            )
          ],
        ),
      ),
    );
  }
}
