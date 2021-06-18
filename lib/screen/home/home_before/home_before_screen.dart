import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_recently/list_teacher_recently_screen.dart';
import 'package:giasu_vn/widgets/card_class_home2.dart';
import 'package:giasu_vn/widgets/card_teacher_home.dart';
import 'package:giasu_vn/widgets/custom_search_textfield.dart';
import 'package:giasu_vn/widgets/dialog_error_login.dart';

class HomeBeforeScreen extends StatelessWidget {
  const HomeBeforeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.greyf6f6f6,
            body: SingleChildScrollView(
              child: Container(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Images.img_logo_giasu365,
                          width: 100,
                          height: 45,
                        ),
                        SizedBox(
                            width: AppDimens.width * 0.6,
                            height: 36,
                            child: CustomSearchTextField()),
                      ],
                    ),
                    SizedBox(
                      height: AppDimens.space24,
                    ),
                    Text(
                      'chào mừng',
                      style: AppTextStyles.regularW500(context,
                          size: AppDimens.textSize16, color: Colors.white),
                    ),
                    SizedBox(
                      height: AppDimens.space4,
                    ),
                    Text(
                      'Your Name',
                      style: AppTextStyles.regularW500(context,
                          size: AppDimens.textSize24, color: Colors.white),
                    ),
                    SizedBox(
                      height: AppDimens.space24,
                    ),
                    Text(
                      'Danh sách của bạn',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.regularW500(context,
                          size: AppDimens.textSize16,
                          color: AppColors.whiteFFFFFF,
                          lineHeight: 19),
                    ),
                    SizedBox(
                      height: AppDimens.space10,
                    ),
                    InkWell(
                      onTap: () => Get.dialog(DialogErrorLogin()),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: AppDimens.width * 0.2,
                            height: AppDimens.height * 0.13,
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
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  Images.ic_add_friend,
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  'Lớp mời bạn dạy',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.regular(context,
                                      size: AppDimens.textSize12,
                                      lineHeight: AppDimens.textSize12),
                                ),
                                SizedBox(
                                  height: AppDimens.space4,
                                ),
                                Text('(5)',
                                    style: AppTextStyles.regular(context,
                                        color: AppColors.greyAAAAAA,
                                        size: AppDimens.textSize12,
                                        lineHeight: AppDimens.textSize12)),
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimens.width * 0.2,
                            height: AppDimens.height * 0.13,
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
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  Images.ic_presentation,
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  'Lớp nhận dạy',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.regular(context,
                                      size: AppDimens.textSize12,
                                      lineHeight: AppDimens.textSize12),
                                ),
                                SizedBox(
                                  height: AppDimens.space4,
                                ),
                                Text('(5)',
                                    style: AppTextStyles.regular(context,
                                        color: AppColors.greyAAAAAA,
                                        size: AppDimens.textSize12,
                                        lineHeight: AppDimens.textSize12)),
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimens.width * 0.2,
                            height: AppDimens.height * 0.13,
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
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  Images.ic_document,
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  'Lớp đề nghị dạy',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.regular(context,
                                      size: AppDimens.textSize12,
                                      lineHeight: AppDimens.textSize14),
                                ),
                                SizedBox(
                                  height: AppDimens.space4,
                                ),
                                Text('(5)',
                                    style: AppTextStyles.regular(context,
                                        color: AppColors.greyAAAAAA,
                                        size: AppDimens.textSize12,
                                        lineHeight: AppDimens.textSize12)),
                              ],
                            ),
                          ),
                          Container(
                            width: AppDimens.width * 0.2,
                            height: AppDimens.height * 0.13,
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
                                  offset: Offset(
                                      2, 2), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  Images.ic_like,
                                  width: 40,
                                  height: 40,
                                ),
                                Text(
                                  'Lớp đã lưu',
                                  style: AppTextStyles.regular(context,
                                      size: AppDimens.textSize12,
                                      lineHeight: AppDimens.textSize12),
                                ),
                                SizedBox(
                                  height: AppDimens.space4,
                                ),
                                Text('(5)',
                                    style: AppTextStyles.regular(context,
                                        color: AppColors.greyAAAAAA,
                                        size: AppDimens.textSize12,
                                        lineHeight: AppDimens.textSize12)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppDimens.space20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Gia sư gần đây',
                            style: AppTextStyles.regularW500(context,
                                size: AppDimens.textSize24, lineHeight: 21)),
                        InkWell(
                          onTap: () => Get.to(ListTeacherRecentlyScreen()),
                          child: Text(
                            'xem thêm >>',
                            style: AppTextStyles.regular(context,
                                size: AppDimens.textSize14,
                                color: AppColors.grey747474,
                                lineHeight: 14),
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: AppDimens.height * 0.188,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () => Get.dialog(DialogErrorLogin()),
                                child: CardTeacherHome(
                                  image:
                                      'https://photo2.tinhte.vn/data/attachment-files/2021/01/5309917_118074852_605380860166128_3887117661275060924_n.jpg',
                                  name: 'Nguyễn Văn Tuấn Anh',
                                  rate: 4,
                                  content:
                                      'Với 2 năm kinh nghiệm giảng dạy cho các học sinh lớp 10.',
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                width: AppDimens.space12,
                              ),
                          itemCount: 5),
                    ),
                    Text('Lớp học phổ biến',
                        style: AppTextStyles.regularW500(context,
                            size: AppDimens.textSize24, lineHeight: 21)),
                    SizedBox(
                      height: AppDimens.space14,
                    ),
                    Container(
                      height: AppDimens.height * 0.5,
                      width: AppDimens.width,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => InkWell(
                                onTap: () => Get.dialog(DialogErrorLogin()),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.primary4C5BD4,
                                        width: 0.5),
                                    borderRadius: BorderRadius.circular(
                                        AppDimens.space16),
                                  ),
                                  margin: EdgeInsets.symmetric(
                                      vertical: AppDimens.space4,
                                      horizontal: AppDimens.space4),
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
                                    save: true,
                                    hasButton: false,
                                  ),
                                ),
                              ),
                          itemCount: 10),
                    )
                  ],
                ),
              ),
            )));
  }
}
