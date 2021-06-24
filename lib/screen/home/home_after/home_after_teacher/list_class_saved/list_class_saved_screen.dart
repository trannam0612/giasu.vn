import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/authen/login/login_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_saved/list_class_saved_controller.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';

class ListClassSavedScreen extends StatefulWidget {
  final String title;
  final String fee;
  final String subject;
  final String address;
  final String classId;
  final String methodTeach;
  final String date;

  const ListClassSavedScreen({
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
  _ListClassSavedScreenState createState() => _ListClassSavedScreenState();
}

class _ListClassSavedScreenState extends State<ListClassSavedScreen> {
  ScrollController _controller = ScrollController();
  LoginController loginController = Get.put(LoginController());
  ListClassSavedController listClassSavedController = Get.put(ListClassSavedController());
  HomeAfterTeacherController homeAfterTeacherController = Get.put(HomeAfterTeacherController());
  InformationClassController informationClassController = Get.put(InformationClassController());
  int i = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listClassSavedController.classSaved(1, 10);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // homeAfterController.homeParent();
        i++;
        print(i);
        listClassSavedController.classSaved(i, 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListClassSavedController>(
      init: ListClassSavedController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Lớp bạn đã lưu',
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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.space16, vertical: AppDimens.space6),
          width: AppDimens.width,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
              controller: _controller,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => InkWell(
                onTap: () => informationClassController.detailClass(int.parse(controller.listLDL[index].pftId), 0),
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
                                    controller.listLDL[index].pftSummary,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
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
                                  flex: 9,
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
                                            '${controller.listLDL[index].pftPrice} vnđ/${controller.listLDL[index].pftMonth}',
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
                                            controller.listLDL[index].asDetailName,
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
                                              '${controller.listLDL[index].ctyDetail}, ${controller.listLDL[index].citName}',
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
                                  flex: 8,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ngày lưu:',
                                            style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.grey747474),
                                          ),
                                          SizedBox(
                                            width: AppDimens.space4,
                                          ),
                                          Text(
                                            controller.listLDL[index].scDate,
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
                                            controller.listLDL[index].pftId,
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
                                            controller.listLDL[index].pftForm,
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
                                  width: 110,
                                  height: 30,
                                  child: controller.listLDL[index].checkOffer
                                      ? CustomButton1(
                                          textColor: AppColors.greyC4C4C4,
                                          color: AppColors.grey747474,
                                          title: 'Đã đề nghị',
                                          backColor: AppColors.whiteFFFFFF,
                                        )
                                      : CustomButton2(
                                          title: 'Đề nghị dạy',
                                          color: AppColors.primary4C5BD4,
                                          onPressed: () {
                                            controller.offerTeach(int.parse(controller.listLDL[index].pftId));
                                            controller.listLDL[index].checkOffer = true;
                                            controller.update();
                                          },
                                          textColor: AppColors.whiteFFFFFF,
                                        ),
                                ),
                                SizedBox(
                                  width: AppDimens.space20,
                                ),
                                SizedBox(
                                  width: 110,
                                  height: 30,
                                  child: CustomButton1(
                                    textColor: AppColors.black,
                                    onPressed: () {
                                      homeAfterTeacherController.deleteClassSaved(int.parse(controller.listLDL[index].pftId));
                                      controller.listLDL.remove(controller.listLDL[index]);
                                      controller.update();
                                    },
                                    color: AppColors.grey747474,
                                    title: 'Huỷ lưu',
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
              itemCount: controller.listLDL.length),
        ),
      ),
    );
  }
}
