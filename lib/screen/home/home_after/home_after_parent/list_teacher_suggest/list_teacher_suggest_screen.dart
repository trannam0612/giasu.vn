import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_suggest/list_teacher_suggest_controller.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/information_teacher_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:sp_util/sp_util.dart';

class ListTeacherSuggestedScreen extends StatefulWidget {
  final bool saved;
  final String name;
  final int rate;
  final String date;
  final String subject;
  final String fee;
  final String image;

  const ListTeacherSuggestedScreen(
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
  _ListTeacherSuggestedScreenState createState() => _ListTeacherSuggestedScreenState();
}

class _ListTeacherSuggestedScreenState extends State<ListTeacherSuggestedScreen> {
  ScrollController _controller = ScrollController();
  ListTeacherSuggestController listTeacherSuggestController = Get.put(ListTeacherSuggestController());
  HomeAfterParentController homeAfterParentController = Get.put(HomeAfterParentController());
  InformationTeacherController informationTeacherController = Get.put(InformationTeacherController());
  int i = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listTeacherSuggestController.listGSDD = [];
    listTeacherSuggestController.tutorOfferedTeach(1, 10);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // homeAfterController.homeParent();
        i++;
        print(i);
        listTeacherSuggestController.tutorOfferedTeach(i, 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GetBuilder<ListTeacherSuggestController>(
      init: ListTeacherSuggestController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Gia sư đề nghị dạy',
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
        body: controller.listGSDD.isEmpty
            ? Center(
                child: Text(
                  'Danh sách trống',
                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize20, color: AppColors.grey747474),
                ),
              )
            : ListView.builder(
                itemCount: controller.listGSDD.length,
                physics: BouncingScrollPhysics(),
                controller: _controller,
                itemBuilder: (context, index) => Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.15,
                  secondaryActions: [
                    Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: IconSlideAction(
                        caption: 'Delete',
                        color: AppColors.redEB5757,
                        icon: Icons.delete_outline,
                        onTap: () {
                          controller.tutorDeleteOffer(int.parse(controller.listGSDD[index].ugsId), int.parse(controller.listGSDD[index].pftId));
                          controller.listGSDD.remove(controller.listGSDD[index]);
                          controller.update();
                        },
                      ),
                    ),
                  ],
                  child: InkWell(
                    onTap: () {
                      SpUtil.putString(ConstString.NAME_CLASS, controller.listGSDD[index].pftSummary);
                      SpUtil.putString(ConstString.ID_CLASS, controller.listGSDD[index].pftId);
                      informationTeacherController.detailTeacher(int.parse(controller.listGSDD[index].ugsId), 1);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: AppDimens.space6, vertical: AppDimens.space6),
                      child: SizedBox(
                        height: height * 0.24,
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
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller.listGSDD[index].ugsName,
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
                                            SizedBox(height: AppDimens.space4,),
                                          ],
                                        ),
                                        InkWell(
                                            onTap: () {
                                              if (!controller.listGSDD[index].checkSave) {
                                                controller.listGSDD[index].checkSave = true;
                                                homeAfterParentController.saveTutor(int.parse(controller.listGSDD[index].ugsId));
                                                controller.update();
                                              } else {
                                                controller.listGSDD[index].checkSave = false;
                                                homeAfterParentController.deleteTutorSaved(int.parse(controller.listGSDD[index].ugsId));
                                                controller.update();
                                              }
                                            },
                                            child: controller.listGSDD[index].checkSave ? SvgPicture.asset(Images.ic_saved) : SvgPicture.asset(Images.ic_save))
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppDimens.space6,
                                    ),
                                    Text(
                                      controller.listGSDD[index].pftSummary,
                                      style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.primary4C5BD4),
                                    ),
                                    SizedBox(
                                      height: AppDimens.space6,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Ngày đ/n:',
                                          style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),
                                        ),
                                        SizedBox(
                                          width: AppDimens.space4,
                                        ),
                                        Text(
                                          controller.listGSDD[index].otDate,
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
                                      children: [
                                        Flexible(
                                          flex : 8,
                                          child: Row(
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
                                                  controller.listGSDD[index].asDetailName.join(', '),
                                                  overflow: TextOverflow.ellipsis,
                                                  style: AppTextStyles.regular(
                                                    context,
                                                    size: AppDimens.textSize14,
                                                  ),

                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Flexible(
                                          flex: 6,
                                          child: Row(
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
                                                '${controller.listGSDD[index].pftPrice}vnđ/${controller.listGSDD[index].pftMonth}',
                                                style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.secondaryF8971C),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: AppDimens.space10,
                                    ),
                                    Row(
                                      children: [
                                        Spacer(),
                                        SizedBox(
                                          width: 95,
                                          height: 30,
                                          child: CustomButton2(
                                            title: 'Đồng ý',
                                            color: AppColors.primary4C5BD4,
                                            onPressed: () {
                                              controller.acceptOffer(int.parse(controller.listGSDD[index].ugsId), int.parse(controller.listGSDD[index].pftId));
                                              controller.listGSDD.remove(controller.listGSDD[index]);
                                              controller.update();
                                            },
                                            textColor: AppColors.whiteFFFFFF,
                                          ),
                                        ),
                                        SizedBox(
                                          width: AppDimens.space20,
                                        ),
                                        SizedBox(
                                          width: 95,
                                          height: 30,
                                          child: CustomButton1(
                                            textColor: AppColors.black,
                                            onPressed: () {
                                              controller.refuseOffer(int.parse(controller.listGSDD[index].ugsId), int.parse(controller.listGSDD[index].pftId));
                                              controller.listGSDD.remove(controller.listGSDD[index]);
                                              controller.update();
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
      ),
    );
  }
}
