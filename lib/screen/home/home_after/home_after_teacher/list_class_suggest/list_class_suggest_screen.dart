import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class ListClassSuggestScreen extends StatelessWidget {
  final String title;
  final String fee;
  final String subject;
  final String address;
  final String classId;
  final String methodTeach;
  final String date;
  final String status;

  const ListClassSuggestScreen(
      {Key key,
        this.title = 'Tìm gia sư có kinh nghiệm trên 3 năm dạy môn hoá học lớp 10',
        this.fee = '300.000 vnđ/giờ',
        this.subject = 'Hóa học lớp 10',
        this.address = 'Thanh Xuân, Hà Nội',
        this.classId = '01234',
        this.methodTeach = 'Gặp mặt',
        this.date = '05/07/2019',
        this.status = 'Đang tìm gia sư',})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyf6f6f6,
      appBar: AppBar(
        title: Text(
          'Lớp bạn đề nghị dạy',
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
                        SizedBox(
                          height: AppDimens.space12,
                        ),
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: AppDimens.space6,
                                horizontal: AppDimens.space12),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.primary4C5BD4,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Trạng thái:',
                                  style: AppTextStyles.regularW400(context,
                                      size: AppDimens.textSize16,
                                      color: AppColors.grey747474),
                                ),
                                SizedBox(
                                  width: AppDimens.space6,
                                ),
                                Text(
                                  status,
                                  style: AppTextStyles.regularW400(context,
                                      size: AppDimens.textSize16,
                                      color: AppColors.secondaryF8971C),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            itemCount: 5),
      ),
    );
  }
}
