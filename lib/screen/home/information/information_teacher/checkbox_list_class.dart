import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';

class CheckboxListClass extends StatelessWidget {
  const CheckboxListClass({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(AppDimens.padding16),
      backgroundColor: AppColors.whiteFFFFFF,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppDimens.space30, horizontal: AppDimens.space10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Mời giáo viên',
              style: AppTextStyles.regularW700(context, size: AppDimens.textSize24, color: AppColors.primary4C5BD4),
            ),
            SizedBox(
              height: AppDimens.space24,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: 'https://nghesiviet.vn/storage/files/7/phuongly/phuong-ly.jpg',
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            SizedBox(
              height: AppDimens.space16,
            ),
            Text(
              'Hướng Đẹp Trai',
              style: AppTextStyles.regular(context, size: 16, color: AppColors.black),
            ),
            SizedBox(
              height: AppDimens.space16,
            ),
            Align(alignment: Alignment.centerLeft, child: Text('Chọn lớp mà bạn muốn mời giáo viên dạy', style: AppTextStyles.regular(context, size: 16, color: AppColors.primary4C5BD4))),
            SizedBox(
              height: AppDimens.space8,
            ),
            Container(
              height: AppDimens.height * 0.3,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(width: 0.5, color: AppColors.greyAAAAAA)),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(AppDimens.space8),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(width: 1, color: AppColors.primary4C5BD4)),
                              child: SvgPicture.asset(Images.ic_check_green),
                            ),
                            SizedBox(
                              width: AppDimens.space16,
                            ),
                            Text(
                              'Tìm gia sư dạy tiếng anh',
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.regular(context, size: AppDimens.textSize16, color: AppColors.black),
                            )
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: AppDimens.space10,
                      ),
                  itemCount: 10),
            ),
            SizedBox(height: AppDimens.space30,),
            CustomButton2(
              color: AppColors.primary4C5BD4,
              title: 'Mời gia sư',
              textColor: AppColors.whiteFFFFFF,
              onPressed: () {

              },
            )
          ],
        ),
      ),
    );
  }
}
