import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class DialogConfirm extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const DialogConfirm({Key key, this.onPressed, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.only(right: 10, top: 20, left: 20, bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTextStyles.regularW500(context, size: AppDimens.textSize14, color: Colors.black),
            ),
            // SizedBox(height: AppDimens.space2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: onPressed,
                    child: Text(
                      'Đồng ý',
                      style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
                    )),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Huỷ bỏ',
                      style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
