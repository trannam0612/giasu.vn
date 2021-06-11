import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/authen/register/register_phuhuynh/register_phuhuynh_step1_screen.dart';

class IntroLoginScreen extends StatelessWidget {
  const IntroLoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.greyf6f6f6,
      appBar: AppBar(
        backgroundColor: AppColors.primary4C5BD4,
        title: Text(
          'Đăng ký',
          style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        width: AppDimens.width,
        padding: EdgeInsets.all(AppDimens.space16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: AppDimens.height * 0.1,
            ),
            Text(
              'Bạn là ai?',
              textAlign: TextAlign.center,
              style: AppTextStyles.regularW400(context, size: AppDimens.textSize20, color: AppColors.primary4C5BD4),
            ),
            SizedBox(
              height: AppDimens.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.to(RegisterParentStep1Screen()),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primary4C5BD4,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(AppDimens.space10), bottomRight: Radius.circular(AppDimens.space10))),
                    child: Column(
                      children: [
                        Image.asset(
                          Images.img_teacher,
                          width: AppDimens.width * 0.42,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Gia sư',
                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize20, color: AppColors.whiteFFFFFF),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(RegisterParentStep1Screen()),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primary4C5BD4,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(AppDimens.space10), bottomRight: Radius.circular(AppDimens.space10))),
                    child: Column(
                      children: [
                        Image.asset(
                          Images.img_parent,
                          width: AppDimens.width * 0.42,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Phụ huynh',
                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize20, color: AppColors.whiteFFFFFF),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
