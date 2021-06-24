import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/authen/change_password/change_password_screen.dart';
import 'package:giasu_vn/screen/information/information_parent/update_info_parent_controller.dart';
import 'package:giasu_vn/screen/information/information_parent/update_info_parent_screen.dart';
import 'package:giasu_vn/screen/information/information_teacher/update_info_teacher_controller.dart';
import 'package:giasu_vn/screen/information/information_teacher/update_info_teacher_step1_screen.dart';
import 'package:giasu_vn/screen/settings/information_teacher.dart';
import 'package:giasu_vn/screen/settings/settings_controller.dart';
import 'package:sp_util/sp_util.dart';

class SettingsScreen extends StatelessWidget {
  UpdateInformationParentController updateInformationParentController = Get.put(UpdateInformationParentController());
  UpdateInfoTeacherController updateInfoTeacherController = Get.put(UpdateInfoTeacherController());

  SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          backgroundColor: AppColors.primary4C5BD4,
          title: Text(
            'Cài đặt',
            style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
          ),
        ),
        body: SingleChildScrollView(
          child: controller.resultGetInfoParent.data != null || controller.resultGetInfoTeacher.data != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDimens.space16, vertical: AppDimens.space20),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // controller.user == '1' ? Get.to(UpdateInformationParentScreen()) : Get.to(UpdateInfoTeacherStep1Screen());
                          controller.user == '1' ? updateInformationParentController.getInfoParent() : updateInfoTeacherController.getInfoTeacher();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: AppDimens.space20, vertical: AppDimens.space30),
                          decoration: BoxDecoration(color: AppColors.whiteFFFFFF, borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: controller.user == '1' ? controller.resultGetInfoParent.data.data.ugsAvatar : controller.resultGetInfoTeacher.data.infoTutor.ugsAvatar,
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                              SizedBox(
                                width: AppDimens.space4,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.user == '1' ? controller.resultGetInfoParent.data.data.ugsName : controller.resultGetInfoTeacher.data.infoTutor.ugsName,
                                      style: AppTextStyles.regularW500(context, size: AppDimens.textSize22),
                                    ),
                                    SizedBox(
                                      height: AppDimens.space4,
                                    ),
                                    Text(
                                      controller.user == '1' ? controller.resultGetInfoParent.data.data.ugsEmail : controller.resultGetInfoTeacher.data.infoTutor.ugsEmail,
                                      style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.grey747474),
                                    ),
                                    SizedBox(
                                      height: AppDimens.space10,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: AppDimens.space16, vertical: AppDimens.space2),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 0.5,
                                          color: AppColors.grey747474,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        'Chỉnh sửa thông tin',
                                        style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.secondaryF8971C),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.space10,
                      ),
                      controller.user == '1'
                          ? Container(
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Họ và tên:',
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                      ),
                                      Text(
                                        controller.resultGetInfoParent.data.data.ugsName,
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppDimens.space20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Số điện thoại:',
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                      ),
                                      Text(
                                        controller.resultGetInfoParent.data.data.ugsPhone,
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppDimens.space20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Giới tính:',
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                      ),
                                      Text(
                                        controller.resultGetInfoParent.data.data.ugsGender,
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppDimens.space20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Ngày sinh:',
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                      ),
                                      Text(
                                        controller.resultGetInfoParent.data.data.ugsBrithday,
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppDimens.space20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tỉnh, thành phố:',
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                      ),
                                      Text(
                                        controller.resultGetInfoParent.data.data.citName,
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppDimens.space20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Địa chỉ:',
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                      ),
                                      Text(
                                        controller.resultGetInfoParent.data.data.ugsAddress,
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container(
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Họ và tên:',
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                      ),
                                      Text(
                                        controller.resultGetInfoTeacher.data.infoTutor.ugsName,
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppDimens.space20,
                                  ),
                                  Row(
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Tỉnh, thành phố:',
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
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Địa chỉ:',
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                      ),
                                      Text(
                                        controller.resultGetInfoTeacher.data.infoTutor.ugsAddress,
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppDimens.space20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Trường học:',
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                      ),
                                      Text(
                                        controller.resultGetInfoTeacher.data.infoTutor.ugsSchool,
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppDimens.space20,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () => Get.to(InformationTeacherMore()),
                                      child: Text(
                                        'Xem thêm...',
                                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.secondaryF8971C),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      SizedBox(
                        height: AppDimens.space16,
                      ),
                      Divider(
                        thickness: 1,
                        color: AppColors.black12,
                      ),
                      SizedBox(
                        height: AppDimens.space16,
                      ),
                      Text(
                        'Chung',
                        style: AppTextStyles.regularW700(
                          context,
                          size: AppDimens.textSize18,
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.space30,
                      ),
                      InkWell(
                        onTap: () => Get.to(ChangePasswordScreen()),
                        child: Text(
                          'Đổi mật khẩu',
                          style: AppTextStyles.regularW400(context, size: AppDimens.textSize16),
                        ),
                      ),
                      SizedBox(
                        height: AppDimens.space20,
                      ),
                      InkWell(
                        onTap: () => Get.offAllNamed(Routes.select_type_login),
                        child: Text(
                          'Đăng xuất',
                          style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.redFF0033),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  width: AppDimens.width,
                  height: AppDimens.height,
                  alignment: Alignment.center,
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.whiteFFFFFF,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
