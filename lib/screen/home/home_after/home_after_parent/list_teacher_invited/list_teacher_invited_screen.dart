import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_invited/list_teacher_invited_controller.dart';

class ListTeacherInvitedScreen extends StatefulWidget {
  final bool saved;
  final String name;
  final int rate;
  final String date;
  final String subject;
  final String fee;
  final String image;

  const ListTeacherInvitedScreen(
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
  _ListTeacherInvitedScreenState createState() => _ListTeacherInvitedScreenState();
}

class _ListTeacherInvitedScreenState extends State<ListTeacherInvitedScreen> {
  ScrollController _controller = ScrollController();
  ListTeacherInvitedController listTeacherInvitedController = Get.put(ListTeacherInvitedController());
  HomeAfterParentController homeAfterParentController = Get.put(HomeAfterParentController());
  int i = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listTeacherInvitedController.invitedTutor(1, 10);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // homeAfterController.homeParent();
        i++;
        print(i);
        listTeacherInvitedController.invitedTutor(i, 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<ListTeacherInvitedController>(
      init: ListTeacherInvitedController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Gia sư đã mời dạy',
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
        body: controller.listGSMD.isEmpty
            ? Center(
                child: Text(
                  'Danh sách trống',
                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize20, color: AppColors.grey747474),
                ),
              )
            : ListView.builder(
                physics: BouncingScrollPhysics(),
                controller: _controller,
                itemCount: controller.listGSMD.length,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.space6, vertical: AppDimens.space6),
                  child: SizedBox(
                    height: height * 0.165,
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.listGSMD[index].ugsName,
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
                                    InkWell(child: controller.listGSMD[index].checkSave ? SvgPicture.asset(Images.ic_saved) : SvgPicture.asset(Images.ic_save),
                                    onTap: () {
                                      if (!controller.listGSMD[index].checkSave) {
                                        controller.listGSMD[index].checkSave = true;
                                        homeAfterParentController.saveTutor(int.parse(controller.listGSMD[index].ugsId));
                                        controller.update();
                                      } else {
                                        controller.listGSMD[index].checkSave = false;
                                        homeAfterParentController.deleteTutorSaved(int.parse(controller.listGSMD[index].ugsId));
                                        controller.update();
                                      }
                                    },)
                                  ],
                                ),
                                SizedBox(
                                  height: AppDimens.space6,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Ngày mời:',
                                      style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),
                                    ),
                                    SizedBox(
                                      width: AppDimens.space4,
                                    ),
                                    Text(
                                      controller.listGSMD[index].dayInvitationTeach,
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
                                        controller.listGSMD[index].asDetailName.join(', '),
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.regular(
                                          context,
                                          size: AppDimens.textSize14,
                                        ),
                                        maxLines: 1,
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
                                      '${controller.listGSMD[index].pftPrice}vnđ/${controller.listGSMD[index].pftMonth}',
                                      style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.secondaryF8971C),
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
                                imageUrl: controller.listGSMD[index].ugsAvatar,
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
    );
  }
}
