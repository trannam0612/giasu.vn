import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_suggest/list_teacher_suggest_controller.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/information_teacher_controller.dart';
import 'package:giasu_vn/screen/post/post_screen.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_button_3.dart';
import 'package:giasu_vn/widgets/custom_textfield_box.dart';
import 'package:giasu_vn/widgets/dialog_error_login.dart';
import 'package:giasu_vn/widgets/dialog_watch_teacher.dart';
import 'package:sp_util/sp_util.dart';

import '../../../../common/theme/app_dimens.dart';
import '../../../../common/theme/app_dimens.dart';
import '../../../../common/theme/app_dimens.dart';
import '../../../../common/utils.dart';
import 'checkbox_list_class.dart';

class InformationTeacherScreen extends StatefulWidget {
  final int type;

  const InformationTeacherScreen({Key key, this.type = 0}) : super(key: key);

  @override
  _InformationTeacherScreenState createState() => _InformationTeacherScreenState();
}

class _InformationTeacherScreenState extends State<InformationTeacherScreen> {
  InformationTeacherController informationTeacherController = Get.put(InformationTeacherController());

  @override
  void initState() {
    // TODO: implement initState
    informationTeacherController.token = SpUtil.getString(ConstString.token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    HomeAfterParentController homeAfterParentController = Get.put(HomeAfterParentController());
    ListTeacherSuggestController listTeacherSuggestController = Get.put(ListTeacherSuggestController());
    return GetBuilder<InformationTeacherController>(
      init: InformationTeacherController(),
      builder: (controller) => Scaffold(
          backgroundColor: AppColors.greyf6f6f6,
          appBar: AppBar(
            title: Text(
              'Th??ng tin gia s??',
              style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
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
          body: SingleChildScrollView(
            child: Container(
              width: AppDimens.width,
              decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.fitWidth, alignment: Alignment.topCenter, image: ExactAssetImage(Images.bg_background_container)),
              ),
              padding: EdgeInsets.all(AppDimens.space16),
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimens.space14,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: controller.resultDetailTeacher.data.data.dataInfo.ugsAvatar,
                      width: 85,
                      height: 85,
                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Text(
                    controller.resultDetailTeacher.data.data.dataInfo.ugsName,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regularW700(context,
                        size: AppDimens.textSize20, color: AppColors.whiteFFFFFF, lineHeight: AppDimens.textSize24),
                  ),
                  SizedBox(
                    height: AppDimens.space6,
                  ),
                  RatingBar(
                    initialRating: 4,
                    itemSize: 15,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    ignoreGestures: true,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    ratingWidget: RatingWidget(
                      full: SvgPicture.asset(Images.ic_star),
                      empty: SvgPicture.asset(Images.ic_star_border),
                    ),
                    unratedColor: AppColors.greyAAAAAA,
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Container(
                    padding: EdgeInsets.all(AppDimens.space20),
                    width: AppDimens.width * 0.6,
                    decoration: BoxDecoration(color: AppColors.whiteFFFFFF, borderRadius: BorderRadius.circular(10), boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ]),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                Images.ic_mail,
                                width: 18,
                                height: 18,
                                color: AppColors.grey747474,
                              ),
                            ),
                            SizedBox(
                              width: AppDimens.space6,
                            ),
                            controller.resultDetailTeacher.data.data.dataInfo.checkMinusPoint
                                ? Expanded(
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Text(
                                        controller.resultDetailTeacher.data.data.dataInfo.ugsEmail,
                                        style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.black),
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        controller.token != ''
                                            ? Get.dialog(DialogWatchTeacher(
                                                point: controller.resultDetailTeacher.data.data.dataInfo.pointFree,
                                                teachId: int.parse(controller.resultDetailTeacher.data.data.dataInfo.ugsId),
                                                nameUser: controller.resultDetailTeacher.data.data.dataInfo.ugsName,
                                                ontap: () {
                                                  controller.minusPoint(int.parse(controller.resultDetailTeacher.data.data.dataInfo.ugsId));
                                                  Get.back();
                                                  controller.update();
                                                },
                                              ))
                                            : Get.dialog(DialogErrorLogin());
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: AppDimens.space4, horizontal: AppDimens.space8),
                                        decoration: BoxDecoration(color: AppColors.primary4C5BD4, borderRadius: BorderRadius.circular(5)),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            'S??? d???ng 1 ??i???m ????? xem',
                                            style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.whiteFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.space10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 18,
                              width: 18,
                              child: SvgPicture.asset(
                                Images.ic_call,
                                width: 18,
                                height: 18,
                                color: AppColors.grey747474,
                              ),
                            ),
                            SizedBox(
                              width: AppDimens.space6,
                            ),
                            controller.resultDetailTeacher.data.data.dataInfo.checkMinusPoint
                                ? Text(
                                    controller.resultDetailTeacher.data.data.dataInfo.ugsPhone,
                                    style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.black),
                                  )
                                : Expanded(
                                    child: InkWell(
                                      onTap: () => controller.token != ''
                                          ? Get.dialog(DialogWatchTeacher(
                                              teachId: int.parse(controller.resultDetailTeacher.data.data.dataInfo.ugsId),
                                              nameUser: controller.resultDetailTeacher.data.data.dataInfo.ugsName,
                                              ontap: () {
                                                controller.minusPoint(int.parse(controller.resultDetailTeacher.data.data.dataInfo.ugsId));
                                                Get.back();
                                                controller.update();
                                              },
                                            ))
                                          : Get.dialog(DialogErrorLogin()),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: AppDimens.space4, horizontal: AppDimens.space8),
                                        decoration: BoxDecoration(color: AppColors.primary4C5BD4, borderRadius: BorderRadius.circular(5)),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text(
                                            'S??? d???ng 1 ??i???m ????? xem',
                                            style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.whiteFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Text(
                    'Gi???i thi???u chung',
                    style: AppTextStyles.regularW500(context, size: AppDimens.textSize20),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Container(
                    width: AppDimens.width,
                    padding: EdgeInsets.all(AppDimens.space14),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.whiteFFFFFF),
                    child: Text(
                      controller.resultDetailTeacher.data.data.dataInfo.ugsAboutUs,
                      style: AppTextStyles.regularW400(context,
                          size: AppDimens.textSize14, color: AppColors.grey747474, lineHeight: AppDimens.textSize18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Text(
                    'Th??ng tin c?? nh??n',
                    style: AppTextStyles.regularW500(context, size: AppDimens.textSize20),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: AppDimens.space8),
                    decoration: BoxDecoration(color: AppColors.whiteFFFFFF, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Gi???i t??nh:',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                              ),
                              Text(
                                controller.resultDetailTeacher.data.data.dataInfo.ugsGender == ''
                                    ? 'Ch??a c???p nh???t'
                                    : controller.resultDetailTeacher.data.data.dataInfo.ugsGender,
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ng??y sinh:',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                              ),
                              Text(
                                controller.resultDetailTeacher.data.data.dataInfo.ugsBrithday == ''
                                    ? 'Ch??a c???p nh???t'
                                    : controller.resultDetailTeacher.data.data.dataInfo.ugsBrithday,
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Text(
                                  '?????a ch???:',
                                  style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                ),
                              ),
                              Container(
                                width: AppDimens.width * 0.6,
                                child: Text(
                                  controller.resultDetailTeacher.data.data.dataInfo.ugsAddress == ''
                                      ? 'Ch??a c???p nh???t'
                                      : controller.resultDetailTeacher.data.data.dataInfo.ugsAddress,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                  style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'T??nh tr???ng h??n nh??n:',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                              ),
                              Text(
                                controller.resultDetailTeacher.data.data.dataInfo.ugsMarriage == ''
                                    ? 'Ch??a c???p nh???t'
                                    : controller.resultDetailTeacher.data.data.dataInfo.ugsMarriage,
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Text(
                    'Th??ng tin gi???ng d???y',
                    style: AppTextStyles.regularW500(context, size: AppDimens.textSize20),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: AppDimens.space8),
                    decoration: BoxDecoration(color: AppColors.whiteFFFFFF, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ki???u gia s??:',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                              ),
                              Text(
                                controller.resultDetailTeacher.data.data.dataInfo.nametype == ''
                                    ? 'Ch??a c???p nh???t'
                                    : controller.resultDetailTeacher.data.data.dataInfo.nametype,
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'M??n h???c gi???ng d???y:',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                              ),
                              Text(
                                controller.resultDetailTeacher.data.data.dataInfo.asDetailName.join('\n') == ''
                                    ? 'Ch??a c???p nh???t'
                                    : controller.resultDetailTeacher.data.data.dataInfo.asDetailName.join('\n'),
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: 20),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Khu v???c gi???ng d???y:',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                              ),
                              Text(
                                '${controller.resultDetailTeacher.data.data.dataInfo.cityCouName.join(',\n')},\n ${controller.resultDetailTeacher.data.data.dataInfo.cityName}' ==
                                        ''
                                    ? 'Ch??a c???p nh???t'
                                    : '${controller.resultDetailTeacher.data.data.dataInfo.cityCouName.join(',\n')},\n ${controller.resultDetailTeacher.data.data.dataInfo.cityName}',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: 20),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'L???p h???c gi???ng d???y:',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                              ),
                              Text(
                                controller.resultDetailTeacher.data.data.dataInfo.ctName == ''
                                    ? 'Ch??a c???p nh???t'
                                    : controller.resultDetailTeacher.data.data.dataInfo.ctName,
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'H??nh th???c gi???ng d???y:',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                              ),
                              Text(
                                controller.resultDetailTeacher.data.data.dataInfo.ugsFormality == ''
                                    ? 'Ch??a c???p nh???t'
                                    : controller.resultDetailTeacher.data.data.dataInfo.ugsFormality,
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'H???c ph?? gi???ng d???y:',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                              ),
                              Text(
                                (controller.resultDetailTeacher.data.data.dataInfo.ugsUnitPrice == '0'
                                            ? '${controller.resultDetailTeacher.data.data.dataInfo.ugsSalary} vn??/\n${controller.resultDetailTeacher.data.data.dataInfo.ugsMonth}'
                                            : '${controller.resultDetailTeacher.data.data.dataInfo.ugsUnitPrice} vn??/${controller.resultDetailTeacher.data.data.dataInfo.ugsMonth}') ==
                                        ''
                                    ? 'Ch??a c???p nh???t'
                                    : controller.resultDetailTeacher.data.data.dataInfo.ugsUnitPrice == '0'
                                        ? '${controller.resultDetailTeacher.data.data.dataInfo.ugsSalary} vn??/\n${controller.resultDetailTeacher.data.data.dataInfo.ugsMonth}'
                                        : '${controller.resultDetailTeacher.data.data.dataInfo.ugsUnitPrice} vn??/${controller.resultDetailTeacher.data.data.dataInfo.ugsMonth}',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Text(
                    'L???ch h???c c?? th??? d???y',
                    style: AppTextStyles.regularW500(context, size: AppDimens.textSize20),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.space10),
                      color: AppColors.whiteFFFFFF,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: AppDimens.smallPadding10),
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          controller.listbuoiday[index].thu,
                                          textAlign: TextAlign.center,
                                          style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.black),
                                        ),
                                        Spacer(),
                                        CustomButton3(
                                          title: 'S??ng',
                                          onPressed: () {
                                            // controller.listbuoiday[index].sang = controller.listbuoiday[index].sang;
                                            // controller.update();
                                          },
                                          color: controller.listbuoiday[index].sang == '1' ? AppColors.secondaryF8971C : AppColors.whiteFFFFFF,
                                          textColor: controller.listbuoiday[index].sang == '1' ? AppColors.whiteFFFFFF : AppColors.grey747474,
                                          hasSide: controller.listbuoiday[index].sang == '1' ? false : true,
                                        ),
                                        SizedBox(
                                          width: AppDimens.padding20,
                                        ),
                                        CustomButton3(
                                          title: 'Chi???u',
                                          onPressed: () {
                                            // controller.listbuoiday[index].chieu = !controller.listbuoiday[index].chieu;
                                            // controller.update();
                                          },
                                          color: controller.listbuoiday[index].chieu == '1' ? AppColors.secondaryF8971C : AppColors.whiteFFFFFF,
                                          textColor: controller.listbuoiday[index].chieu == '1' ? AppColors.whiteFFFFFF : AppColors.grey747474,
                                          hasSide: controller.listbuoiday[index].chieu == '1' ? false : true,
                                        ),
                                        SizedBox(
                                          width: AppDimens.padding20,
                                        ),
                                        CustomButton3(
                                          title: 'T???i',
                                          onPressed: () {
                                            // controller.listbuoiday[index].toi = !controller.listbuoiday[index].toi;
                                            // controller.update();
                                          },
                                          color: controller.listbuoiday[index].toi == '1' ? AppColors.secondaryF8971C : AppColors.whiteFFFFFF,
                                          textColor: controller.listbuoiday[index].toi == '1' ? AppColors.whiteFFFFFF : AppColors.grey747474,
                                          hasSide: controller.listbuoiday[index].toi == '1' ? false : true,
                                        ),
                                      ],
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: AppDimens.space10,
                                    ),
                                itemCount: controller.listbuoiday.length),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Text(
                    '????nh gi??',
                    style: AppTextStyles.regularW500(context, size: AppDimens.textSize20),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: AppDimens.space16, horizontal: AppDimens.space20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.space10),
                      color: AppColors.whiteFFFFFF,
                    ),
                    child: Column(
                      children: [
                        RatingBar(
                          initialRating: 4,
                          itemSize: 20,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 10.0),
                          ratingWidget: RatingWidget(
                            full: SvgPicture.asset(Images.ic_star),
                            empty: SvgPicture.asset(Images.ic_star_border),
                          ),
                          unratedColor: AppColors.greyAAAAAA,
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          height: AppDimens.space28,
                        ),
                        CustomTextFieldBox(
                          title: '',
                          hintText: 'Vi???t ????nh gi??',
                          hasTitle: false,
                        ),
                        SizedBox(
                          height: AppDimens.space16,
                        ),
                        SizedBox(
                          width: AppDimens.width,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.primary4C5BD4,
                                // background
                                onPrimary: AppColors.primary4C5BD4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                )),
                            onPressed: () {},
                            child: Text(
                              '????nh gi??',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.whiteFFFFFF),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.space28,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: 0,
                          itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.symmetric(vertical: AppDimens.space16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: AppColors.greyC4C4C4.withOpacity(0.25),
                                      spreadRadius: 0,
                                      blurRadius: 9,
                                      offset: Offset(0, 2), // changes position of shadow
                                    ),
                                  ]),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(80),
                                    child: CachedNetworkImage(
                                      imageUrl: 'https://i.pinimg.com/originals/06/3c/4b/063c4b41c58c86750a6a8c40a9219d7a.jpg',
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                        child: CircularProgressIndicator(value: downloadProgress.progress),
                                      ),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: AppDimens.space12,
                                        ),
                                        Text(
                                          'Nguy???n Th??? A',
                                          style: AppTextStyles.regularW700(context, size: AppDimens.textSize16),
                                        ),
                                        SizedBox(
                                          width: AppDimens.space12,
                                        ),
                                        RatingBar(
                                          initialRating: 4,
                                          itemSize: 10,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemCount: 5,
                                          ignoreGestures: true,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                                          ratingWidget: RatingWidget(
                                            full: SvgPicture.asset(Images.ic_star),
                                            empty: SvgPicture.asset(Images.ic_star_border),
                                          ),
                                          unratedColor: AppColors.greyAAAAAA,
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppDimens.space4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: AppDimens.space12),
                                      child: Text(
                                        '50 ng??y tr?????c',
                                        style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppDimens.space18,
                                    ),
                                    Container(
                                      width: AppDimens.width * 0.65,
                                      child: Text(
                                        'M??nh r???t h??i l??ng l??ng c?? gia s?? n??y, c?? d???y r???t nhi???t t??nh, b??y gi??? con t??i h???c ???? theo k???p...',
                                        softWrap: true,
                                        textAlign: TextAlign.left,
                                        style: AppTextStyles.regularW400(context,
                                            size: AppDimens.textSize14, lineHeight: AppDimens.textSize16, color: AppColors.grey747474),
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppDimens.space14,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Row(
                                        children: [
                                          Text(
                                            '1 ph???n h???i',
                                            style: AppTextStyles.regularW700(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),
                                          ),
                                          SizedBox(
                                            width: AppDimens.space6,
                                          ),
                                          SvgPicture.asset(Images.ic_arrow_down),
                                          SizedBox(
                                            height: AppDimens.space14,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppDimens.space16,
                                    ),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(80),
                                          child: CachedNetworkImage(
                                            imageUrl: 'https://i.pinimg.com/originals/06/3c/4b/063c4b41c58c86750a6a8c40a9219d7a.jpg',
                                            height: 38,
                                            width: 38,
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                              child: CircularProgressIndicator(value: downloadProgress.progress),
                                            ),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppDimens.space8,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nguy???n V??n Tu???n Anh',
                                              style: AppTextStyles.regularW700(context, size: AppDimens.textSize14),
                                            ),
                                            SizedBox(
                                              height: AppDimens.space2,
                                            ),
                                            Text(
                                              '50 ng??y tr?????c',
                                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),
                                            ),
                                            Text('C???m ??n c?? ???? quan t??m.'),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          separatorBuilder: (context, index) => Divider(
                            color: AppColors.grey747474,
                            thickness: 0.15,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  widget.type == 5
                      ? Container()
                      : widget.type == 0
                          ? Row(
                              children: [
                                Spacer(),
                                SizedBox(
                                  width: 130,
                                  height: 30,
                                  child: CustomButton2(
                                    color: AppColors.primary4C5BD4,
                                    hasRadius: true,
                                    textColor: AppColors.whiteFFFFFF,
                                    onPressed: () {
                                      print('controller.numberPost');
                                      print(controller.numberPost);
                                      if (controller.token != '') {
                                        controller.numberPost == '0' ? Utils.showToast('B???n ch??a c?? l???p. Vui l??ng t???o l???p') : print('');

                                        controller.numberPost != '0'
                                            ? Get.dialog(CheckboxListClass(
                                                name: controller.resultDetailTeacher.data.data.dataInfo.ugsName,
                                                imageUrl: controller.resultDetailTeacher.data.data.dataInfo.ugsAvatar,
                                                idGS: controller.resultDetailTeacher.data.data.dataInfo.ugsId,
                                              ))
                                            : Get.to(PostScreen());
                                      } else {
                                        Get.dialog(DialogErrorLogin());
                                      }
                                    },
                                    title: 'M???i d???y',
                                  ),
                                ),
                                SizedBox(
                                  width: AppDimens.space6,
                                ),
                                SizedBox(
                                  width: 130,
                                  height: 30,
                                  child: CustomButton1(
                                    title: controller.resultDetailTeacher.data.data.dataInfo.checkSave ? 'B??? L??u' : 'L??u',
                                    color: AppColors.grey747474,
                                    textColor: AppColors.black,
                                    hasRadius: true,
                                    backColor: AppColors.whiteFFFFFF,
                                    onPressed: () {
                                      if (controller.token != '') {
                                        if (!controller.resultDetailTeacher.data.data.dataInfo.checkSave) {
                                          controller.resultDetailTeacher.data.data.dataInfo.checkSave = true;
                                          homeAfterParentController.saveTutor(int.parse(controller.resultDetailTeacher.data.data.dataInfo.ugsId));
                                          controller.update();
                                        } else {
                                          controller.resultDetailTeacher.data.data.dataInfo.checkSave = false;
                                          homeAfterParentController
                                              .deleteTutorSaved(int.parse(controller.resultDetailTeacher.data.data.dataInfo.ugsId));
                                          controller.update();
                                        }
                                      } else {
                                        Get.dialog(DialogErrorLogin());
                                      }
                                    },
                                  ),
                                ),
                                Spacer(),
                              ],
                            )
                          : controller.acepted
                              ? Container()
                              : Column(
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text: '${controller.resultDetailTeacher.data.data.dataInfo.ugsName}',
                                          style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, lineHeight: 24),
                                          children: [
                                            TextSpan(
                                              text: ' ???? ????? ngh??? d???y l???p\n',
                                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: 24),
                                            ),
                                            TextSpan(
                                              text: SpUtil.getString(ConstString.NAME_CLASS),
                                              style: AppTextStyles.regularW500(context,
                                                  size: AppDimens.textSize16, color: AppColors.primary4C5BD4, lineHeight: 24),
                                            )
                                          ]),
                                    ),
                                    SizedBox(
                                      height: AppDimens.space10,
                                    ),
                                    Row(
                                      children: [
                                        Spacer(),
                                        SizedBox(
                                          width: 130,
                                          height: 30,
                                          child: CustomButton2(
                                            color: AppColors.primary4C5BD4,
                                            hasRadius: true,
                                            textColor: AppColors.whiteFFFFFF,
                                            onPressed: () {
                                              listTeacherSuggestController.acceptOffer(
                                                  int.parse(controller.resultDetailTeacher.data.data.dataInfo.ugsId),
                                                  int.parse(SpUtil.getString(ConstString.ID_CLASS)));
                                              controller.acepted = true;
                                              controller.update();
                                            },
                                            title: '?????ng ??',
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppDimens.space6,
                                        ),
                                        SizedBox(
                                          width: 130,
                                          height: 30,
                                          child: CustomButton1(
                                            title: 'T??? ch???i',
                                            color: AppColors.grey747474,
                                            textColor: AppColors.black,
                                            hasRadius: true,
                                            backColor: AppColors.whiteFFFFFF,
                                            onPressed: () {
                                              listTeacherSuggestController.refuseOffer(
                                                  int.parse(controller.resultDetailTeacher.data.data.dataInfo.ugsId),
                                                  int.parse(SpUtil.getString(ConstString.ID_CLASS)));
                                              controller.acepted = true;
                                              controller.update();
                                            },
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ],
                                )
                ],
              ),
            ),
          )),
    );
  }
}
