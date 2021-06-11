import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';

class ListPostCreatedScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyf6f6f6,
      appBar: AppBar(
        title: Text(
          'Lớp bạn đã lưu',
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
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: AppDimens.space16, vertical: AppDimens.space6),
        width: AppDimens.width,
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(bottom: 10),
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
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.regularW500(context,
                        size: AppDimens.textSize18,
                        color: AppColors.primary4C5BD4),
                  ),
                  SizedBox(
                    height: AppDimens.space6,
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
                                style: AppTextStyles.regular(context,
                                    size: AppDimens.textSize16,
                                    color: AppColors.secondaryF8971C),
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
                                'Ngày đăng:',
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
                                style: AppTextStyles.regular(
                                  context,
                                  size: AppDimens.textSize16,
                                  color: AppColors.primary4C5BD4
                                ),
                              ),
                            ],
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
                              title: 'Chỉnh sửa',
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
                              textColor: AppColors.black,
                              onPressed: () {},
                              color: AppColors.grey747474,
                              title: 'Xoá bài',
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
        ),
      ),
    );
  }
}