import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_post_created/list_post_created_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_invited/list_teacher_invited_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_recently/list_teacher_recently_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_saved/list_teacher_saved_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_suggest/list_teacher_suggest_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_invite/list_class_invite_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_recently/list_class_recently_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_saved/list_class_saved_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_suggest/list_class_suggest_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_teaching/list_class_teaching_screen.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_screen.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/information_teacher_screen.dart';
import 'package:giasu_vn/widgets/card_class_home.dart';
import 'package:giasu_vn/widgets/card_class_home2.dart';
import 'package:giasu_vn/widgets/card_teacher_home.dart';
import 'package:giasu_vn/widgets/card_teacher_home2.dart';
import 'package:giasu_vn/widgets/custom_search_textfield.dart';

class HomeAfterParentScreen extends StatelessWidget {
  const HomeAfterParentScreen({Key key}) : super(key: key);

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
              image: DecorationImage(fit: BoxFit.fitWidth, alignment: Alignment.topCenter, image: ExactAssetImage(Images.bg_background_container)),
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
                    CustomSearchTextField(),
                  ],
                ),
                SizedBox(
                  height: AppDimens.space24,
                ),
                Text(
                  'chào mừng',
                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: Colors.white),
                ),
                SizedBox(
                  height: AppDimens.space4,
                ),
                Text(
                  'Hướng Đẹp Trai',
                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, color: Colors.white),
                ),
                SizedBox(
                  height: AppDimens.space24,
                ),
                Text(
                  'Danh sách của bạn',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.whiteFFFFFF, lineHeight: 19),
                ),
                SizedBox(
                  height: AppDimens.space10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Get.to(ListTeacherInvitedScreen()),
                      child: Container(
                        width: width * 0.2,
                        height: height * 0.13,
                        padding: EdgeInsets.symmetric(vertical: AppDimens.space10, horizontal: AppDimens.space6),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              Images.ic_add_friend,
                              width: 40,
                              height: 40,
                            ),
                            Text(
                              'Gia sư đã mời dạy',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.regular(context, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12),
                            ),
                            SizedBox(
                              height: AppDimens.space4,
                            ),
                            Text('(5)', style: AppTextStyles.regular(context, color: AppColors.greyAAAAAA, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(ListTeacherSuggested()),
                      child: Container(
                        width: width * 0.2,
                        height: height * 0.13,
                        padding: EdgeInsets.symmetric(vertical: AppDimens.space10, horizontal: AppDimens.space6),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              Images.ic_presentation,
                              width: 40,
                              height: 40,
                            ),
                            Text(
                              'Gia sư đề nghị dạy',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.regular(context, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12),
                            ),
                            SizedBox(
                              height: AppDimens.space4,
                            ),
                            Text('(5)', style: AppTextStyles.regular(context, color: AppColors.greyAAAAAA, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(ListPostCreatedScreen()),
                      child: Container(
                        width: width * 0.2,
                        height: height * 0.13,
                        padding: EdgeInsets.symmetric(vertical: AppDimens.space10, horizontal: AppDimens.space6),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              Images.ic_document,
                              width: 40,
                              height: 40,
                            ),
                            Text(
                              'Tin đã đăng',
                              textAlign: TextAlign.center,
                              style: AppTextStyles.regular(context, size: AppDimens.textSize12, lineHeight: AppDimens.textSize14),
                            ),
                            SizedBox(
                              height: AppDimens.space4,
                            ),
                            Text('(5)', style: AppTextStyles.regular(context, color: AppColors.greyAAAAAA, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(ListTeacherSaved()),
                      child: Container(
                        width: width * 0.2,
                        height: height * 0.13,
                        padding: EdgeInsets.symmetric(vertical: AppDimens.space10, horizontal: AppDimens.space6),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              Images.ic_like,
                              width: 40,
                              height: 40,
                            ),
                            Text(
                              'Gia sư đã lưu',
                              style: AppTextStyles.regular(context, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12),
                            ),
                            SizedBox(
                              height: AppDimens.space4,
                            ),
                            Text('(5)', style: AppTextStyles.regular(context, color: AppColors.greyAAAAAA, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12)),
                          ],
                        ),
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
                    Text('Gia sư gần đây', style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: 21)),
                    InkWell(
                      onTap: () => Get.to(ListTeacherRecentlyScreen()),
                      child: Text(
                        'xem thêm >>',
                        style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.grey747474, lineHeight: 14),
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
                            onTap: () => Get.to(InformationTeacherScreen()),
                            child: CardTeacherHome(
                              image: 'https://photo2.tinhte.vn/data/attachment-files/2021/01/5309917_118074852_605380860166128_3887117661275060924_n.jpg',
                              name: 'Nguyễn Văn Tuấn Anh',
                              rate: 4,
                              content: 'Với 2 năm kinh nghiệm giảng dạy cho các học sinh lớp 10.',
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: AppDimens.space12,
                          ),
                      itemCount: 5),
                ),
                Text('Gia sư phổ biến', style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: 21)),
                SizedBox(
                  height: AppDimens.space14,
                ),
                Container(
                  height: AppDimens.height * 0.5,
                  width: AppDimens.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) => CardTeacherHome2(
                      name: 'Nguyễn Văn Tuấn Anh',
                      rate: 3,
                      subject: 'Hóa học',
                      address: 'Thanh Xuân, Hà Nội',
                      image: 'https://nghesiviet.vn/storage/files/7/phuongly/phuong-ly.jpg',
                      saved: false,
                    ),
                    itemCount: 10,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
