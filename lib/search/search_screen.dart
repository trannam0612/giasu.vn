import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyf6f6f6,
      appBar: AppBar(
        title: Text(
          'Bộ Lọc',
          style: AppTextStyles.regularW500(context,
              size: AppDimens.textSize24,
              lineHeight: AppDimens.textSize28,
              color: AppColors.whiteFFFFFF),
        ),
        backgroundColor: AppColors.primary4C5BD4,
        elevation: 0,
        titleSpacing: 0,
        centerTitle: false,
        leading: IconButton(
          icon: SvgPicture.asset(
            Images.ic_arrow_left_iphone,
            color: AppColors.whiteFFFFFF,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(AppDimens.space14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                    child: Text(
                  'Tìm kiếm theo tỉnh thành',
                  style: AppTextStyles.regularW400(context,
                      size: AppDimens.textSize14),
                )),
                Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),),
                  child: Text(
                    'Tìm kiếm quanh đây',
                    style: AppTextStyles.regularW400(context,
                        size: AppDimens.textSize14),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
