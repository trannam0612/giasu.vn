import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';

class DialogWatchTeacher extends StatelessWidget {
  final String nameUser;
  final int teachId;
  final VoidCallback ontap;

  const DialogWatchTeacher({Key key, this.nameUser, this.teachId, this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0))
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: AppDimens.padding16),
      backgroundColor: AppColors.whiteFFFFFF,
      child: Container(
        padding: EdgeInsets.fromLTRB(AppDimens.padding16, AppDimens.space24, AppDimens.padding16, AppDimens.padding16),
        width: AppDimens.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(Images.ic_error),
            SizedBox(
              height: AppDimens.padding16,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Bạn muốn Sử dụng',
                style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, lineHeight: AppDimens.space18, color: AppColors.grey686F7A),
                children: <TextSpan>[
                  TextSpan(
                    text: ' 1 điểm\n',
                    style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, lineHeight: AppDimens.space18, color: AppColors.secondaryF8971C),
                  ),
                  TextSpan(
                    text: ' để xem hồ sơ',
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
            // SizedBox(
            //   height: AppDimens.space10,
            // ),
            SizedBox(height: AppDimens.space20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: SizedBox(
                    width: AppDimens.height * 0.4,
                    child: CustomButton1(
                      color: AppColors.grey303030,
                      textColor: AppColors.black,
                      title: 'HUỶ',
                      onPressed: () {
                        Get.back();
                      },
                      backColor: AppColors.whiteFFFFFF,
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Flexible(
                  flex: 5,
                  child: SizedBox(
                    width: AppDimens.height * 0.4,
                    child: CustomButton2(
                      title: 'ĐỒNG Ý',
                      textColor: AppColors.whiteFFFFFF,
                      onPressed: ontap,
                      color: AppColors.primary4C5BD4,
                    ),
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
