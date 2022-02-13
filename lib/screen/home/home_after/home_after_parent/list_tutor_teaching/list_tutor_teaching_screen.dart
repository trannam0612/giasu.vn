import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/convert.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_tutor_teaching/list_tutor_teaching_controller.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_controller.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/information_teacher_controller.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';

class ListTutorTeachingScreen extends StatefulWidget {
  const ListTutorTeachingScreen({Key key}) : super(key: key);

  @override
  _ListTutorTeachingScreenState createState() => _ListTutorTeachingScreenState();
}

class _ListTutorTeachingScreenState extends State<ListTutorTeachingScreen> {
  ListTutorTeachingController listTutorTeachingController = Get.put(ListTutorTeachingController());
  InformationTeacherController informationTeacherController = Get.put(InformationTeacherController());
  InformationClassController informationClassController = Get.put(InformationClassController());
  ScrollController _controller = ScrollController();
  int i = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listTutorTeachingController.listGSDD = [];
    listTutorTeachingController.tutorTeaching(1, 10);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // homeAfterController.homeParent();
        i++;
        print(i);
        listTutorTeachingController.tutorTeaching(i, 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<ListTutorTeachingController>(
      init: ListTutorTeachingController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Gia sư đang dạy',
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
        body: controller.listGSDD.isEmpty
            ? Center(
                child: Text(
                  'Danh sách trống',
                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize20, color: AppColors.grey747474),
                ),
              )
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                controller: _controller,
                itemCount: controller.listGSDD.length,
                itemBuilder: (context, index) => InkWell(
                  onTap : () =>  informationTeacherController.detailTeacher(int.parse(controller.listGSDD[index].ugsId), 0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppDimens.space6, vertical: AppDimens.space6),
                    child: SizedBox(
                      height: 164,
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
                                        controller.listGSDD[index].ugsName,
                                        style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),
                                        overflow: TextOverflow.ellipsis,
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
                                  InkWell(
                                    onTap: () => informationClassController.detailClass(int.parse(controller.listGSDD[index].pftId), 5),
                                    child: Text(
                                      controller.listGSDD[index].pftSummary,
                                      style: AppTextStyles.regularW500(context, size: AppDimens.textSize14, color: AppColors.primary4C5BD4),
                                    ),
                                  ),
                                  SizedBox(
                                    height: AppDimens.space6,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Ngày bắt đầu dạy:',
                                        style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),
                                      ),
                                      SizedBox(
                                        width: AppDimens.space4,
                                      ),
                                      Text(
                                        Convert.convertTempDate(int.parse(controller.listGSDD[index].receivedDate), 'dd-MM-yyyy'),
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
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
                                                  width: AppDimens.space6,
                                                ),
                                                Text(
                                                  controller.listGSDD[index].asName,
                                                  style: AppTextStyles.regular(
                                                    context,
                                                    size: AppDimens.textSize14,
                                                  ),
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: AppDimens.space6,
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                  Images.ic_money,
                                                  color: AppColors.secondaryF8971C,
                                                  width: 16,
                                                  height: 16,
                                                ),
                                                SizedBox(
                                                  width: AppDimens.space6,
                                                ),
                                                Flexible(
                                                  child: Text(
                                                    "${controller.listGSDD[index].pftPrice} vnđ/${controller.listGSDD[index].pftMonth}",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.secondaryF8971C),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 120,
                                        height: 30,
                                        child: CustomButton1(
                                          backColor: AppColors.whiteFFFFFF,
                                          title: controller.listGSDD[index].otStatus,
                                          color: AppColors.primary4C5BD4,
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
                                  imageUrl: controller.listGSDD[index].ugsAvatar,
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
