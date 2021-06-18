import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/screen/authen/login/login_controller.dart';
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
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:sp_util/sp_util.dart';

import '../../../../common/images.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_dimens.dart';
import '../../../../common/theme/app_text_style.dart';
import '../../../../widgets/custom_search_textfield.dart';

class HomeAfterTeacherScreen extends StatefulWidget {
  const HomeAfterTeacherScreen({Key key}) : super(key: key);

  @override
  _HomeAfterTeacherScreenState createState() => _HomeAfterTeacherScreenState();
}

class _HomeAfterTeacherScreenState extends State<HomeAfterTeacherScreen> {
  HomeAfterTeacherController homeAfterTeacherController = Get.put(HomeAfterTeacherController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // homeAfterTeacherController.homeAfterTeacher(1, 10);
  }

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<HomeAfterTeacherController>(
      init: HomeAfterTeacherController(),
      builder: (controller) => SafeArea(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        Images.img_logo_giasu365,
                        width: 100,
                        height: 45,
                      ),
                      SizedBox(height: 40, width: width * 0.6, child: CustomSearchTextField()),
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
                    SpUtil.getString(ConstString.NAME),
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
                        onTap: () => Get.to(ListClassInviteScreen()),
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
                                'Lớp mời bạn dạy',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.regular(context, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12),
                              ),
                              SizedBox(
                                height: AppDimens.space4,
                              ),
                              Text('(${controller.resultHomeAfterTeacher.data.lmd})',
                                  style: AppTextStyles.regular(context, color: AppColors.greyAAAAAA, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12)),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.to(ListClassTeachingScreen()),
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
                                'Lớp nhận dạy',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.regular(context, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12),
                              ),
                              SizedBox(
                                height: AppDimens.space4,
                              ),
                              Text('(${controller.resultHomeAfterTeacher.data.lnd})',
                                  style: AppTextStyles.regular(context, color: AppColors.greyAAAAAA, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12)),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.to(ListClassSuggestScreen()),
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
                                'Lớp đề nghị dạy',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.regular(context, size: AppDimens.textSize12, lineHeight: AppDimens.textSize14),
                              ),
                              SizedBox(
                                height: AppDimens.space4,
                              ),
                              Text('(${controller.resultHomeAfterTeacher.data.ldnd})',
                                  style: AppTextStyles.regular(context, color: AppColors.greyAAAAAA, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12)),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.to(ListClassSavedScreen()),
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
                                'Lớp đã lưu',
                                style: AppTextStyles.regular(context, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12),
                              ),
                              SizedBox(
                                height: AppDimens.space4,
                              ),
                              Text('(${controller.resultHomeAfterTeacher.data.ldl})',
                                  style: AppTextStyles.regular(context, color: AppColors.greyAAAAAA, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12)),
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
                      Text('Lớp học gần đây', style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: 21)),
                      InkWell(
                        onTap: () => Get.to(ListClassRecentlyScreen()),
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
                                onTap: () => controller.detailClass(int.parse(controller.listLHGD[index].pftId)),
                                child: CardClassHome(
                                  title: controller.listLHGD[index].pftSummary,
                                  subject: controller.listLHGD[index].asName,
                                  address: controller.listLHGD[index].citName,
                                  time: controller.timeAgo(int.parse(controller.listLHGD[index].dayPost)),
                                ),
                              ),
                          separatorBuilder: (context, index) => SizedBox(
                                width: AppDimens.space10,
                              ),
                          itemCount: controller.listLHGD.length)),
                  Text('Lớp học phổ biến', style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: 21)),
                  SizedBox(
                    height: AppDimens.space14,
                  ),
                  Container(
                      height: AppDimens.height * 0.5,
                      width: AppDimens.width,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.primary4C5BD4, width: 0.5),
                                  borderRadius: BorderRadius.circular(AppDimens.space16),
                                ),
                                margin: EdgeInsets.symmetric(vertical: AppDimens.space4, horizontal: AppDimens.space4),
                                child: CardClassHome2(
                                  title: controller.listLHPB[index].pftSummary,
                                  time: controller.timeAgo(int.parse(controller.listLHPB[index].dayPost)),
                                  fee: '${controller.listLHPB[index].pftPrice} vnđ/${controller.listLHPB[index].pftMonth}',
                                  subject: controller.listLHPB[index].asDetailName,
                                  address: controller.listLHPB[index].citName,
                                  classId: controller.listLHPB[index].pftId,
                                  methodTeach: controller.listLHPB[index].pftForm,
                                  numberSuggest: controller.listLHPB[index].countDnd,
                                  save: controller.listLHPB[index].checkSave,
                                  onTap: () {
                                    controller.listLHPB[index].checkSave = !controller.listLHPB[index].checkSave;
                                    controller.update();
                                  },
                                  hasButton: false,
                                ),
                              ),
                          itemCount: controller.listLHPB.length))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
