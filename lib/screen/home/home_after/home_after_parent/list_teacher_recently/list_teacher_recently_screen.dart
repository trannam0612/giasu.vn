import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/authen/login/login_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_recently/list_teacher_recently_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_recently/list_class_recently_controller.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/information_teacher_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';

import '../../../information/information_teacher/checkbox_list_class.dart';

class ListTeacherRecentlyScreen extends StatefulWidget {
  final bool saved;
  final String name;
  final int rate;
  final String address;
  final String subject;
  final String fee;
  final String image;

  const ListTeacherRecentlyScreen(
      {Key key,
      this.saved = false,
      this.name = 'Nguyễn Văn Tuấn Anh',
      this.rate = 3,
      this.subject = 'Hóa học lớp 10',
      this.fee = '300.000 vnđ/giờ',
      this.image = 'https://nghesiviet.vn/storage/files/7/phuongly/phuong-ly.jpg',
      this.address = 'Thanh Xuân, Hà Nội'})
      : super(key: key);

  @override
  _ListTeacherRecentlyScreenState createState() => _ListTeacherRecentlyScreenState();
}

class _ListTeacherRecentlyScreenState extends State<ListTeacherRecentlyScreen> {
  HomeAfterParentController homeAfterParentController = Get.put(HomeAfterParentController());
  ListTeacherRecentlyController listTeacherRecentlyController = Get.put(ListTeacherRecentlyController());
  InformationTeacherController informationTeacherController = Get.put(InformationTeacherController());
  ScrollController _controller = ScrollController();
  int i = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listTeacherRecentlyController.listTeacherRecently(1, 10);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // homeAfterController.homeParent();
        i++;
        print(i);
        listTeacherRecentlyController.listTeacherRecently(i, 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<ListTeacherRecentlyController>(
      init: ListTeacherRecentlyController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Gia sư gần đây',
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
        body: controller.listGSGDMore.isEmpty
            ? Center(
                child: Text(
                  'Danh sách trống',
                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize20, color: AppColors.grey747474),
                ),
              )
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                controller: _controller,
                itemCount: controller.listGSGDMore.length,
                itemBuilder: (context, index) => InkWell(
                  onTap : () =>  informationTeacherController.detailTeacher(int.parse(controller.listGSGDMore[index].ugsId), 0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppDimens.space6, vertical: AppDimens.space6),
                    child: SizedBox(
                      height: height * 0.25,
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
                                        controller.listGSGDMore[index].ugsName,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize14),
                                      ),
                                      SizedBox(
                                        height: AppDimens.space6,
                                      ),
                                      RatingBar(
                                        initialRating: widget.rate.toDouble(),
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
                                    height: AppDimens.space12,
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
                                        width: AppDimens.space6,
                                      ),
                                      Text(
                                        controller.listGSGDMore[index].asDetailName.join(', '),
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
                                      Text(
                                        '${controller.listGSGDMore[index].cityDetailNameGs}, ${controller.listGSGDMore[index].cityNameGs}',
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
                                        Images.ic_money,
                                        color: AppColors.secondaryF8971C,
                                        width: 16,
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: AppDimens.space6,
                                      ),
                                      Text(
                                        '${controller.listGSGDMore[index].ugsUnitPrice}vnđ/${controller.listGSGDMore[index].ugsMonth}',
                                        style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.secondaryF8971C),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: AppDimens.space10,
                                      ),
                                      Row(
                                        children: [
                                          Spacer(),
                                          SizedBox(
                                            height: 30,
                                            width: 95,
                                            child: CustomButton2(
                                              title: 'Mời dạy',
                                              color: AppColors.primary4C5BD4,
                                              onPressed: () {
                                                Get.dialog(CheckboxListClass(
                                                  name: controller.listGSGDMore[index].ugsName,
                                                  imageUrl: controller.listGSGDMore[index].ugsAvatar,
                                                  idGS: controller.listGSGDMore[index].ugsId,
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
                                            width: 95,
                                            child: controller.listGSGDMore[index].checkSave
                                                ? CustomButton2(
                                                    title: 'Đã lưu',
                                                    color: AppColors.primary4C5BD4,
                                                    onPressed: () {
                                                      controller.listGSGDMore[index].checkSave = false;
                                                      homeAfterParentController.deleteTutorSaved(int.parse(controller.listGSGDMore[index].ugsId));
                                                      controller.update();
                                                    },
                                                    textColor: AppColors.whiteFFFFFF,
                                                  )
                                                : CustomButton1(
                                                    textColor: AppColors.secondaryF8971C,
                                                    onPressed: () {
                                                      controller.listGSGDMore[index].checkSave = true;
                                                      homeAfterParentController.saveTutor(int.parse(controller.listGSGDMore[index].ugsId));
                                                      controller.update();
                                                    },
                                                    color: AppColors.secondaryF8971C,
                                                    title: 'Lưu',
                                                    backColor: AppColors.whiteFFFFFF,
                                                  ),
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 5,
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
                                  imageUrl: controller.listGSGDMore[index].ugsAvatar,
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
