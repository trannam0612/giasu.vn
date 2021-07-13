import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_invite/list_class_invited_controller.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_controller.dart';
import 'package:giasu_vn/widgets/card_class_home2.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/dialog_%20confirm.dart';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

import '../home_after_teacher_controller.dart';

class ListClassInviteScreen extends StatefulWidget {
  final String title;
  final String fee;
  final String subject;
  final String address;
  final String classId;
  final String methodTeach;
  final String date;

  const ListClassInviteScreen({
    Key key,
    this.title = 'Tìm gia sư có kinh nghiệm trên 3 năm dạy môn hoá học lớp 10',
    this.fee = '300.000 vnđ/giờ',
    this.subject = 'Hóa học lớp 10',
    this.address = 'Thanh Xuân, Hà Nội',
    this.classId = '01234',
    this.methodTeach = 'Gặp mặt',
    this.date = '05/07/2019',
  }) : super(key: key);

  @override
  _ListClassInviteScreenState createState() => _ListClassInviteScreenState();
}

class _ListClassInviteScreenState extends State<ListClassInviteScreen> {
  ScrollController _controller = ScrollController();
  ListClassInvitedController listClassInvitedController = Get.put(ListClassInvitedController());
  InformationClassController informationClassController = Get.put(InformationClassController());
  HomeAfterTeacherController homeAfterTeacherController = Get.put(HomeAfterTeacherController());
  int i = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listClassInvitedController.listPHMD = [];
    listClassInvitedController.parentInvited(1, 10);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // homeAfterController.homeParent();
        i++;
        print(i);
        listClassInvitedController.parentInvited(i, 10);
      }
    });
  }

  String convertDate(int timestamp) {
    final df = new DateFormat('dd-MM-yyyy');
    return df.format(new DateTime.fromMillisecondsSinceEpoch(timestamp*1000));

  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListClassInvitedController>(
      init: ListClassInvitedController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Lớp mời bạn dạy',
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
              homeAfterTeacherController.homeAfterTeacher(1, 10);
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.space16, vertical: AppDimens.space6),
          width: AppDimens.width,
          child: controller.listPHMD.isNotEmpty
              ? ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      SpUtil.putString(ConstString.NAME_PARENT, controller.listPHMD[index].ugsName);
                      informationClassController.detailClass(int.parse(controller.listPHMD[index].pftId), 0);
                    },
                    child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary4C5BD4, width: 0.5),
                            borderRadius: BorderRadius.circular(AppDimens.space16),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(AppDimens.padding12),
                            width: AppDimens.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppDimens.space16),
                              color: AppColors.whiteFFFFFF,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        controller.listPHMD[index].pftSummary,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize18, color: AppColors.primary4C5BD4),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppDimens.space10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      flex: 7,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                Images.ic_money,
                                                width: 16,
                                                height: 16,
                                              ),
                                              SizedBox(
                                                width: AppDimens.space8,
                                              ),
                                              Text(
                                                '${controller.listPHMD[index].pftPrice}vnđ/${controller.listPHMD[index].pftMonth}',
                                                style: AppTextStyles.regular(
                                                  context,
                                                  size: AppDimens.textSize14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: AppDimens.space6,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                Images.ic_book,
                                                width: 16,
                                                height: 16,
                                              ),
                                              SizedBox(
                                                width: AppDimens.space8,
                                              ),
                                              Text(
                                                controller.listPHMD[index].asDetailName,
                                                style: AppTextStyles.regular(
                                                  context,
                                                  size: AppDimens.textSize14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: AppDimens.space6,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                Images.ic_location,
                                                width: 16,
                                                height: 16,
                                              ),
                                              SizedBox(
                                                width: AppDimens.space8,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  '${controller.listPHMD[index].ctyDetail}, ${controller.listPHMD[index].citName}',
                                                  style: AppTextStyles.regular(
                                                    context,
                                                    size: AppDimens.textSize14,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      flex: 6,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Ngày mời:',
                                                style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.grey747474),
                                              ),
                                              SizedBox(
                                                width: AppDimens.space4,
                                              ),
                                              Text(
                                                convertDate(int.parse(controller.listPHMD[index].dayInvitationTeach)),
                                                style: AppTextStyles.regular(
                                                  context,
                                                  size: AppDimens.textSize14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: AppDimens.space6,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Mã lớp:',
                                                style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.grey747474),
                                              ),
                                              SizedBox(
                                                width: AppDimens.space6,
                                              ),
                                              Text(
                                                controller.listPHMD[index].pftId,
                                                style: AppTextStyles.regular(context, size: AppDimens.textSize14),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: AppDimens.space6,
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Hình thức:',
                                                style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.grey747474),
                                              ),
                                              SizedBox(
                                                width: AppDimens.space8,
                                              ),
                                              Text(
                                                widget.methodTeach,
                                                style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.primary4C5BD4),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppDimens.space16,
                                ),
                                Row(
                                  children: [
                                    Spacer(),
                                    SizedBox(
                                      height: 30,
                                      width: 90,
                                      child: CustomButton2(
                                        title: 'Đồng ý',
                                        color: AppColors.primary4C5BD4,
                                        onPressed: () {
                                          Get.dialog(DialogConfirm(
                                              onPressed: () {
                                                controller.acceptInviteTeach(int.parse(controller.listPHMD[index].pftId));
                                                controller.listPHMD.remove(controller.listPHMD[index]);
                                                Get.back();
                                                controller.update();
                                              },
                                            title: 'Bạn có chắc là đồng ý lời mời dạy này ?',
                                          ));
                                        },
                                        textColor: AppColors.whiteFFFFFF,
                                      ),
                                    ),
                                    SizedBox(
                                      width: AppDimens.space20,
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 90,
                                      child: CustomButton1(
                                        textColor: AppColors.black,
                                        onPressed: () {
                                          Get.dialog(DialogConfirm(
                                            onPressed: () {
                                              controller.refuseInviteTeach(int.parse(controller.listPHMD[index].pftId));
                                              controller.listPHMD.remove(controller.listPHMD[index]);
                                              Get.back();
                                              controller.update();
                                            },
                                            title: 'Bạn có chắc là từ chối lời mời dạy này ?',
                                          ));
                                        },
                                        color: AppColors.grey747474,
                                        title: 'Từ chối',
                                        backColor: AppColors.whiteFFFFFF,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                  ),
                  itemCount: controller.listPHMD.length)
              : Center(
                  child: Text(
                    'Danh sách trống',
                    style: AppTextStyles.regularW500(context, size: 20, color: AppColors.grey747474),
                  ),
                ),
        ),
      ),
    );
  }
}
