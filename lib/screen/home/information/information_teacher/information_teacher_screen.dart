import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class InformationClassScreen extends StatelessWidget {
  const InformationClassScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyf6f6f6,
      appBar: AppBar(
        title: Text(
          'Chi tiết lớp học',
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
          padding: EdgeInsets.all(AppDimens.space16),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Tìm gia sư hóa học cho học sinh lớp 10 mất gốc Hoá',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.regularW500(context,
                      size: AppDimens.textSize20,
                      lineHeight: AppDimens.textSize22,
                      color: AppColors.primary4C5BD4),
                ),
              ),
              SizedBox(
                height: AppDimens.space14,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: AppDimens.space10, horizontal: AppDimens.space20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteFFFFFF,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(
                  'Cần gia sư có kinh nghiệm trên 2 năm, học sinh đang học lớp 10 bị mất kiến thức gốc, yêu cầu gia sư giảng dạy từ cơ bản đến nâng cao. Học viên mất tập trung khi học.Trả học phí sau cuối mỗi buổi dạy.',
                  style: AppTextStyles.regularW400(context,
                      size: AppDimens.textSize16,
                      lineHeight: AppDimens.textSize18),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: AppDimens.space16,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: AppDimens.space6, horizontal: AppDimens.space12),
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
                        'Đang tìm gia sư',
                        style: AppTextStyles.regularW400(context,
                            size: AppDimens.textSize16,
                            color: AppColors.secondaryF8971C),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppDimens.space16,),
              Container(
                padding: EdgeInsets.symmetric(vertical: AppDimens.space8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteFFFFFF,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: AppDimens.space14,horizontal: AppDimens.space20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mã lớp:',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                color: AppColors.grey747474),
                          ),
                          Text('1234', style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.grey747474,
                      thickness: 0.25,
                    ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: AppDimens.space14,horizontal: AppDimens.space20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hình thức:',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                color: AppColors.grey747474),
                          ),
                          Text('Gặp mặt',style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.grey747474,
                      thickness: 0.25,
                    ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: AppDimens.space14,horizontal: AppDimens.space20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dạy lớp:',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                color: AppColors.grey747474),
                          ),
                          Text('10',style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.grey747474,
                      thickness: 0.25,
                    ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: AppDimens.space14,horizontal: AppDimens.space20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Số buổi:',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                color: AppColors.grey747474),
                          ),
                          Text('10',style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.grey747474,
                      thickness: 0.25,
                    ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: AppDimens.space14,horizontal: AppDimens.space20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Số giờ:',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                color: AppColors.grey747474),
                          ),
                          Text('3',style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),),
                        ],
                      ),
                    ),
                    Divider(
                      color: AppColors.grey747474,
                      thickness: 0.25,
                    ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: AppDimens.space14,horizontal: AppDimens.space20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Số lượng học sinh:',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                color: AppColors.grey747474),
                          ),
                          Text('3',style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppDimens.space10,),
              Text(
                'Thông tin lớp học',
                style: AppTextStyles.regularW500(context,
                    size: AppDimens.textSize20),
              ),
              SizedBox(
                height: AppDimens.space10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: AppDimens.space8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteFFFFFF,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: AppDimens.space14,horizontal: AppDimens.space20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mã lớp:',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                color: AppColors.grey747474),
                          ),
                          Text('1234', style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),),
                        ],
                      ),
                    ),
                    // Divider(
                    //   color: AppColors.grey747474,
                    //   thickness: 0.25,
                    // ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: AppDimens.space14,horizontal: AppDimens.space20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hình thức:',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                color: AppColors.grey747474),
                          ),
                          Text('Gặp mặt',style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),),
                        ],
                      ),
                    ),
                    // Divider(
                    //   color: AppColors.grey747474,
                    //   thickness: 0.25,
                    // ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: AppDimens.space14,horizontal: AppDimens.space20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dạy lớp:',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                color: AppColors.grey747474),
                          ),
                          Text('10',style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),),
                        ],
                      ),
                    ),
                    // Divider(
                    //   color: AppColors.grey747474,
                    //   thickness: 0.25,
                    // ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: AppDimens.space14,horizontal: AppDimens.space20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Số buổi:',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                color: AppColors.grey747474),
                          ),
                          Text('10',style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),),
                        ],
                      ),
                    ),
                    // Divider(
                    //   color: AppColors.grey747474,
                    //   thickness: 0.25,
                    // ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: AppDimens.space14,horizontal: AppDimens.space20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Số giờ:',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                color: AppColors.grey747474),
                          ),
                          Text('3',style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),),
                        ],
                      ),
                    ),
                    // Divider(
                    //   color: AppColors.grey747474,
                    //   thickness: 0.25,
                    // ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(vertical: AppDimens.space14,horizontal: AppDimens.space20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Số lượng học sinh:',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize16,
                                color: AppColors.grey747474),
                          ),
                          Text('3',style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
