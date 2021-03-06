import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/authen/login/login_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_post_created/list_post_created_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_invited/list_teacher_invited_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_recently/list_teacher_recently_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_saved/list_teacher_saved_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_suggest/list_teacher_suggest_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_tutor_from_filter_point/list_tutor_from_filter_point_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_tutor_teaching/list_tutor_teaching_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_invite/list_class_invite_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_recently/list_class_recently_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_saved/list_class_saved_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_suggest/list_class_suggest_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_teaching/list_class_teaching_screen.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_screen.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/information_teacher_controller.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/information_teacher_screen.dart';
import 'package:giasu_vn/search/search_screen.dart';
import 'package:giasu_vn/widgets/card_class_home.dart';
import 'package:giasu_vn/widgets/card_class_home2.dart';
import 'package:giasu_vn/widgets/card_teacher_home.dart';
import 'package:giasu_vn/widgets/card_teacher_home2.dart';
import 'package:giasu_vn/widgets/custom_search_textfield.dart';
import 'package:sp_util/sp_util.dart';

import '../../../../common/theme/app_dimens.dart';

class HomeAfterParentScreen extends StatefulWidget {
  const HomeAfterParentScreen({Key key}) : super(key: key);

  @override
  _HomeAfterParentScreenState createState() => _HomeAfterParentScreenState();
}

class _HomeAfterParentScreenState extends State<HomeAfterParentScreen> {
  InformationTeacherController informationTeacherController =
      Get.put(InformationTeacherController());
  HomeAfterParentController homeAfterParentController =
      Get.put(HomeAfterParentController());
  LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    homeAfterParentController.homeAfterParent(1, 10);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<HomeAfterParentController>(
      init: HomeAfterParentController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.greyf6f6f6,
          body: SingleChildScrollView(
            child: controller.resultHomeAfterParent.data != null
                ? Container(
                    // height: height * 0.,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.topCenter,
                          image:
                              ExactAssetImage(Images.bg_background_container)),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: AppDimens.space10),
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
                            SizedBox(
                                height: 40,
                                width: width * 0.6,
                                child: CustomSearchTextField(
                                  onTap: () => Get.to(() => SearchScreen()),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.space24,
                        ),
                        Text(
                          'Ch??o m???ng',
                          style: AppTextStyles.regularW500(context,
                              size: AppDimens.textSize16, color: Colors.white),
                        ),
                        SizedBox(
                          height: AppDimens.space4,
                        ),
                        Text(
                          SpUtil.getString(ConstString.NAME),
                          style: AppTextStyles.regularW500(context,
                              size: AppDimens.textSize24, color: Colors.white),
                        ),
                        SizedBox(
                          height: AppDimens.space24,
                        ),
                        Text(
                          'Danh s??ch c???a b???n',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.regularW500(context,
                              size: AppDimens.textSize16,
                              color: AppColors.whiteFFFFFF,
                              lineHeight: 19),
                        ),
                        SizedBox(
                          height: AppDimens.space10,
                        ),
                        Container(
                          height: 130,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            children: [
                              InkWell(
                                onTap: () => Get.to(ListTeacherInvitedScreen()),
                                child: Container(
                                  width: width * 0.2,
                                  height: 104,
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppDimens.space10,
                                      horizontal: AppDimens.space6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.whiteFFFFFF,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: Offset(
                                            2, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                        Images.ic_add_friend,
                                        width: 40,
                                        height: 40,
                                      ),
                                      Text(
                                        'Gia s?? ???? m???i d???y',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.regular(context,
                                            size: AppDimens.textSize12,
                                            lineHeight: AppDimens.textSize12),
                                      ),
                                      SizedBox(
                                        height: AppDimens.space4,
                                      ),
                                      Text(
                                          '(${controller.resultHomeAfterParent.data.gsmd})',
                                          style: AppTextStyles.regular(context,
                                              color: AppColors.greyAAAAAA,
                                              size: AppDimens.textSize12,
                                              lineHeight:
                                                  AppDimens.textSize12)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppDimens.space10,
                              ),
                              InkWell(
                                onTap: () =>
                                    Get.to(ListTeacherSuggestedScreen()),
                                child: Container(
                                  width: width * 0.2,
                                  height: 104,
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppDimens.space10,
                                      horizontal: AppDimens.space6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.whiteFFFFFF,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: Offset(
                                            2, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                        Images.ic_presentation,
                                        width: 40,
                                        height: 40,
                                      ),
                                      Text(
                                        'Gia s?? ????? ngh??? d???y',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.regular(context,
                                            size: AppDimens.textSize12,
                                            lineHeight: AppDimens.textSize12),
                                      ),
                                      SizedBox(
                                        height: AppDimens.space4,
                                      ),
                                      Text(
                                          '(${controller.resultHomeAfterParent.data.gsdnd})',
                                          style: AppTextStyles.regular(context,
                                              color: AppColors.greyAAAAAA,
                                              size: AppDimens.textSize12,
                                              lineHeight:
                                                  AppDimens.textSize12)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppDimens.space10,
                              ),
                              InkWell(
                                onTap: () => Get.to(ListPostCreatedScreen(
                                  back: () => Get.back(),
                                )),
                                child: Container(
                                  width: width * 0.2,
                                  height: 104,
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppDimens.space10,
                                      horizontal: AppDimens.space6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.whiteFFFFFF,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: Offset(
                                            2, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                        Images.ic_document,
                                        width: 40,
                                        height: 40,
                                      ),
                                      Text(
                                        'Tin ???? ????ng',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.regular(context,
                                            size: AppDimens.textSize12,
                                            lineHeight: AppDimens.textSize14),
                                      ),
                                      SizedBox(
                                        height: AppDimens.space4,
                                      ),
                                      Text(
                                          '(${controller.resultHomeAfterParent.data.tindang})',
                                          style: AppTextStyles.regular(context,
                                              color: AppColors.greyAAAAAA,
                                              size: AppDimens.textSize12,
                                              lineHeight:
                                                  AppDimens.textSize12)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppDimens.space10,
                              ),
                              InkWell(
                                onTap: () => Get.to(ListTeacherSaved()),
                                child: Container(
                                  width: width * 0.2,
                                  height: 104,
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppDimens.space10,
                                      horizontal: AppDimens.space6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.whiteFFFFFF,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: Offset(
                                            2, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                        Images.ic_like,
                                        width: 40,
                                        height: 40,
                                      ),
                                      Text(
                                        'Gia s?? ???? l??u',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.regular(context,
                                            size: AppDimens.textSize12,
                                            lineHeight: AppDimens.textSize12),
                                      ),
                                      SizedBox(
                                        height: AppDimens.space4,
                                      ),
                                      Text(
                                          '(${controller.resultHomeAfterParent.data.gsdl})',
                                          style: AppTextStyles.regular(context,
                                              color: AppColors.greyAAAAAA,
                                              size: AppDimens.textSize12,
                                              lineHeight:
                                                  AppDimens.textSize12)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppDimens.space10,
                              ),
                              InkWell(
                                onTap: () => Get.to(ListTutorTeachingScreen()),
                                child: Container(
                                  width: width * 0.2,
                                  height: 104,
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppDimens.space10,
                                      horizontal: AppDimens.space6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.whiteFFFFFF,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: Offset(
                                            2, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                        Images.ic_teaching,
                                        width: 40,
                                        height: 40,
                                      ),
                                      Text(
                                        'Gia s?? ??ang d???y',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.regular(context,
                                            size: AppDimens.textSize12,
                                            lineHeight: AppDimens.textSize12),
                                      ),
                                      SizedBox(
                                        height: AppDimens.space4,
                                      ),
                                      Text(
                                          '(${controller.resultHomeAfterParent.data.gsdd})',
                                          style: AppTextStyles.regular(context,
                                              color: AppColors.greyAAAAAA,
                                              size: AppDimens.textSize12,
                                              lineHeight:
                                                  AppDimens.textSize12)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppDimens.space10,
                              ),
                              InkWell(
                                onTap: () =>
                                    Get.to(ListTutorFromFilterPointScreen()),
                                child: Container(
                                  width: width * 0.2,
                                  height: 104,
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppDimens.space10,
                                      horizontal: AppDimens.space6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.whiteFFFFFF,
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.black.withOpacity(0.25),
                                        spreadRadius: 0,
                                        blurRadius: 3,
                                        offset: Offset(
                                            2, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                        Images.ic_tutor,
                                        width: 40,
                                        height: 40,
                                      ),
                                      Text(
                                        'Gia s?? t??? ??i???m l???c',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.regular(context,
                                            size: AppDimens.textSize12,
                                            lineHeight: AppDimens.textSize12),
                                      ),
                                      SizedBox(
                                        height: AppDimens.space4,
                                      ),
                                      Text(
                                          '(${controller.resultHomeAfterParent.data.gstdl})',
                                          style: AppTextStyles.regular(context,
                                              color: AppColors.greyAAAAAA,
                                              size: AppDimens.textSize12,
                                              lineHeight:
                                                  AppDimens.textSize12)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppDimens.space10,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Gia s?? g???n ????y',
                                style: AppTextStyles.regularW500(context,
                                    size: AppDimens.textSize24,
                                    lineHeight: 21)),
                            InkWell(
                              onTap: () => Get.to(ListTeacherRecentlyScreen()),
                              child: Text(
                                'xem th??m >>',
                                style: AppTextStyles.regular(context,
                                    size: AppDimens.textSize14,
                                    color: AppColors.grey747474,
                                    lineHeight: 14),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 150,
                          child: ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () => informationTeacherController
                                        .detailTeacher(
                                            int.parse(controller
                                                .listGSGD[index].ugsId),
                                            0),
                                    child: CardTeacherHome(
                                      image:
                                          controller.listGSGD[index].ugsAvatar,
                                      name: controller.listGSGD[index].ugsName,
                                      rate: 4,
                                      content:
                                          controller.listGSGD[index].ugsAboutUs,
                                    ),
                                  ),
                              separatorBuilder: (context, index) => SizedBox(
                                    width: AppDimens.space12,
                                  ),
                              itemCount: controller.listGSGD.length),
                        ),
                        Text('Gia s?? n???i b???t',
                            style: AppTextStyles.regularW500(context,
                                size: AppDimens.textSize24, lineHeight: 21)),
                        SizedBox(
                          height: AppDimens.space14,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () =>
                                informationTeacherController.detailTeacher(
                                    int.parse(controller.listGSPB[index].ugsId),
                                    0),
                            child: CardTeacherHome2(
                              name: controller.listGSPB[index].ugsName,
                              rate: 3,
                              subject: controller.listGSPB[index].asDetailName
                                  .join(', '),
                              address:
                                  "${controller.listGSPB[index].cityDetailNameGs ?? ''}, ${controller.listGSPB[index].citName}",
                              image: controller.listGSPB[index].ugsAvatar,
                              saved: controller.listGSPB[index].checkSave,
                              onTap: () {
                                if (!controller.listGSPB[index].checkSave) {
                                  controller.listGSPB[index].checkSave = true;
                                  controller.saveTutor(int.parse(
                                      controller.listGSPB[index].ugsId));
                                  controller.update();
                                } else {
                                  controller.listGSPB[index].checkSave = false;
                                  controller.deleteTutorSaved(int.parse(
                                      controller.listGSPB[index].ugsId));
                                  controller.update();
                                }
                              },
                            ),
                          ),
                          itemCount: controller.listGSPB.length,
                        )
                      ],
                    ),
                  )
                : Container(
                    width: AppDimens.width,
                    height: AppDimens.height,
                    alignment: Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.whiteFFFFFF,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
