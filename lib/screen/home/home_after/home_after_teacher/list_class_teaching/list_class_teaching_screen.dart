import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_teaching/list_class_teaching_controller.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/dialog_%20confirm.dart';
import 'package:intl/intl.dart';

import '../home_after_teacher_controller.dart';
import '../home_after_teacher_controller.dart';

class ListClassTeachingScreen extends StatefulWidget {
  final String title;
  final String fee;
  final String subject;
  final String address;
  final String classId;
  final String methodTeach;
  final String date;
  final String status;

  const ListClassTeachingScreen({
    Key key,
    this.title = 'Tìm gia sư có kinh nghiệm trên 3 năm dạy môn hoá học lớp 10',
    this.fee = '300.000 vnđ/giờ',
    this.subject = 'Hóa học lớp 10',
    this.address = 'Thanh Xuân, Hà Nội',
    this.classId = '01234',
    this.methodTeach = 'Gặp mặt',
    this.date = '05/07/2019',
    this.status = 'Đang dạy',
  }) : super(key: key);

  @override
  _ListClassTeachingScreenState createState() => _ListClassTeachingScreenState();
}

class _ListClassTeachingScreenState extends State<ListClassTeachingScreen> {
  ScrollController _controller = ScrollController();
  HomeAfterTeacherController homeAfterTeacherController = Get.put(HomeAfterTeacherController());
  ListClassTeachingController listClassTeachingController = Get.put(ListClassTeachingController());
  InformationClassController informationClassController = Get.put(InformationClassController());
  int i = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listClassTeachingController.listPHDND = [];
    listClassTeachingController.classAccepted(1, 10);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // homeAfterController.homeParent();
        i++;
        print(i);
        listClassTeachingController.classAccepted(i, 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String convertDate(int timestamp) {
      final df = new DateFormat('dd-MM-yyyy');
      return df.format(new DateTime.fromMillisecondsSinceEpoch(timestamp*1000));

    }
    return GetBuilder<ListClassTeachingController>(
      init: ListClassTeachingController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Lớp nhận dạy',
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
          child: controller.listPHDND.length != 0
              ? ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              height: AppDimens.space6,
            ),
                  physics: BouncingScrollPhysics(),
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => informationClassController.detailClass(int.parse(controller.listPHDND[index].itClassCode), 0),
                    child: Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.15,
                      secondaryActions: [
                        Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: IconSlideAction(
                            caption: 'Xoá',
                            color: AppColors.redEB5757,
                            icon: Icons.delete_outline,
                            onTap: () {
                              Get.dialog(DialogConfirm(
                                onPressed: () {
                                  controller.deleteClassAccepted(int.parse(controller.listPHDND[index].itClassCode));
                                  controller.listPHDND.remove(controller.listPHDND[index]);
                                  Get.back();
                                  controller.update();
                                },
                                title: 'Bạn có chắc muốn xóa lớp này không ?',
                              ));
                            },
                          ),
                        ),
                      ],
                      child: Container(
                            // margin: EdgeInsets.only(bottom: 10),
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
                                          controller.listPHDND[index].pftSummary,
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
                                                  '${controller.listPHDND[index].pftPrice} vnđ/${controller.listPHDND[index].pftMonth}',
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
                                                  controller.listPHDND[index].asDetailName,
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
                                                    "${controller.listPHDND[index].ctyDetail}, ${controller.listPHDND[index].citName}",
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
                                                  'Ngày dạy:',
                                                  style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.grey747474),
                                                ),
                                                SizedBox(
                                                  width: AppDimens.space4,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    convertDate(int.parse(controller.listPHDND[index].receivedDate)),
                                                    style: AppTextStyles.regular(
                                                      context,
                                                      size: AppDimens.textSize14,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
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
                                                  controller.listPHDND[index].itClassCode,
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
                                                  'Hình thức:',
                                                  style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.grey747474),
                                                ),
                                                SizedBox(
                                                  width: AppDimens.space8,
                                                ),
                                                Text(
                                                  controller.listPHDND[index].pftForm,
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
                                    height: AppDimens.space12,
                                  ),
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: AppDimens.space6, horizontal: AppDimens.space12),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 0.5,
                                          color: AppColors.primary4C5BD4,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Trạng thái:',
                                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.grey747474),
                                          ),
                                          SizedBox(
                                            width: AppDimens.space6,
                                          ),
                                          Text(
                                            controller.listPHDND[index].status,
                                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.secondaryF8971C),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                    ),
                  ),
                  itemCount: controller.listPHDND.length)
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
