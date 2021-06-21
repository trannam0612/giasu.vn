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
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_saved/list_teacher_saved_controller.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/checkbox_list_class.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';

class ListTeacherSaved extends StatefulWidget {
  final bool saved;
  final String name;
  final int rate;
  final String date;
  final String subject;
  final String fee;
  final String image;

  const ListTeacherSaved(
      {Key key,
      this.saved = false,
      this.name = 'Nguyễn Văn Tuấn Anh',
      this.rate = 3,
      this.date = '10/05/2020',
      this.subject = 'Hóa học lớp 10',
      this.fee = '300.000 vnđ/giờ',
      this.image = 'https://nghesiviet.vn/storage/files/7/phuongly/phuong-ly.jpg'})
      : super(key: key);

  @override
  _ListTeacherSavedState createState() => _ListTeacherSavedState();
}

class _ListTeacherSavedState extends State<ListTeacherSaved> {
  ScrollController _controller = ScrollController();
  ListTeacherSavedController listTeacherSavedController = Get.put(ListTeacherSavedController());
  HomeAfterParentController homeAfterParentController = Get.put(HomeAfterParentController());
  int i = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listTeacherSavedController.listGSDL = [];
    listTeacherSavedController.tutorSaved(1, 10);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // homeAfterController.homeParent();
        i++;
        print(i);
        listTeacherSavedController.tutorSaved(i, 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<ListTeacherSavedController>(
      init: ListTeacherSavedController(),
      builder:(controller) =>  Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Gia sư đã lưu',
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
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          controller: _controller,
          itemCount: controller.listGSDL.length,
          itemBuilder: (context, index) => Slidable(
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
                    homeAfterParentController.deleteTutorSaved(int.parse(controller.listGSDL[index].ugsTeach));
                    controller.listGSDL.remove(controller.listGSDL[index]);
                    controller.update();
                  },
                ),
              ),
            ],
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.space6, vertical: AppDimens.space6),
              child: SizedBox(
                height: height * 0.182,
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
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                     controller.listGSDL[index].ugsName,
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
                                widget.saved ? SvgPicture.asset(Images.ic_saved) : SvgPicture.asset(Images.ic_save)
                              ],
                            ),
                            SizedBox(
                              height: AppDimens.space6,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Ngày lưu:',
                                  style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),
                                ),
                                SizedBox(
                                  width: AppDimens.space4,
                                ),
                                Text(
                                  widget.date,
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
                                Expanded(
                                  child: Text(
                                    controller.listGSDL[index].asDetailName.join(', '),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                    Text(
                                      "${controller.listGSDL[index].ugsUnitPrice}vnđ/${controller.listGSDL[index].ugsMonth}",
                                      style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.secondaryF8971C),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 95,
                                  height: 30,
                                  child: CustomButton2(
                                    title: 'Mời dạy',
                                    color: AppColors.primary4C5BD4,
                                    onPressed: () {
                                      Get.dialog(CheckboxListClass(
                                        name: controller.listGSDL[index].ugsName,
                                        imageUrl: controller.listGSDL[index].ugsAvatar,
                                        idGS: controller.listGSDL[index].ugsTeach,
                                      ));
                                    },
                                    textColor: AppColors.whiteFFFFFF,
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
                            imageUrl: controller.listGSDL[index].ugsAvatar,
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
