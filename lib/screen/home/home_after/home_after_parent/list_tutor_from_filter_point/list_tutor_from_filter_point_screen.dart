import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_tutor_from_filter_point/list_tutor_from_filter_point_controller.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/information_teacher_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/dialog_%20confirm.dart';

import '../home_after_parent_controller.dart';

class ListTutorFromFilterPointScreen extends StatefulWidget {
  const ListTutorFromFilterPointScreen({Key key}) : super(key: key);

  @override
  _ListTutorFromFilterPointScreenState createState() => _ListTutorFromFilterPointScreenState();
}

class _ListTutorFromFilterPointScreenState extends State<ListTutorFromFilterPointScreen> {
  ListTutorFromFilterPointController listTutorFromFilterPointController = Get.put(ListTutorFromFilterPointController());
  InformationTeacherController informationTeacherController = Get.put(InformationTeacherController());
  HomeAfterParentController homeAfterParentController = Get.put(HomeAfterParentController());
  ScrollController _controller = ScrollController();
  int i = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listTutorFromFilterPointController.listGSTDL = [];
    listTutorFromFilterPointController.tutorFromFilterPoint(1, 10);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // homeAfterController.homeParent();
        i++;
        print(i);
        listTutorFromFilterPointController.tutorFromFilterPoint(i, 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListTutorFromFilterPointController>(
      init: ListTutorFromFilterPointController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Gia sư từ điểm lọc',
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
              homeAfterParentController.homeAfterParent(1, 10);
            },
          ),
        ),
        body: controller.listGSTDL.isEmpty ? Center(
          child: Text(
            'Danh sách trống',
            style: AppTextStyles.regularW500(context, size: AppDimens.textSize20, color: AppColors.grey747474),
          ),
        ) :  ListView.builder(
          physics: BouncingScrollPhysics(),
          controller: _controller,
          itemCount: controller.listGSTDL.length,
          itemBuilder: (context, index) => InkWell(
            onTap : () =>  informationTeacherController.detailTeacher(int.parse(controller.listGSTDL[index].ugsId), 0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.space6, vertical: AppDimens.space6),
              child: SizedBox(
                height: AppDimens.height * 0.19,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Positioned.fill(
                      left: 30,
                      child: Container(
                        padding: EdgeInsets.only(left: AppDimens.space48, top: AppDimens.space16, right: AppDimens.space16, bottom: AppDimens.space16),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.whiteFFFFFF, boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.listGSTDL[index].ugsName,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize14),
                                ),
                                SizedBox(
                                  height: AppDimens.space6,
                                ),
                                RatingBar(
                                  initialRating: 3,
                                  itemSize: 12,
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
                              ],
                            ),
                            SizedBox(
                              height: AppDimens.space16,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Ngày xem hồ sơ:',
                                  style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),
                                ),
                                SizedBox(
                                  width: AppDimens.space4,
                                ),
                                Text(
                                  controller.listGSTDL[index].suToday,
                                  style: AppTextStyles.regularW400(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Điểm lọc:',
                                      style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),
                                    ),
                                    SizedBox(
                                      width: AppDimens.space6,
                                    ),
                                    Text(
                                      controller.listGSTDL[index].suStatus,
                                      style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.redFF0033),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 95,
                                  height: 30,
                                  child: CustomButton1(

                                    backColor: AppColors.whiteFFFFFF,
                                    title: 'Xoá',
                                    color: AppColors.primary4C5BD4,
                                    onPressed: () {
                                      Get.dialog(DialogConfirm(
                                        title: 'Bạn có chắc là muốn xoá gia sư này không ?',
                                        onPressed: () {
                                          Get.back();
                                          controller.deleteTutorPointFree(int.parse(controller.listGSTDL[index].ugsId));
                                          controller.listGSTDL.remove(controller.listGSTDL[index]);
                                          controller.update();
                                        },
                                      ));
                                    },
                                    textColor: AppColors.secondaryF8971C,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withOpacity(0.25),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(80),
                          child: CachedNetworkImage(
                            imageUrl: controller.listGSTDL[index].ugsAvatar,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(value: downloadProgress.progress),
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
