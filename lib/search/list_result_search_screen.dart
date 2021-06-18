import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/search/search_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';

class ListResultSearchScreen extends StatelessWidget {
  final String title;
  final String fee;
  final String subject;
  final String address;
  final String classId;
  final String methodTeach;
  final String date;
  final String name;
  final int rate;
  final String image;

  const ListResultSearchScreen(
      {Key key,
        this.title = 'Tìm gia sư có kinh nghiệm trên 3 năm dạy môn hoá học lớp 10',
        this.fee = '300.000 vnđ/giờ',
        this.subject = 'Hóa học lớp 10',
        this.address = 'Thanh Xuân, Hà Nội',
        this.classId = '01234',
        this.methodTeach = 'Gặp mặt',
        this.date = '05/07/2019', this.name = 'Nguyễn Văn Tuấn Anh',
  this.rate = 3, this.image =
      'https://nghesiviet.vn/storage/files/7/phuongly/phuong-ly.jpg',})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: SearchController(),
      builder:  (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Kết quả tìm kiếm',
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
        body:controller.userType=='2' ?  Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.space16, vertical: AppDimens.space6),
          width: AppDimens.width,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColors.primary4C5BD4, width: 0.5),
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
                                  title,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.regularW500(context,
                                      size: AppDimens.textSize18,
                                      color: AppColors.primary4C5BD4),
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
                              Column(
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
                                        fee,
                                        style: AppTextStyles.regular(
                                          context,
                                          size: AppDimens.textSize16,
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
                                        subject,
                                        style: AppTextStyles.regular(
                                          context,
                                          size: AppDimens.textSize16,
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
                                        address,
                                        style: AppTextStyles.regular(
                                          context,
                                          size: AppDimens.textSize16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Ngày dạy:',
                                        style: AppTextStyles.regular(context,
                                            size: AppDimens.textSize16,
                                            color: AppColors.grey747474),
                                      ),
                                      SizedBox(
                                        width: AppDimens.space4,
                                      ),
                                      Text(
                                        date,
                                        style: AppTextStyles.regular(
                                          context,
                                          size: AppDimens.textSize16,
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
                                        style: AppTextStyles.regular(context,
                                            size: AppDimens.textSize16,
                                            color: AppColors.grey747474),
                                      ),
                                      SizedBox(
                                        width: AppDimens.space6,
                                      ),
                                      Text(
                                        classId,
                                        style: AppTextStyles.regular(context,
                                            size: AppDimens.textSize16),
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
                                        style: AppTextStyles.regular(context,
                                            size: AppDimens.textSize16,
                                            color: AppColors.grey747474),
                                      ),
                                      SizedBox(
                                        width: AppDimens.space8,
                                      ),
                                      Text(
                                        methodTeach,
                                        style: AppTextStyles.regular(context,
                                            size: AppDimens.textSize16,
                                            color: AppColors.primary4C5BD4),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              itemCount: 10),
        ) : ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.space6, vertical: AppDimens.space6),
            child: SizedBox(
              height: AppDimens.height * 0.19,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  Positioned.fill(
                    left: 30,
                    child: Container(
                      padding: EdgeInsets.only(
                          left: AppDimens.space48,
                          top: AppDimens.space16,
                          right: AppDimens.space16,
                          bottom: AppDimens.space16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.whiteFFFFFF,
                          boxShadow: [
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
                                name,
                                style: AppTextStyles.regularW500(context,
                                    size: AppDimens.textSize14),
                              ),
                              SizedBox(
                                height: AppDimens.space6,
                              ),
                              RatingBar(
                                initialRating: rate.toDouble(),
                                itemSize: 12,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                ignoreGestures: true,
                                itemPadding:
                                EdgeInsets.symmetric(horizontal: 2.0),
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
                              Text(
                                subject,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
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
                                    address,
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
                                    Images.ic_money,
                                    color: AppColors.secondaryF8971C,
                                    width: 16,
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: AppDimens.space6,
                                  ),
                                  Text(
                                    fee,
                                    style: AppTextStyles.regular(context,
                                        size: AppDimens.textSize14,
                                        color: AppColors.secondaryF8971C),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: AppDimens.space10,),
                              Row(
                                children: [
                                  Spacer(),
                                  SizedBox(
                                    height: 30,
                                    width: 95,
                                    child: CustomButton2(
                                      title: 'Đề nghị dạy',
                                      color: AppColors.primary4C5BD4,
                                      onPressed: () {},
                                      textColor: AppColors.whiteFFFFFF,
                                    ),
                                  ),
                                  SizedBox(
                                    width: AppDimens.space20,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 95,
                                    child: CustomButton1(
                                      textColor: AppColors.secondaryF8971C,
                                      onPressed: () {},
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
                          imageUrl: image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
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
