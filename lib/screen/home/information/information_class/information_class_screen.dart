import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_button_3.dart';

class InformationClassScreen extends StatelessWidget {
  const InformationClassScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InformationClassController>(
      init: InformationClassController(),
      builder: (controller) => Scaffold(
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
                      vertical: AppDimens.space10,
                      horizontal: AppDimens.space20),
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
                          'Đang tìm gia sư',
                          style: AppTextStyles.regularW400(context,
                              size: AppDimens.textSize16,
                              color: AppColors.secondaryF8971C),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppDimens.space16,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.padding14,
                            vertical: AppDimens.padding8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Địa điểm:',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16,
                                  color: AppColors.grey747474),
                            ),
                            Text(
                              'Thanh Xuân, Hà Nội',
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
                              'Học Phí:',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16,
                                  color: AppColors.grey747474),
                            ),
                            Text(
                              '300.000 vnđ/giờ',
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
                              'Môn học:',
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
                              'Yêu cầu gia sư:',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16,
                                  color: AppColors.grey747474),
                            ),
                            Text(
                              'Sinh viên',
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
                              'Giới tính:',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16,
                                  color: AppColors.grey747474),
                            ),
                            Text(
                              'Nữ',
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
                  height: AppDimens.space10,
                ),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDimens.padding14,
                            vertical: AppDimens.padding8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Mã lớp:',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16,
                                  color: AppColors.grey747474),
                            ),
                            Text(
                              '1234',
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
                              'Hình thức:',
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
                              'Dạy lớp:',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16,
                                  color: AppColors.grey747474),
                            ),
                            Text(
                              '10',
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
                              'Số buổi:',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16,
                                  color: AppColors.grey747474),
                            ),
                            Text(
                              '10',
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
                              'Số giờ:',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16,
                                  color: AppColors.grey747474),
                            ),
                            Text(
                              '3',
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
                              'Số lượng học sinh:',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16,
                                  color: AppColors.grey747474),
                            ),
                            Text(
                              '3',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDimens.space10),
                  child: Text(
                    'Số buổi có thể học',
                    style: AppTextStyles.regularW500(context,
                        size: AppDimens.textSize20),
                  ),
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
                                        color: controller
                                                    .listbuoiday[index].sang ==
                                                1
                                            ? AppColors.secondaryF8971C
                                            : AppColors.whiteFFFFFF,
                                        textColor: controller
                                                    .listbuoiday[index].sang ==
                                                1
                                            ? AppColors.whiteFFFFFF
                                            : AppColors.grey747474,
                                        hasSide: controller
                                                    .listbuoiday[index].sang ==
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
                                        color: controller
                                                    .listbuoiday[index].chieu ==
                                                1
                                            ? AppColors.secondaryF8971C
                                            : AppColors.whiteFFFFFF,
                                        textColor: controller
                                                    .listbuoiday[index].chieu ==
                                                1
                                            ? AppColors.whiteFFFFFF
                                            : AppColors.grey747474,
                                        hasSide: controller
                                                    .listbuoiday[index].chieu ==
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
                                        color:
                                            controller.listbuoiday[index].toi ==
                                                    1
                                                ? AppColors.secondaryF8971C
                                                : AppColors.whiteFFFFFF,
                                        textColor:
                                            controller.listbuoiday[index].toi ==
                                                    1
                                                ? AppColors.whiteFFFFFF
                                                : AppColors.grey747474,
                                        hasSide:
                                            controller.listbuoiday[index].toi ==
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
                  height: AppDimens.space18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    SizedBox(
                      width: 140,
                      height: 35,
                      child: CustomButton2(
                        color: AppColors.primary4C5BD4,
                        title: 'Đề nghị dạy',
                        textColor: AppColors.whiteFFFFFF,
                        onPressed: () {},
                        hasRadius: true,
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 140,
                      height: 35,
                      child: CustomButton1(
                        color: AppColors.greyAAAAAA,
                        title: 'Lưu lớp học',
                        textColor: AppColors.secondaryF8971C,
                        onPressed: () {},
                        hasRadius: true,
                      ),
                    ),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
