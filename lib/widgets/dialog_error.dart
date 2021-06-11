import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';

class DialogError extends StatelessWidget {
  final String title;

  const DialogError(
      {Key key, this.title = 'Bạn chắc chắn từ chối lời mời này?'})
      : super(key: key);

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
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.space40),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.regularW400(context,
                    size: AppDimens.textSize14, color: AppColors.grey686F7A),
              ),
            ),
            SizedBox(
              height: AppDimens.space30,
            ),
            Row(
              children: [
                Spacer(),
                SizedBox(
                  width: 90,
                  height: 25,
                  child: CustomButton2(
                    color: AppColors.primary4C5BD4,
                    title: 'Hủy',
                    textColor: AppColors.whiteFFFFFF,
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: AppDimens.space20,
                ),
                SizedBox(
                  width: 90,
                  height: 25,
                  child: CustomButton1(
                    title: 'Đồng Ý',
                    color: AppColors.grey747474,
                    textColor: AppColors.black,
                    backColor: AppColors.whiteFFFFFF,
                  ),
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
