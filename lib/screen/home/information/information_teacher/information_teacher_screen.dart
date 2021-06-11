import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/information_teacher_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_button_3.dart';
import 'package:giasu_vn/widgets/custom_textfield_box.dart';

class InformationTeacherScreen extends StatelessWidget {
  const InformationTeacherScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InformationTeacherController>(
      init: InformationTeacherController(),
      builder: (controller) => Scaffold(
          backgroundColor: AppColors.greyf6f6f6,
          appBar: AppBar(
            title: Text(
              'Thông tin gia sư',
              style: AppTextStyles.regularW500(context,
                  size: AppDimens.textSize24,
                  lineHeight: AppDimens.textSize28,
                  color: AppColors.whiteFFFFFF),
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
          body: SingleChildScrollView(
            child: Container(
              width: AppDimens.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                    image: ExactAssetImage(Images.bg_background_container)),
              ),
              padding: EdgeInsets.all(AppDimens.space16),
              child: Column(
                children: [
                  SizedBox(
                    height: AppDimens.space14,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://nghesiviet.vn/storage/files/7/phuongly/phuong-ly.jpg',
                      width: 85,
                      height: 85,
                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Text(
                    'Nguyễn Văn Tuấn Anh',
                    style: AppTextStyles.regularW700(context,
                        size: AppDimens.textSize20,
                        color: AppColors.whiteFFFFFF,
                        lineHeight: AppDimens.textSize24),
                  ),
                  SizedBox(
                    height: AppDimens.space6,
                  ),
                  RatingBar(
                    initialRating: 4,
                    itemSize: 15,
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
                  SizedBox(
                    height: AppDimens.space16,
                  ),
                  Container(
                    padding: EdgeInsets.all(AppDimens.space20),
                    width: AppDimens.width,
                    decoration: BoxDecoration(
                        color: AppColors.whiteFFFFFF,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  Images.ic_book,
                                  width: 16,
                                  height: 16,
                                  color: AppColors.grey747474,
                                ),
                                SizedBox(
                                  width: AppDimens.space6,
                                ),
                                Text(
                                  'Hóa học lớp 10',
                                  style: AppTextStyles.regular(
                                    context,
                                    size: AppDimens.textSize14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  Images.ic_call,
                                  width: 18,
                                  height: 18,
                                  color: AppColors.grey747474,
                                ),
                                SizedBox(
                                  width: AppDimens.space8,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppDimens.space4,
                                      horizontal: AppDimens.space8),
                                  decoration: BoxDecoration(
                                      color: AppColors.primary4C5BD4,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    'sử dụng 1 điểm để xem',
                                    style: AppTextStyles.regular(context,
                                        size: AppDimens.textSize14,
                                        color: AppColors.whiteFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.space10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  Images.ic_money,
                                  width: 16,
                                  height: 16,
                                  color: AppColors.secondaryF8971C,
                                ),
                                SizedBox(
                                  width: AppDimens.space6,
                                ),
                                Text(
                                  '300.000 vnđ/giờ',
                                  style: AppTextStyles.regular(
                                    context,
                                    size: AppDimens.textSize14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  Images.ic_mail,
                                  width: 18,
                                  height: 18,
                                  color: AppColors.grey747474,
                                ),
                                SizedBox(
                                  width: AppDimens.space8,
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: AppDimens.space4,
                                      horizontal: AppDimens.space8),
                                  decoration: BoxDecoration(
                                      color: AppColors.primary4C5BD4,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    'sử dụng 1 điểm để xem',
                                    style: AppTextStyles.regular(context,
                                        size: AppDimens.textSize14,
                                        color: AppColors.whiteFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space12,
                  ),
                  Text(
                    'Giới thiệu chung',
                    style: AppTextStyles.regularW500(context,
                        size: AppDimens.textSize20),
                  ),
                  SizedBox(
                    height: AppDimens.space6,
                  ),
                  Container(
                    padding: EdgeInsets.all(AppDimens.space14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteFFFFFF),
                    child: Text(
                      'Mình học Chuyên Anh của trường THPT chuyên Phan Bội Châu Nghệ An , đạt học sinh giỏi tỉnh môn tiếng anh. Thi ielts được 6.0 năm lớp 11. Hiện đang là sinh viên năm ba khoa kiểm toán chất lượng cao(học 30% bằng tiếng anh) trường đại học Kinh tế quốc dân. Đã có 3 năm dạy kèm cho học sinh lớp 10.Thi ielts được 6.0 năm lớp 11. Hiện đang là sinh viên năm ba khoa kiểm toán chất lượng cao(học 30% bằng tiếng anh) trường đại học Kinh tế quốc dân. Đã có 3 năm dạy kèm cho học sinh lớp 10.',
                      style: AppTextStyles.regularW400(context,
                          size: AppDimens.textSize14,
                          color: AppColors.grey747474,
                          lineHeight: AppDimens.textSize18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space12,
                  ),
                  Text(
                    'Thông tin cá nhân',
                    style: AppTextStyles.regularW500(context,
                        size: AppDimens.textSize20),
                  ),
                  SizedBox(
                    height: AppDimens.space6,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: AppDimens.space8),
                    decoration: BoxDecoration(
                        color: AppColors.whiteFFFFFF,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.padding14,
                              vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Giới tính:',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16,
                                    color: AppColors.grey747474),
                              ),
                              Text(
                                'Nam',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.padding14,
                              vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ngày sinh:',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16,
                                    color: AppColors.grey747474),
                              ),
                              Text(
                                '22/12/1993',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.padding14,
                              vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Địa chỉ:',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16,
                                    color: AppColors.grey747474),
                              ),
                              Text(
                                'Định Công, Hoàng Mai ,Hà Nội',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.padding14,
                              vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Tình trạng hôn nhân:',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16,
                                    color: AppColors.grey747474),
                              ),
                              Text(
                                'Chưa kết hôn',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space12,
                  ),
                  Text(
                    'Thông tin giảng dạy',
                    style: AppTextStyles.regularW500(context,
                        size: AppDimens.textSize20),
                  ),
                  SizedBox(
                    height: AppDimens.space6,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: AppDimens.space8),
                    decoration: BoxDecoration(
                        color: AppColors.whiteFFFFFF,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.padding14,
                              vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kiểu gia sư:',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16,
                                    color: AppColors.grey747474),
                              ),
                              Text(
                                'Giảng viên',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.padding14,
                              vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'môn học giảng dạy:',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16,
                                    color: AppColors.grey747474),
                              ),
                              Text(
                                'Hóa học',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.padding14,
                              vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lớp học giảng dạy:',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16,
                                    color: AppColors.grey747474),
                              ),
                              Text(
                                'Lớp 10',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 0.25,
                          color: AppColors.greyAAAAAA,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppDimens.padding14,
                              vertical: AppDimens.padding8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hình thức giảng dạy:',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16,
                                    color: AppColors.grey747474),
                              ),
                              Text(
                                'Gặp mặt',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space12,
                  ),
                  Text(
                    'Lịch học có thể dạy',
                    style: AppTextStyles.regularW500(context,
                        size: AppDimens.textSize20),
                  ),
                  SizedBox(
                    height: AppDimens.space6,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.space10),
                      color: AppColors.whiteFFFFFF,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.padding20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: AppDimens.smallPadding10),
                            child: ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          controller.listbuoiday[index].thu,
                                          textAlign: TextAlign.center,
                                          style: AppTextStyles.regularW400(
                                              context,
                                              size: AppDimens.textSize14,
                                              color: AppColors.black),
                                        ),
                                        Spacer(),
                                        CustomButton3(
                                          title: 'Sáng',
                                          onPressed: () {
                                            // controller.listbuoiday[index].sang = controller.listbuoiday[index].sang;
                                            // controller.update();
                                          },
                                          color: controller.listbuoiday[index]
                                                      .sang ==
                                                  1
                                              ? AppColors.secondaryF8971C
                                              : AppColors.whiteFFFFFF,
                                          textColor: controller
                                                      .listbuoiday[index]
                                                      .sang ==
                                                  1
                                              ? AppColors.whiteFFFFFF
                                              : AppColors.grey747474,
                                          hasSide: controller.listbuoiday[index]
                                                      .sang ==
                                                  1
                                              ? false
                                              : true,
                                        ),
                                        SizedBox(
                                          width: AppDimens.padding20,
                                        ),
                                        CustomButton3(
                                          title: 'Chiều',
                                          onPressed: () {
                                            // controller.listbuoiday[index].chieu = !controller.listbuoiday[index].chieu;
                                            // controller.update();
                                          },
                                          color: controller.listbuoiday[index]
                                                      .chieu ==
                                                  1
                                              ? AppColors.secondaryF8971C
                                              : AppColors.whiteFFFFFF,
                                          textColor: controller
                                                      .listbuoiday[index]
                                                      .chieu ==
                                                  1
                                              ? AppColors.whiteFFFFFF
                                              : AppColors.grey747474,
                                          hasSide: controller.listbuoiday[index]
                                                      .chieu ==
                                                  1
                                              ? false
                                              : true,
                                        ),
                                        SizedBox(
                                          width: AppDimens.padding20,
                                        ),
                                        CustomButton3(
                                          title: 'Tối',
                                          onPressed: () {
                                            // controller.listbuoiday[index].toi = !controller.listbuoiday[index].toi;
                                            // controller.update();
                                          },
                                          color: controller
                                                      .listbuoiday[index].toi ==
                                                  1
                                              ? AppColors.secondaryF8971C
                                              : AppColors.whiteFFFFFF,
                                          textColor: controller
                                                      .listbuoiday[index].toi ==
                                                  1
                                              ? AppColors.whiteFFFFFF
                                              : AppColors.grey747474,
                                          hasSide: controller
                                                      .listbuoiday[index].toi ==
                                                  1
                                              ? false
                                              : true,
                                        ),
                                      ],
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: AppDimens.space10,
                                    ),
                                itemCount: controller.listbuoiday.length),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppDimens.space12,
                  ),
                  Text(
                    'Đánh giá',
                    style: AppTextStyles.regularW500(context,
                        size: AppDimens.textSize20),
                  ),
                  SizedBox(
                    height: AppDimens.space6,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: AppDimens.space16,
                        horizontal: AppDimens.space20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppDimens.space10),
                      color: AppColors.whiteFFFFFF,
                    ),
                    child: Column(
                      children: [
                        RatingBar(
                          initialRating: 4,
                          itemSize: 20,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 10.0),
                          ratingWidget: RatingWidget(
                            full: SvgPicture.asset(Images.ic_star),
                            empty: SvgPicture.asset(Images.ic_star_border),
                          ),
                          unratedColor: AppColors.greyAAAAAA,
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(
                          height: AppDimens.space28,
                        ),
                        CustomTextFieldBox(
                          title: '',
                          hintText: 'Viết đánh giá',
                          hasTitle: false,
                        ),
                        SizedBox(
                          height: AppDimens.space16,
                        ),
                        SizedBox(
                          width: AppDimens.width,
                          height: 40,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.primary4C5BD4,
                                // background
                                onPrimary: AppColors.primary4C5BD4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                )),
                            onPressed: () {},
                            child: Text(
                              'Đánh giá',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16,
                                  color: AppColors.whiteFFFFFF),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: AppDimens.space28,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.symmetric(vertical: AppDimens.space16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color:
                                          AppColors.greyC4C4C4.withOpacity(0.25),
                                      spreadRadius: 0,
                                      blurRadius: 9,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ]),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(80),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          'https://i.pinimg.com/originals/06/3c/4b/063c4b41c58c86750a6a8c40a9219d7a.jpg',
                                      height: 50,
                                      width: 50,
                                      fit: BoxFit.cover,
                                      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                      ),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: AppDimens.space12,
                                        ),
                                        Text(
                                          'Nguyễn Thị A',
                                          style: AppTextStyles.regularW700(
                                              context,
                                              size: AppDimens.textSize16),
                                        ),
                                        SizedBox(
                                          width: AppDimens.space12,
                                        ),
                                        RatingBar(
                                          initialRating: 4,
                                          itemSize: 10,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: false,
                                          itemCount: 5,
                                          ignoreGestures: true,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 3.0),
                                          ratingWidget: RatingWidget(
                                            full:
                                                SvgPicture.asset(Images.ic_star),
                                            empty: SvgPicture.asset(
                                                Images.ic_star_border),
                                          ),
                                          unratedColor: AppColors.greyAAAAAA,
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: AppDimens.space4,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: AppDimens.space12),
                                      child: Text(
                                        '50 ngày trước',
                                        style: AppTextStyles.regularW400(context,
                                            size: AppDimens.textSize14,
                                            color: AppColors.greyAAAAAA),
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppDimens.space18,
                                    ),
                                    Container(
                                      width: AppDimens.width * 0.65,
                                      child: Text(
                                        'Mình rất hài lòng lòng cô gia sư này, cô dạy rất nhiệt tình, bây giờ con tôi học đã theo kịp...',
                                        softWrap: true,
                                        textAlign: TextAlign.left,
                                        style: AppTextStyles.regularW400(context,
                                            size: AppDimens.textSize14,
                                            lineHeight: AppDimens.textSize16,
                                            color: AppColors.grey747474),
                                      ),
                                    ),
                                    SizedBox(
                                      height: AppDimens.space14,
                                    ),
                                    GestureDetector(
                                      onTap:() {

                                      },
                                      child: Row(
                                        children: [
                                          Text(
                                            '1 phản hồi',
                                            style: AppTextStyles.regularW700(
                                                context,
                                                size: AppDimens.textSize14,
                                                color: AppColors.greyAAAAAA),
                                          ),
                                          SizedBox(
                                            width: AppDimens.space6,
                                          ),
                                          SvgPicture.asset(Images.ic_arrow_down),
                                          SizedBox(height: AppDimens.space14,),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: AppDimens.space16,),
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(80),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                            'https://i.pinimg.com/originals/06/3c/4b/063c4b41c58c86750a6a8c40a9219d7a.jpg',
                                            height: 38,
                                            width: 38,
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                              child: CircularProgressIndicator(
                                                  value: downloadProgress.progress),
                                            ),
                                            errorWidget: (context, url, error) => Icon(Icons.error),
                                          ),
                                        ),
                                        SizedBox(width: AppDimens.space8,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nguyễn Văn Tuấn Anh', style: AppTextStyles.regularW700(context, size: AppDimens.textSize14),
                                            ),
                                            SizedBox(height: AppDimens.space2,),
                                            Text(
                                              '50 ngày trước',style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),
                                            ),
                                            Text('Cảm ơn cô đã quan tâm.'),

                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          separatorBuilder: (context, index) => Divider(color: AppColors.grey747474, thickness: 0.15,),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: AppDimens.space16,),
                  Row(
                    children: [
                      Spacer(),
                      SizedBox(
                        width: 130,
                        height: 30,
                        child: CustomButton2(
                          color: AppColors.primary4C5BD4,
                          hasRadius: true,
                          textColor: AppColors.whiteFFFFFF,
                          onPressed: () {

                          },
                          title: 'Mời dạy',
                        ),
                      ),
                      SizedBox(width: AppDimens.space6,),
                      SizedBox(
                        width: 130,
                        height: 30,
                        child: CustomButton1(
                          title: 'Lưu gia sư',
                          color: AppColors.grey747474,
                          textColor: AppColors.secondaryF8971C,
                          hasRadius: true,
                          backColor: AppColors.whiteFFFFFF,
                        ),
                      ),
                      Spacer(),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}