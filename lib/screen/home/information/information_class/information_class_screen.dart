import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_invite/list_class_invited_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_saved/list_class_saved_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_teaching/list_class_teaching_screen.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_button_3.dart';
import 'package:sp_util/sp_util.dart';

class InformationClassScreen extends StatelessWidget {
  final int type;

  const InformationClassScreen({Key key, this.type = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeAfterTeacherController homeAfterTeacherController = Get.put(HomeAfterTeacherController());
    ListClassSavedController listClassSavedController = Get.put(ListClassSavedController());
    ListClassInvitedController listClassInvitedController = Get.put(ListClassInvitedController());
    return GetBuilder<InformationClassController>(
      init: InformationClassController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Chi tiết lớp học',
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
            padding: EdgeInsets.all(AppDimens.space16),
            child: Column(
              children: [
                Center(
                  child: Text(
                    controller.resultDetailClass.data.data.dataInfo.pftSummary,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.regularW500(context,
                        size: AppDimens.textSize20, lineHeight: AppDimens.textSize22, color: AppColors.primary4C5BD4),
                  ),
                ),
                SizedBox(
                  height: AppDimens.space14,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: AppDimens.space10, horizontal: AppDimens.space20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.whiteFFFFFF,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Container(
                    width: AppDimens.width,
                    height: AppDimens.width * 0.2,
                    child: Center(
                      child: Text(
                        controller.resultDetailClass.data.data.dataInfo.pftDetail,
                        style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.textSize18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimens.space16,
                ),
                controller.user == '1'
                    ? Column(
                        children: [
                          Text(
                            'Nhấn để thay đổi trạng thái',
                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.greyAAAAAA),
                          ),
                          SizedBox(
                            height: AppDimens.space8,
                          ),
                          InkWell(
                            onTap: () {
                              controller.resultDetailClass.data.data.dataInfo.trangthaiLop == 'Đã có gia sư'
                                  ? controller.changeStatusPost(int.parse(controller.resultDetailClass.data.data.dataInfo.pftId), 0)
                                  : controller.changeStatusPost(int.parse(controller.resultDetailClass.data.data.dataInfo.pftId), 1);
                            },
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: AppDimens.space6, horizontal: AppDimens.space12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.5,
                                    color: AppColors.primary4C5BD4,
                                  ),
                                  color: AppColors.primary1574D0,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Trạng thái:',
                                      style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.whiteFFFFFF),
                                    ),
                                    SizedBox(
                                      width: AppDimens.space6,
                                    ),
                                    Text(
                                      controller.textChangeStatus,
                                      style: AppTextStyles.regularW700(context, size: AppDimens.textSize16, color: AppColors.secondaryF8971C),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: AppDimens.space6, horizontal: AppDimens.space12),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5,
                              color: AppColors.primary4C5BD4,
                            ),
                            color: AppColors.primary1574D0,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Trạng thái:',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.whiteFFFFFF),
                              ),
                              SizedBox(
                                width: AppDimens.space6,
                              ),
                              Text(
                                controller.textChangeStatus,
                                style: AppTextStyles.regularW700(context, size: AppDimens.textSize16, color: AppColors.secondaryF8971C),
                              )
                            ],
                          ),
                        ),
                      ),
                SizedBox(
                  height: AppDimens.space16,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: AppDimens.space8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.whiteFFFFFF,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.padding8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Địa điểm:',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                            ),
                            Text(
                              '${controller.resultDetailClass.data.data.dataInfo.ctyDetailName}, ${controller.resultDetailClass.data.data.dataInfo.cityName}',
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
                              'Học Phí:',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                            ),
                            Text(
                              '${controller.resultDetailClass.data.data.dataInfo.pftPrice} vnđ/${controller.resultDetailClass.data.data.dataInfo.pftMonth}',
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
                              'Môn học:',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                            ),
                            Text(
                              controller.resultDetailClass.data.data.dataInfo.asDetailName,
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
                              'Yêu cầu gia sư:',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                            ),
                            Text(
                              controller.resultDetailClass.data.data.dataInfo.nametype,
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
                              'Giới tính:',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                            ),
                            Text(
                              controller.resultDetailClass.data.data.dataInfo.pftGender,
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppDimens.space20,
                ),
                Text(
                  'Thông tin lớp học',
                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize20),
                ),
                SizedBox(
                  height: AppDimens.space16,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: AppDimens.space8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.whiteFFFFFF,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding14, vertical: AppDimens.padding8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mã lớp:',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                            ),
                            Text(
                              controller.resultDetailClass.data.data.dataInfo.pftId,
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
                              'Hình thức:',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                            ),
                            Text(
                              controller.resultDetailClass.data.data.dataInfo.pftForm,
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
                              'Dạy lớp:',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                            ),
                            Text(
                              controller.resultDetailClass.data.data.dataInfo.ctName,
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
                              'Số buổi:',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                            ),
                            Text(
                              controller.resultDetailClass.data.data.dataInfo.pftNbLesson,
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
                              'Số giờ:',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                            ),
                            Text(
                              controller.resultDetailClass.data.data.dataInfo.pftTime,
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
                              'Số lượng học sinh:',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                            ),
                            Text(
                              controller.resultDetailClass.data.data.dataInfo.pftNbStudent,
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDimens.space20),
                  child: Text(
                    'Số buổi có thể học',
                    style: AppTextStyles.regularW500(context, size: AppDimens.textSize20),
                  ),
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
                                        title: 'Sáng',
                                        onPressed: () {
                                          // controller.listbuoiday[index].sang = controller.listbuoiday[index].sang;
                                          // controller.update();
                                        },
                                        color: controller.listbuoiday[index].sang == "1" ? AppColors.secondaryF8971C : AppColors.whiteFFFFFF,
                                        textColor: controller.listbuoiday[index].sang == "1" ? AppColors.whiteFFFFFF : AppColors.grey747474,
                                        hasSide: controller.listbuoiday[index].sang == "1" ? false : true,
                                      ),
                                      SizedBox(
                                        width: AppDimens.padding20,
                                      ),
                                      CustomButton3(
                                        title: 'Chiều',
                                        onPressed: () {
                                          // controller.listbuoiday[index].chieu = !controller.listbuoiday[index].chieu;
                                          // controller.update();
                                        },
                                        color: controller.listbuoiday[index].chieu == "1" ? AppColors.secondaryF8971C : AppColors.whiteFFFFFF,
                                        textColor: controller.listbuoiday[index].chieu == "1" ? AppColors.whiteFFFFFF : AppColors.grey747474,
                                        hasSide: controller.listbuoiday[index].chieu == "1" ? false : true,
                                      ),
                                      SizedBox(
                                        width: AppDimens.padding20,
                                      ),
                                      CustomButton3(
                                        title: 'Tối',
                                        onPressed: () {
                                          // controller.listbuoiday[index].toi = !controller.listbuoiday[index].toi;
                                          // controller.update();
                                        },
                                        color: controller.listbuoiday[index].toi == "1" ? AppColors.secondaryF8971C : AppColors.whiteFFFFFF,
                                        textColor: controller.listbuoiday[index].toi == "1" ? AppColors.whiteFFFFFF : AppColors.grey747474,
                                        hasSide: controller.listbuoiday[index].toi == "1" ? false : true,
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
                  height: AppDimens.space18,
                ),
                controller.token != ''
                    ? type == null
                        ? Container()
                        : type == 0
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Spacer(),
                                  SizedBox(
                                    width: 140,
                                    height: 35,
                                    child: controller.resultDetailClass.data.data.dataInfo.checkOffer
                                        ? CustomButton1(
                                            color: AppColors.greyAAAAAA,
                                            title: 'Đã đề nghị',
                                            textColor: AppColors.grey686F7A,
                                            hasRadius: true,
                                          )
                                        : CustomButton2(
                                            color: AppColors.primary4C5BD4,
                                            title: 'Đề nghị dạy',
                                            textColor: AppColors.whiteFFFFFF,
                                            onPressed: () {
                                              listClassSavedController.offerTeach(int.parse(controller.resultDetailClass.data.data.dataInfo.pftId));
                                              controller.resultDetailClass.data.data.dataInfo.checkOffer = true;
                                              controller.update();
                                            },
                                            hasRadius: true,
                                          ),
                                  ),
                                  Spacer(),
                                  SizedBox(
                                    width: 140,
                                    height: 35,
                                    child: controller.resultDetailClass.data.data.dataInfo.checkSave
                                        ? CustomButton1(
                                            color: AppColors.greyAAAAAA,
                                            title: 'Bỏ Lưu',
                                            textColor: AppColors.black,
                                            onPressed: () {
                                              controller.resultDetailClass.data.data.dataInfo.checkSave = false;
                                              homeAfterTeacherController
                                                  .deleteClassSaved(int.parse(controller.resultDetailClass.data.data.dataInfo.pftId));

                                              controller.update();
                                            },
                                            hasRadius: true,
                                          )
                                        : CustomButton1(
                                            color: AppColors.greyAAAAAA,
                                            title: 'Lưu lớp học',
                                            textColor: AppColors.secondaryF8971C,
                                            onPressed: () {
                                              controller.resultDetailClass.data.data.dataInfo.checkSave = true;
                                              homeAfterTeacherController.saveClass(int.parse(controller.resultDetailClass.data.data.dataInfo.pftId));
                                              controller.update();
                                            },
                                            hasRadius: true,
                                          ),
                                  ),
                                  Spacer(),
                                ],
                              )
                            : type == 5
                                ? Container()
                                : controller.accepted
                                    ? Container()
                                    : Column(
                                        children: [
                                          RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                                text: SpUtil.getString(ConstString.NAME_PARENT),
                                                style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, lineHeight: 24),
                                                children: [
                                                  TextSpan(
                                                    text: ' đã mời bạn dạy lớp\n',
                                                    style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: 24),
                                                  ),
                                                  TextSpan(
                                                    text: controller.resultDetailClass.data.data.dataInfo.pftSummary,
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
                                                height: 35,
                                                width: 140,
                                                child: CustomButton2(
                                                  title: 'Đồng ý',
                                                  color: AppColors.primary4C5BD4,
                                                  onPressed: () {
                                                    listClassInvitedController
                                                        .acceptInviteTeach(int.parse(controller.resultDetailClass.data.data.dataInfo.pftId));
                                                    controller.accepted = true;
                                                    Get.to(ListClassTeachingScreen());
                                                    controller.update();
                                                  },
                                                  textColor: AppColors.whiteFFFFFF,
                                                ),
                                              ),
                                              Spacer(),
                                              SizedBox(
                                                height: 35,
                                                width: 140,
                                                child: CustomButton1(
                                                  textColor: AppColors.black,
                                                  onPressed: () {
                                                    listClassInvitedController
                                                        .refuseInviteTeach(int.parse(controller.resultDetailClass.data.data.dataInfo.pftId));
                                                    controller.accepted = true;
                                                    controller.update();
                                                  },
                                                  color: AppColors.grey747474,
                                                  title: 'Từ chối',
                                                  backColor: AppColors.whiteFFFFFF,
                                                ),
                                              ),
                                              Spacer(),
                                            ],
                                          ),
                                        ],
                                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
