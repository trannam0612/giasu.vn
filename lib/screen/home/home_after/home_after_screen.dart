import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_post_created/list_post_created_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_invited/list_teacher_invited_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_recently/list_teacher_recently_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_saved/list_teacher_saved_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_suggest/list_teacher_suggest_screen.dart';
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

import '../../../common/images.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_dimens.dart';
import '../../../common/theme/app_text_style.dart';
import '../../../widgets/custom_search_textfield.dart';

class HomeAfterScreen extends StatelessWidget {
  const HomeAfterScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<HomeAfterController>(
      init: HomeAfterController(),
      builder: (controller) => SafeArea(
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
                    style: AppTextStyles.regularW500(context,
                        size: AppDimens.textSize16, color: Colors.white),
                  ),
                  SizedBox(
                    height: AppDimens.space4,
                  ),
                  Text(
                    'Hướng Đẹp Trai',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => controller.userType == '2'
                            ? Get.to(ListClassInviteScreen())
                            : Get.to(ListTeacherInvitedScreen()),
                        child: Container(
                          width: width * 0.2,
                          height: height * 0.13,
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
                                offset:
                                    Offset(2, 2), // changes position of shadow
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
                                controller.userType == '2'
                                    ? 'Lớp mời bạn dạy'
                                    : 'Gia sư đã mời dạy',
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
                      ),
                      InkWell(
                        onTap: () => controller.userType == '2'
                            ? Get.to(ListClassTeachingScreen())
                            : Get.to(ListTeacherSuggested(  )),
                        child: Container(
                          width: width * 0.2,
                          height: height * 0.13,
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
                                offset:
                                    Offset(2, 2), // changes position of shadow
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
                                controller.userType == '2'
                                    ? 'Lớp nhận dạy'
                                    : 'Gia sư đề nghị dạy',
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
                      ),
                      InkWell(
                        onTap: () =>controller.userType =='2' ?  Get.to(ListClassSuggestScreen()) : Get.to(ListPostCreatedScreen()),
                        child: Container(
                          width: width * 0.2,
                          height: height * 0.13,
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
                                offset:
                                    Offset(2, 2), // changes position of shadow
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
                                controller.userType == '2'
                                    ? 'Lớp đề nghị dạy'
                                    : 'Tin đã đăng',
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
                      ),
                      InkWell(
                        onTap: () => controller.userType == '2' ? Get.to(ListClassSavedScreen()) : Get.to(ListTeacherSaved()),
                        child: Container(
                          width: width * 0.2,
                          height: height * 0.13,
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
                                offset:
                                    Offset(2, 2), // changes position of shadow
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
                                controller.userType == '2'
                                    ? 'Lớp đã lưu'
                                    : 'Gia sư đã lưu',
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: AppDimens.space20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          controller.userType == '2'
                              ? 'Lớp học gần đây'
                              : 'Gia sư gần đây',
                          style: AppTextStyles.regularW500(context,
                              size: AppDimens.textSize24, lineHeight: 21)),
                      InkWell(
                        onTap: () => controller.userType =='2' ? Get.to(ListClassRecentlyScreen()) : Get.to(ListTeacherRecentlyScreen()),
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
                    child: controller.userType == '2'
                        ? ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () => Get.to(InformationClassScreen()),
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
                            itemCount: 5)
                        : ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () => Get.to(InformationTeacherScreen()),
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
                  Text(
                      controller.userType == '2'
                          ? 'Lớp học phổ biến'
                          : 'Gia sư phổ biến',
                      style: AppTextStyles.regularW500(context,
                          size: AppDimens.textSize24, lineHeight: 21)),
                  SizedBox(
                    height: AppDimens.space14,
                  ),
                  Container(
                    height: AppDimens.height * 0.5,
                    width: AppDimens.width,
                    child: controller.userType == '2'
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => Container(
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
                                    save: false,
                                    hasButton: false,
                                  ),
                                ),
                            itemCount: 10)
                        : ListView.builder(
                            itemBuilder: (context, index) => CardTeacherHome2(
                              name: 'Nguyễn Văn Tuấn Anh',
                              rate: 3,
                              subject: 'Hóa học',
                              address: 'Thanh Xuân, Hà Nội',
                              image:
                                  'https://nghesiviet.vn/storage/files/7/phuongly/phuong-ly.jpg',
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
      ),
    );
  }
}
