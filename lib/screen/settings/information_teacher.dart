import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/settings/settings_controller.dart';

class InformationTeacherMore extends StatelessWidget {
  const InformationTeacherMore({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
        init: SettingsController(),
        builder: (controller) => Scaffold(
              backgroundColor: AppColors.greyf6f6f6,
              appBar: AppBar(
                backgroundColor: AppColors.primary4C5BD4,
                title: Text(
                  'Thông tin cá nhân',
                  style:
                      AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: AppDimens.space10, horizontal: AppDimens.padding16),
                  decoration: BoxDecoration(color: AppColors.whiteFFFFFF, borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thông tin cơ bản',
                        style: AppTextStyles.regularW700(
                          context,
                          size: AppDimens.textSize18,
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Họ và tên:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Expanded(
                            child: Text(
                              controller.resultGetInfoTeacher.data.infoTutor.ugsName,
                              style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.right,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Số điện thoại:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Text(
                            controller.resultGetInfoTeacher.data.infoTutor.ugsPhone,
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Giới tính:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Text(
                            controller.resultGetInfoTeacher.data.infoTutor.ugsGender,
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ngày sinh:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Text(
                            controller.resultGetInfoTeacher.data.infoTutor.ugsBrithday,
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tỉnh, thành phố:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Text(
                            controller.resultGetInfoTeacher.data.infoTutor.citName == null ? 'Chưa cập nhật' : controller.resultGetInfoTeacher.data.infoTutor.citName,
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Địa chỉ:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Expanded(
                            child: Text(
                              controller.resultGetInfoTeacher.data.infoTutor.ugsAddress,
                              style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.right,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Trường học:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Expanded(
                            child: Text(
                              controller.resultGetInfoTeacher.data.infoTutor.ugsSchool,
                              style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.right,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: AppColors.grey747474), borderRadius: BorderRadius.circular(AppDimens.space10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Kinh nghiệm giảng dạy',
                              style: AppTextStyles.regularW700(context, size: AppDimens.textSize16, color: AppColors.black),
                            ),
                            SizedBox(
                              height: AppDimens.space10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tiêu đề:',
                                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                ),
                                Expanded(
                                  child: Text(
                                    controller.resultGetInfoTeacher.data.infoTutor.ugsTitle,
                                    style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.right,
                                    maxLines: null,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppDimens.space20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Thời gian:',
                                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                ),
                                Text(
                                  '${controller.resultGetInfoTeacher.data.infoTutor.ugsYearStart}~${controller.resultGetInfoTeacher.data.infoTutor.ugsYearEnd}',
                                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppDimens.space20,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mô tả:',
                                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                ),
                                Expanded(
                                  child: Text(
                                    controller.resultGetInfoTeacher.data.infoTutor.ugsJobDescription,
                                    style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                    overflow: TextOverflow.clip,
                                    textAlign: TextAlign.right,
                                    maxLines: null,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Thành tích bản thân:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Expanded(
                            child: Text(
                              controller.resultGetInfoTeacher.data.infoTutor.ugsAchievements,
                              style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.right,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nơi công tác hiện tại:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Expanded(
                            child: Text(
                              controller.resultGetInfoTeacher.data.infoTutor.ugsWorkplace,
                              style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.right,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Mô tả về bản thân:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Expanded(
                            child: Text(
                              controller.resultGetInfoTeacher.data.infoTutor.ugsAboutUs,
                              style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.right,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Kiểu gia sư:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Text(
                            controller.resultGetInfoTeacher.data.infoTutor.nametype,
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Môn học giảng dạy:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Expanded(
                            child: Text(
                              controller.resultGetInfoTeacher.data.infoTutor.asName.join(', '),
                              style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.right,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Môn học chi tiết:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Expanded(
                            child: Text(
                              controller.resultGetInfoTeacher.data.infoTutor.asDetail.join(', '),
                              style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.right,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Lớp học giảng dạy:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Text(
                            controller.resultGetInfoTeacher.data.infoTutor.ctName,
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hình thức giảng dạy:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Text(
                            controller.resultGetInfoTeacher.data.infoTutor.ugsFormality,
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Khu vực giảng dạy:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Text(
                            controller.resultGetInfoTeacher.data.infoTutor.citName,
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quận huyện:',
                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                          ),
                          Expanded(
                            child: Text(
                              controller.resultGetInfoTeacher.data.infoTutor.citDetail.join(', '),
                              style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.right,
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: AppColors.grey747474), borderRadius: BorderRadius.circular(AppDimens.space10)),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                            Text(
                              'Học phí giảng dạy',
                              style: AppTextStyles.regularW500(context, size: AppDimens.textSize18, color: AppColors.black),
                            ),
                            SizedBox(
                              height: AppDimens.space10,
                            ),
                            // controller.resultGetInfoTeacher.data.infoTutor.ugsSalary == ''
                            //     ? Row(
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           Text(
                            //             'Cố định:',
                            //             style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                            //           ),
                            //           Text(
                            //             '${controller.resultGetInfoTeacher.data.infoTutor.ugsUnitPrice}/${controller.resultGetInfoTeacher.data
                            //                 .infoTutor.ugsTime}',
                            //             style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                            //           ),
                            //         ],
                            //       )
                            //     :
                            Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Học phí:',
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                      ),
                                      Expanded(
                                        child: Text(
                                          '${controller.resultGetInfoTeacher.data.infoTutor.tutorSalary}/${controller.resultGetInfoTeacher.data.infoTutor
                                              .tutorMonth}',
                                          style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                          overflow: TextOverflow.clip,
                                          textAlign: TextAlign.right,
                                          maxLines: null,
                                        ),
                                      ),
                                    ],
                                  ),
                          ])),
                    ],
                  ),
                ),
              ),
            ));
  }
}
