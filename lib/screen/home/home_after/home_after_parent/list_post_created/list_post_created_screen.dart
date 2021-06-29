import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_post_created/list_post_created_controller.dart';
import 'package:giasu_vn/screen/post/post_screen.dart';
import 'package:giasu_vn/screen/post/update_post/update_post_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';

class ListPostCreatedScreen extends StatefulWidget {
  final String title;
  final String fee;
  final String subject;
  final String address;
  final String classId;
  final String methodTeach;
  final String date;

  const ListPostCreatedScreen({
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
  _ListPostCreatedScreenState createState() => _ListPostCreatedScreenState();
}

class _ListPostCreatedScreenState extends State<ListPostCreatedScreen> {
  ScrollController _controller = ScrollController();
  UpdatePostController updatePostController = Get.put(UpdatePostController());
  ListPostCreatedController listPostCreatedController = Get.put(ListPostCreatedController());
  int i = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listPostCreatedController.listClassPosted = [];
    listPostCreatedController.classPosted(1, 10);

    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // homeAfterController.homeParent();
        i++;
        print(i);
        listPostCreatedController.classPosted(i, 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListPostCreatedController>(
      init: ListPostCreatedController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Tin đã đăng',
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
          child: controller.listClassPosted.isEmpty
              ? Center(
                  child: Text(
                    'Danh sách trống',
                    style: AppTextStyles.regularW500(context, size: AppDimens.textSize20, color: AppColors.grey747474),
                  ),
                )
              : ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _controller,
                  itemCount: controller.listClassPosted.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary4C5BD4, width: 0.5),
                      borderRadius: BorderRadius.circular(AppDimens.space16),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(AppDimens.padding12),
                      width: AppDimens.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppDimens.space16), color: AppColors.whiteFFFFFF, boxShadow: [
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
                          Text(
                            controller.listClassPosted[index].pftSummary,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
                          ),
                          SizedBox(
                            height: AppDimens.space6,
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
                                          '${controller.listClassPosted[index].pftPrice}vnđ/${controller.listClassPosted[index].pftMonth}',
                                          style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.secondaryF8971C),
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
                                          controller.listClassPosted[index].asNameDetail,
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
                                            '${controller.listClassPosted[index].ctyDetail}, ${controller.listClassPosted[index].citName} ',
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ngày đăng:',
                                        style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.grey747474),
                                      ),
                                      SizedBox(
                                        width: AppDimens.space4,
                                      ),
                                      Text(
                                        controller.listClassPosted[index].dayPost,
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
                                        controller.listClassPosted[index].pftId,
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
                                        controller.listClassPosted[index].pftForm,
                                        style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.primary4C5BD4),
                                      ),
                                    ],
                                  ),
                                ],
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
                                      title: 'Chỉnh sửa',
                                      color: AppColors.primary4C5BD4,
                                      onPressed: () {
                                        updatePostController.getDetailClass(int.parse(controller.listClassPosted[index].pftId));
                                        // Get.to(PostScreen());
                                      },
                                      textColor: AppColors.whiteFFFFFF,
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: AppDimens.space20,
                                  // ),
                                  // SizedBox(
                                  //   height: 30,
                                  //   width: 95,
                                  //   child: CustomButton1(
                                  //     textColor: AppColors.black,
                                  //     onPressed: () {},
                                  //     color: AppColors.grey747474,
                                  //     title: 'Xoá bài',
                                  //     backColor: AppColors.whiteFFFFFF,
                                  //   ),
                                  // )
                                ],
                              ),
                            ],
                          )
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
