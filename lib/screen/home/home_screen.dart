import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giasu_vn/widgets/card_class_home.dart';
import 'package:giasu_vn/widgets/card_class_home2.dart';

import '../../common/images.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_dimens.dart';
import '../../common/theme/app_text_style.dart';
import '../../common/theme/app_text_style.dart';
import '../../common/theme/app_text_style.dart';
import '../../common/theme/app_text_style.dart';
import '../../common/theme/app_text_style.dart';
import '../../common/theme/app_text_style.dart';
import '../../common/theme/app_text_style.dart';
import '../../common/theme/app_text_style.dart';
import '../../common/theme/app_text_style.dart';
import '../../widgets/custom_search_textfield.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        body: SingleChildScrollView(
          child: Container(
            // height: height * 0.,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  image: ExactAssetImage(Images.bg_background_container)),
            ),
            padding: EdgeInsets.all(AppDimens.space16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppDimens.space10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Images.img_logo_giasu365,
                      width: 100,
                      height: 36,
                    ),
                    CustomSearchTextField(),
                  ],
                ),
                SizedBox(
                  height: AppDimens.space24,
                ),
                Text(
                  'Trang chủ',
                  style: AppTextStyles.regularW500(context,
                      size: AppDimens.textSize24, color: Colors.white),
                ),
                SizedBox(
                  height: AppDimens.space58,
                ),
                Text(
                  'Danh sách của bạn',
                  style: AppTextStyles.regularW500(context,
                      size: AppDimens.textSize16,
                      color: AppColors.whiteFFFFFF,
                      lineHeight: 19),
                ),
                SizedBox(
                  height: AppDimens.space10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Container(
                        width: 80,
                        height: 90,
                        padding: EdgeInsets.symmetric(
                            vertical: AppDimens.space10,
                            horizontal: AppDimens.space6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.whiteFFFFFF,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: Offset(2, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              Images.ic_add_friend,
                              width: 40,
                              height: 40,
                            ),
                            Text(
                              'Lớp mời bạn dạy',
                              style: AppTextStyles.regular(context,
                                  size: AppDimens.textSize10,
                                  lineHeight: AppDimens.textSize12),
                            ),
                            SizedBox(
                              height: AppDimens.space4,
                            ),
                            Text('(5)',
                                style: AppTextStyles.regular(context,
                                    color: AppColors.greyAAAAAA,
                                    size: AppDimens.textSize10,
                                    lineHeight: AppDimens.textSize12)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 90,
                      padding: EdgeInsets.symmetric(
                          vertical: AppDimens.space10,
                          horizontal: AppDimens.space6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteFFFFFF,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 3,
                            offset: Offset(2, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            Images.ic_presentation,
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            'Lớp nhận dạy',
                            style: AppTextStyles.regular(context,
                                size: AppDimens.textSize10,
                                lineHeight: AppDimens.textSize12),
                          ),
                          SizedBox(
                            height: AppDimens.space4,
                          ),
                          Text('(5)',
                              style: AppTextStyles.regular(context,
                                  color: AppColors.greyAAAAAA,
                                  size: AppDimens.textSize10,
                                  lineHeight: AppDimens.textSize12)),
                        ],
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 90,
                      padding: EdgeInsets.symmetric(
                          vertical: AppDimens.space10,
                          horizontal: AppDimens.space6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteFFFFFF,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 3,
                            offset: Offset(2, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            Images.ic_document,
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            'Lớp đề nghị dạy',
                            style: AppTextStyles.regular(context,
                                size: AppDimens.textSize10,
                                lineHeight: AppDimens.textSize12),
                          ),
                          SizedBox(
                            height: AppDimens.space4,
                          ),
                          Text('(5)',
                              style: AppTextStyles.regular(context,
                                  color: AppColors.greyAAAAAA,
                                  size: AppDimens.textSize10,
                                  lineHeight: AppDimens.textSize12)),
                        ],
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 90,
                      padding: EdgeInsets.symmetric(
                          vertical: AppDimens.space10,
                          horizontal: AppDimens.space6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteFFFFFF,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 3,
                            offset: Offset(2, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            Images.ic_like,
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            'Lớp đã lưu',
                            style: AppTextStyles.regular(context,
                                size: AppDimens.textSize10,
                                lineHeight: AppDimens.textSize12),
                          ),
                          SizedBox(
                            height: AppDimens.space4,
                          ),
                          Text('(5)',
                              style: AppTextStyles.regular(context,
                                  color: AppColors.greyAAAAAA,
                                  size: AppDimens.textSize10,
                                  lineHeight: AppDimens.textSize12)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppDimens.space20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Lớp học gần đây',
                        style: AppTextStyles.regularW500(context,
                            size: AppDimens.textSize24, lineHeight: 21)),
                    Text(
                      'xem thêm >>',
                      style: AppTextStyles.regular(context,
                          size: AppDimens.textSize14,
                          color: AppColors.grey747474,
                          lineHeight: 14),
                    )
                  ],
                ),
                Container(
                  height: AppDimens.height * 0.182,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                            child: CardClassHome(
                              title: 'Tìm gia sư dạy tiếng anh',
                              subject: 'Tiếng Anh',
                              address: 'Thanh Xuân, Hà Nội',
                              time: '1 phút trước.',
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: AppDimens.space10,
                          ),
                      itemCount: 5),
                ),
                Text('Lớp học phổ biến',
                    style: AppTextStyles.regularW500(context,
                        size: AppDimens.textSize24, lineHeight: 21)),
                SizedBox(
                  height: AppDimens.space16,
                ),
                Container(
                  height: AppDimens.height * 0.5,
                  width: AppDimens.width,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => Container(
                            child: CardClassHome2(
                              title:
                                  'tìm gia sư có kinh nghiệm trên 3 năm dạy môn...',
                              time: '2 giờ trước',
                              fee: '300.000 vnđ',
                              subject: 'Hóa học',
                              address: 'Thanh Xuân, Hà Nội',
                              classId: '01234',
                              methodTeach: 'Gặp mặt',
                              numberSuggest: '02',
                              save: false,
                              hasButton: false,
                            ),
                          ),
                      itemCount: 5),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
