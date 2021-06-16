import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class DialogWatchTeacher extends StatelessWidget {
  final String nameUser;
  final int teachId;

  const DialogWatchTeacher({Key key, this.nameUser, this.teachId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: AppDimens.padding16),
      backgroundColor: AppColors.whiteFFFFFF,
      child: Container(
        padding: EdgeInsets.fromLTRB(AppDimens.padding16, AppDimens.space24, AppDimens.padding16, 0),
        width: AppDimens.width,
        height: AppDimens.height * 0.18,
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(Images.ic_error),
                SizedBox(
                  width: AppDimens.padding16,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Bạn muốn sử dụng',
                    style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, lineHeight: AppDimens.space18, color: AppColors.grey686F7A),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' 1 điểm',
                        style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, lineHeight: AppDimens.space18, color: AppColors.secondaryF8971C),
                      ),
                      TextSpan(
                        text: ' để xem\n hồ sơ',
                        style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, lineHeight: AppDimens.space18, color: AppColors.grey686F7A),
                      ),
                      TextSpan(
                        text: ' Gia Sư ',
                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize14, lineHeight: AppDimens.space18, color: AppColors.primary4C5BD4),
                      ),
                      TextSpan(
                        text: '${nameUser} ',
                        style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, lineHeight: AppDimens.space18, color: AppColors.primary4C5BD4, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: AppDimens.space10,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'HỦY BỎ',
                      style: AppTextStyles.regularW500(context, size: AppDimens.textSize14, color: AppColors.grey686F7A),
                    )),
                SizedBox(
                  width: AppDimens.space8,
                ),
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'ĐỒNG Ý',
                      style: AppTextStyles.regularW500(context, size: AppDimens.textSize14, color: AppColors.primary4C5BD4),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
