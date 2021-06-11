import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/authen/register/register_phuhuynh/register_phuhuynh_step2_screen.dart';

class SelectProvincialPHScreen extends StatelessWidget {
  final void Function(String) onChanged;

  SelectProvincialPHScreen({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> list = ['Hà Nội', 'Hưng Yên', 'Thái Bình', 'Thanh Hóa'];
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
        padding: EdgeInsets.symmetric(vertical: AppDimens.space32, horizontal: AppDimens.padding16),
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => GestureDetector(
                  // ignore: deprecated_member_use
                  onTap: () {
                    Get.back(result: {list[index]});
                  },
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        Text(
                          list[index],
                          style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                        ),
                        Spacer(),
                        true ? SvgPicture.asset(Images.ic_check_green) : Container()
                      ],
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => Divider(
                  thickness: 1,
                  color: AppColors.black12,
                ),
            itemCount: list.length),
      ),
    ));
  }
}
