import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_recently/list_teacher_recently_before_screen.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_recently/list_teacher_recently_screen.dart';
import 'package:giasu_vn/screen/home/home_before/home_before_controller.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_controller.dart';
import 'package:giasu_vn/search/search_screen.dart';
import 'package:giasu_vn/widgets/card_class_home2.dart';
import 'package:giasu_vn/widgets/card_teacher_home.dart';
import 'package:giasu_vn/widgets/custom_search_textfield.dart';
import 'package:giasu_vn/widgets/dialog_error_login.dart';
import 'package:intl/intl.dart';

class HomeBeforeScreen extends StatelessWidget {
  const HomeBeforeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InformationClassController informationClassController = Get.put(InformationClassController());
    String timeAgo(int timestamp) {
      var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000 * 1000);
      var now = new DateTime.now();
      var format = new DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
      var time = DateTime.parse(format.format(date));
      var diff = now.difference(time);
      if (diff.inDays > 365) return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "năm" : "năm"} trước";
      if (diff.inDays > 30) return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "tháng" : "tháng"} trước";
      if (diff.inDays > 7) return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "tuần" : "tuần"} trước";
      if (diff.inDays > 0) return "${diff.inDays} ${diff.inDays == 1 ? "ngày" : "ngày"} trước";
      if (diff.inHours > 0) return "${diff.inHours} ${diff.inHours == 1 ? "giờ" : "giờ"} trước";
      if (diff.inMinutes > 0) return "${diff.inMinutes} ${diff.inMinutes == 1 ? "phút" : "phút"} trước";
      return "vừa xong";
    }

    return GetBuilder<HomeBeforeController>(
      init: HomeBeforeController(),
      builder: (controller) => SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.greyf6f6f6,
              body: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    image:
                        DecorationImage(fit: BoxFit.fitWidth, alignment: Alignment.topCenter, image: ExactAssetImage(Images.bg_background_container)),
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
                              child: CustomSearchTextField(
                                onTap: () => Get.to(() => SearchScreen()),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space24,
                      ),
                      Text(
                        'Chào mừng',
                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: Colors.white),
                      ),
                      SizedBox(
                        height: AppDimens.space4,
                      ),
                      Text(
                        'Your Name',
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
                      InkWell(
                        onTap: () => Get.dialog(DialogErrorLogin()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: AppDimens.width * 0.2,
                              height: AppDimens.height * 0.145,
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
                                  Text('(0)',
                                      style: AppTextStyles.regular(context,
                                          color: AppColors.greyAAAAAA, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12)),
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimens.width * 0.2,
                              height: AppDimens.height * 0.145,
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
                                  Text('(0)',
                                      style: AppTextStyles.regular(context,
                                          color: AppColors.greyAAAAAA, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12)),
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimens.width * 0.2,
                              height: AppDimens.height * 0.145,
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
                                  Text('(0)',
                                      style: AppTextStyles.regular(context,
                                          color: AppColors.greyAAAAAA, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12)),
                                ],
                              ),
                            ),
                            Container(
                              width: AppDimens.width * 0.2,
                              height: AppDimens.height * 0.145,
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
                                  Text('(0)',
                                      style: AppTextStyles.regular(context,
                                          color: AppColors.greyAAAAAA, size: AppDimens.textSize12, lineHeight: AppDimens.textSize12)),
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
                          Text('Gia sư gần đây', style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: 21)),
                          InkWell(
                            onTap: () => Get.to(ListTeacherRecentlyBeforeScreen()),
                            child: Text(
                              'xem thêm >>',
                              style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.grey747474, lineHeight: 14),
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
                                  onTap: () => Get.dialog(DialogErrorLogin()),
                                  child: CardTeacherHome(
                                    image: controller.listGSGD[index].ugsAvatar,
                                    name: controller.listGSGD[index].ugsName,
                                    rate: 4,
                                    content: controller.listGSGD[index].ugsAboutUs,
                                  ),
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: AppDimens.space12,
                                ),
                            itemCount: controller.listGSGD.length),
                      ),
                      Text('Lớp học phổ biến', style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: 21)),
                      SizedBox(
                        height: AppDimens.space14,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => InkWell(
                                onTap: () => informationClassController.detailClass(int.parse(controller.listLHPB[index].pftId), null),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.primary4C5BD4, width: 0.5),
                                    borderRadius: BorderRadius.circular(AppDimens.space16),
                                  ),
                                  margin: EdgeInsets.symmetric(vertical: AppDimens.space4, horizontal: AppDimens.space4),
                                  child: CardClassHome2(
                                    title: controller.listLHPB[index].pftSummary,
                                    time: controller.listLHPB[index].dayPost,
                                    fee: '${controller.listLHPB[index].pftPrice}vnđ/${controller.listLHPB[index].pftMonth}',
                                    subject: controller.listLHPB[index].asDetailName,
                                    address: '${controller.listLHPB[index].ctyDetail}, ${controller.listLHPB[index].citName}',
                                    classId: controller.listLHPB[index].pftId,
                                    methodTeach: controller.listLHPB[index].pftForm,
                                    numberSuggest: '02',
                                    save: false,
                                    onTap: () => Get.dialog(DialogErrorLogin()),
                                    hasButton: false,
                                  ),
                                ),
                              ),
                          itemCount: controller.listLHPB.length)
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: AppColors.whiteFFFFFF,
                currentIndex: 0,
                onTap: (value) => Get.dialog(DialogErrorLogin()),
                items: [
                  _buildBottomNavItem(
                      SvgPicture.asset(
                        Images.ic_home,
                        width: 20,
                        color: AppColors.primary4C5BD4,
                      ),
                      context),
                  _buildBottomNavItem(SvgPicture.asset(Images.ic_message, width: 20, color: AppColors.greyAAAAAA), context),
                  _buildBottomNavItem(SvgPicture.asset(Images.ic_notification, width: 20, color: AppColors.greyAAAAAA), context),
                  _buildBottomNavItem(SvgPicture.asset(Images.ic_setting, width: 20, color: AppColors.greyAAAAAA), context),
                ],
              ))),
    );
  }
}

BottomNavigationBarItem _buildBottomNavItem(icon, BuildContext context) {
  return BottomNavigationBarItem(
    backgroundColor: AppColors.whiteFFFFFF,
    icon: icon,
    label: '',
  );
}
