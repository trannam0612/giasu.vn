import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_controller.dart';
import 'package:giasu_vn/screen/information/information_teacher/update_info_teacher_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_button_3.dart';
import 'package:giasu_vn/widgets/custom_search_textfield.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';
import 'package:giasu_vn/widgets/drop_down_select.dart';

class UpdateInfoTeacherStep2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateInfoTeacherController>(
        init: UpdateInfoTeacherController(),
        builder: (controller) => GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: AppColors.greyf6f6f6,
                  appBar: AppBar(
                    backgroundColor: AppColors.primary4C5BD4,
                    title: Text(
                      'Cập nhật thông tin',
                      style: AppTextStyles.regularW500(context,
                          size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
                    ),
                    leading: IconButton(
                      icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.all(AppDimens.padding16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3. Thông tin giảng dạy (Gia sư)',
                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize18, color: AppColors.secondaryF8971C),
                          ),
                          SizedBox(
                            height: AppDimens.space20,
                          ),
                          DropDownSelect(
                            obligatory: true,
                            title: 'Kiểu gia sư',
                            isTitle: true,
                            hint: 'Chọn kiểu gia sư',
                            dropdownValue: controller.selectedKieuGS,
                            onChanged: (String value) => controller.onSelectedKieuGS(value),
                            list: controller.listKieuGS,
                            borderColor: controller.errorKieuGS ? AppColors.redFF0033 : AppColors.grey747474,
                          ),
                          controller.errorKieuGS
                              ? Padding(
                                  padding: const EdgeInsets.only(top: AppDimens.space4),
                                  child: Text(
                                    'Trường bắt buộc!',
                                    style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: AppDimens.space20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Môn học giảng dạy ',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '*',
                                  style: AppTextStyles.regularW400(context,
                                      size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.redEB5757),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppDimens.space4,
                          ),
                          InkWell(
                            onTap: () => controller.listSubjectSelect.length < 3 ? Get.to(SelectSubjectGSScreen(context)) : null,
                            child: Container(
                                constraints: BoxConstraints(
                                  minHeight: 50,
                                  minWidth: double.infinity,
                                ),
                                padding: EdgeInsets.all(AppDimens.padding8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppDimens.space10),
                                    border: Border.all(color: controller.errorSubject ? AppColors.redFF0033 : AppColors.grey747474, width: 1)),
                                child: controller.listSubjectSelect.isNotEmpty
                                    ? GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.listSubjectSelect.length,
                                        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: AppDimens.width * 0.5,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          mainAxisExtent: AppDimens.space32,
                                        ),
                                        itemBuilder: (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              controller.listSubjectSelect.remove(controller.listSubjectSelect[index]);
                                              controller.update();
                                            },
                                            child: Container(
                                              alignment: Alignment.topCenter,
                                              padding: EdgeInsets.symmetric(horizontal: AppDimens.padding12, vertical: AppDimens.space8),
                                              decoration: BoxDecoration(
                                                  color: AppColors.whiteF2F2F2, borderRadius: BorderRadius.circular(AppDimens.padding16)),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      controller.listSubjectSelect[index].asName,
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: AppTextStyles.regularW400(context, size: AppDimens.textSize14),
                                                    ),
                                                    flex: 8,
                                                  ),
                                                  // Spacer(),
                                                  Flexible(flex: 2, child: SvgPicture.asset(Images.ic_close))
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Row(
                                        children: [
                                          Text(
                                            'Chọn môn học',
                                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                          ),
                                          Spacer(),
                                          SvgPicture.asset(
                                            Images.ic_arrow_down,
                                            color: AppColors.black12,
                                          )
                                        ],
                                      )),
                          ),
                          controller.errorSubject
                              ? Padding(
                                  padding: const EdgeInsets.only(top: AppDimens.space4),
                                  child: Text(
                                    'Trường bắt buộc!',
                                    style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: AppDimens.space8,
                          ),
                          Text(
                            'Lưu ý :Chỉ chọn tối đa 3 môn học',
                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize10, color: AppColors.redEB5757),
                          ),
                          SizedBox(
                            height: AppDimens.space20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Môn học chi tiết ',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '*',
                                  style: AppTextStyles.regularW400(context,
                                      size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.redEB5757),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppDimens.space4,
                          ),
                          InkWell(
                              onTap: () {
                                controller.listSubjectSelectTopic.length < 5 ? Get.to(SelectTopicSubjectGSScreen(context)) : null;
                              },
                              child: Container(
                                  constraints: BoxConstraints(
                                    minHeight: 50,
                                    minWidth: double.infinity,
                                  ),
                                  padding: EdgeInsets.all(AppDimens.padding8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(AppDimens.space10),
                                      border: Border.all(color: controller.errorSubjectTopic ? AppColors.redFF0033 : AppColors.grey747474, width: 1)),
                                  child: controller.listSubjectSelectTopic.isNotEmpty
                                      ? GridView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller.listSubjectSelectTopic.length,
                                          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent: AppDimens.width * 0.5,
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10,
                                            mainAxisExtent: AppDimens.space32,
                                          ),
                                          itemBuilder: (BuildContext context, int index) {
                                            return InkWell(
                                              onTap: () {
                                                controller.listSubjectSelectTopic.remove(controller.listSubjectSelectTopic[index]);
                                                controller.update();
                                              },
                                              child: Container(
                                                alignment: Alignment.topCenter,
                                                padding: EdgeInsets.symmetric(horizontal: AppDimens.padding12, vertical: AppDimens.space8),
                                                decoration: BoxDecoration(
                                                    color: AppColors.whiteF2F2F2, borderRadius: BorderRadius.circular(AppDimens.padding16)),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        controller.listSubjectSelectTopic[index].nameSubject,
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        style: AppTextStyles.regularW400(context, size: AppDimens.textSize14),
                                                      ),
                                                      flex: 8,
                                                    ),
                                                    // Spacer(),
                                                    Flexible(flex: 2, child: SvgPicture.asset(Images.ic_close))
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        )
                                      : Row(
                                          children: [
                                            Text(
                                              'Chọn môn học chi tiêt',
                                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                            ),
                                            Spacer(),
                                            SvgPicture.asset(
                                              Images.ic_arrow_down,
                                              color: AppColors.black12,
                                            )
                                          ],
                                        ))),
                          controller.errorSubjectTopic
                              ? Padding(
                                  padding: const EdgeInsets.only(top: AppDimens.space4),
                                  child: Text(
                                    'Trường bắt buộc!',
                                    style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: AppDimens.space8,
                          ),
                          Text(
                            'Lưu ý :Chỉ chọn tối đa 5 môn học chi tiết',
                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize10, color: AppColors.redEB5757),
                          ),
                          SizedBox(
                            height: AppDimens.space20,
                          ),
                          DropDownSelect(
                            title: 'Lớp học giảng dạy',
                            isTitle: true,
                            obligatory: true,
                            hint: 'Chọn lớp học giảng dạy',
                            dropdownValue: controller.selectedClass,
                            onChanged: (String value) => controller.onSelectedClass(value),
                            list: listDataClass.map((e) => e.ctName).toList(),
                            borderColor: controller.errorClass ? AppColors.redFF0033 : AppColors.grey747474,
                          ),
                          controller.errorClass
                              ? Padding(
                                  padding: const EdgeInsets.only(top: AppDimens.space4),
                                  child: Text(
                                    'Trường bắt buộc!',
                                    style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: AppDimens.space20,
                          ),
                          DropDownSelect(
                            title: 'Hình thức giảng dạy',
                            isTitle: true,
                            obligatory: true,
                            hint: 'Chọn hình thức giảng dạy',
                            dropdownValue: controller.selectedFormTeaching,
                            onChanged: (String value) => controller.onSelectedFormTeaching(value),
                            list: controller.listFormTeaching,
                            borderColor: controller.errorFormTeaching ? AppColors.redFF0033 : AppColors.grey747474,
                          ),
                          controller.errorFormTeaching
                              ? Padding(
                                  padding: const EdgeInsets.only(top: AppDimens.space4),
                                  child: Text(
                                    'Trường bắt buộc!',
                                    style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: AppDimens.space20,
                          ),
                          CustomTextField(
                            onTapTextField: () {
                              controller.changeSearchProvincial('');
                              Get.to(SelectTinhThanh(context));
                            },
                            readOnly: true,
                            isShowIcon: true,
                            obligatory: true,
                            textEditingController: controller.area,
                            onPressed: () {},
                            title: 'Khu vực giảng dạy',
                            hintText: 'Chọn tỉnh, thành phố',
                            iconSuffix: Images.ic_arrow_down,
                            error: controller.checkArea(),
                          ),
                          SizedBox(
                            height: AppDimens.space20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Quận huyện ',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '*',
                                  style: AppTextStyles.regularW400(context,
                                      size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.redEB5757),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppDimens.space4,
                          ),
                          InkWell(
                            onTap: () => controller.listDistrictSelect.length < 5 ? Get.to(SelectDistrict(context)) : null,
                            child: Container(
                                constraints: BoxConstraints(minHeight: 50, minWidth: double.infinity, maxHeight: AppDimens.height * 0.25),
                                padding: EdgeInsets.all(AppDimens.padding12),
                                decoration: BoxDecoration(
                                    color: AppColors.whiteFFFFFF,
                                    borderRadius: BorderRadius.circular(AppDimens.space10),
                                    border: Border.all(color: controller.errorDistrictArea ? AppColors.redFF0033 : AppColors.grey747474, width: 1)),
                                child: controller.listDistrictSelect.isNotEmpty
                                    ? GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: controller.listDistrictSelect.length,
                                        gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: AppDimens.width * 0.5,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10,
                                          mainAxisExtent: AppDimens.space32,
                                        ),
                                        itemBuilder: (BuildContext context, int index) {
                                          return InkWell(
                                            onTap: () {
                                              controller.listDistrictSelect.remove(controller.listDistrictSelect[index]);
                                              controller.update();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(horizontal: AppDimens.padding12, vertical: AppDimens.space8),
                                              decoration: BoxDecoration(
                                                  color: AppColors.whiteF2F2F2, borderRadius: BorderRadius.circular(AppDimens.padding16)),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    child: Text(
                                                      controller.listDistrictSelect[index],
                                                      overflow: TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: AppTextStyles.regularW400(context, size: AppDimens.textSize14),
                                                    ),
                                                    width: AppDimens.width * 0.27,
                                                  ),
                                                  Spacer(),
                                                  SvgPicture.asset(Images.ic_close)
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : Row(
                                        children: [
                                          Text(
                                            'Chọn quận huyện',
                                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                                          ),
                                          Spacer(),
                                          SvgPicture.asset(
                                            Images.ic_arrow_down,
                                            color: AppColors.black12,
                                          )
                                        ],
                                      )),
                          ),
                          controller.errorDistrictArea
                              ? Padding(
                                  padding: const EdgeInsets.only(top: AppDimens.space4),
                                  child: Text(
                                    'Trường bắt buộc!',
                                    style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: AppDimens.space8,
                          ),
                          Text(
                            'Lưu ý :Chỉ chọn tối đa 5 quận huyện',
                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize10, color: AppColors.redEB5757),
                          ),
                          SizedBox(
                            height: AppDimens.space20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Học phí giảng dạy ',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '*',
                                  style: AppTextStyles.regularW400(context,
                                      size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.redEB5757),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppDimens.space4,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: AppDimens.height * 0.06,
                                  child: TextButton(
                                    onPressed: () {
                                      controller.changValueButtonLuong();
                                    },
                                    child: Text(
                                      'Cố định',
                                      style: AppTextStyles.regularW700(context,
                                          size: AppDimens.textSize16, color: controller.valueButtonLuong ? AppColors.whiteFFFFFF : AppColors.black12),
                                      textAlign: TextAlign.center,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: controller.valueButtonLuong ? AppColors.primary4C5BD4 : AppColors.whiteFFFFFF,
                                      padding: EdgeInsets.all(AppDimens.space8),
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1, color: AppColors.primary4C5BD4),
                                        borderRadius: BorderRadius.all(Radius.circular(AppDimens.space10)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: AppDimens.padding8,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: AppDimens.height * 0.06,
                                  child: TextButton(
                                    onPressed: () {
                                      controller.changValueButtonLuong();
                                    },
                                    child: Text(
                                      'Ước lượng',
                                      style: AppTextStyles.regularW700(context,
                                          size: AppDimens.textSize16, color: controller.valueButtonLuong ? AppColors.black12 : AppColors.whiteFFFFFF),
                                      textAlign: TextAlign.center,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: controller.valueButtonLuong ? AppColors.whiteFFFFFF : AppColors.primary4C5BD4,
                                      padding: EdgeInsets.all(AppDimens.space8),
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(width: 1, color: AppColors.primary4C5BD4),
                                          borderRadius: BorderRadius.all(Radius.circular(AppDimens.space10))),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppDimens.space8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: controller.valueButtonLuong
                                      ? CustomTextField(
                                          error: controller.checkSalaryCD(),
                                          textEditingController: controller.salaryCD,
                                          obligatory: false,
                                          isTitle: false,
                                          keyboardType: TextInputType.number,
                                          onPressed: () {},
                                          title: '',
                                          hintText: '1.000.000VNĐ',
                                          isPassword: false,
                                        )
                                      : Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: CustomTextField(
                                                error: controller.checkSalaryUL1(),
                                                textEditingController: controller.salaryUL1,
                                                obligatory: false,
                                                isTitle: false,
                                                onPressed: () {},
                                                title: '',
                                                keyboardType: TextInputType.number,
                                                hintText: '1.000.000VNĐ',
                                                isPassword: false,
                                              ),
                                            ),
                                            // Align(
                                            //   alignment: Alignment.topCenter,
                                            //   child: Text(
                                            //     '~',
                                            //     style: AppTextStyles.regularW700(context, size: AppDimens.textSize20, color: AppColors.black12),
                                            //   ),
                                            // ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: CustomTextField(
                                                error: controller.checkSalaryUL2(),
                                                textEditingController: controller.salaryUL2,
                                                obligatory: false,
                                                isTitle: false,
                                                keyboardType: TextInputType.number,
                                                onPressed: () {},
                                                title: '',
                                                hintText: '6.000.000VNĐ',
                                                isPassword: false,
                                              ),
                                            ),
                                          ],
                                        )),
                              SizedBox(
                                width: AppDimens.smallPadding10,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                padding: EdgeInsets.symmetric(horizontal: AppDimens.space4),
                                height: 52,
                                decoration: BoxDecoration(
                                    color: AppColors.whiteFFFFFF,
                                    borderRadius: BorderRadius.circular(AppDimens.space10),
                                    border: Border.all(width: 1, color: AppColors.grey747474)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Text(
                                      'Giờ',
                                      style: AppTextStyles.regularW500(context, size: AppDimens.padding16, color: AppColors.grey747474),
                                    ),
                                    style: AppTextStyles.regularW500(context, size: AppDimens.padding16, color: AppColors.black),
                                    icon: SvgPicture.asset(
                                      Images.ic_arrow_down,
                                      color: AppColors.black12,
                                    ),
                                    value: controller.selectedStatusFee,
                                    onChanged: (value) => controller.onSelectedStatusFee(value),
                                    dropdownColor: AppColors.whiteFFFFFF,
                                    elevation: 10,
                                    items: controller.listLuong.map((selectedType) {
                                      return DropdownMenuItem(
                                        child: new Text(
                                          selectedType,
                                        ),
                                        value: selectedType,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          controller.errorLuong
                              ? Padding(
                                  padding: const EdgeInsets.only(top: AppDimens.space4),
                                  child: Text(
                                    'Lương bắt đầu phải nhỏ hơn lương kết thúc!',
                                    style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: AppDimens.space8,
                          ),
                          Text(
                            'Lưu ý : Học phí tính VNĐ/ ${controller.selectedStatusFee} ',
                            style: AppTextStyles.regularW400(context, size: AppDimens.textSize10, color: AppColors.redEB5757),
                          ),
                          SizedBox(
                            height: AppDimens.space20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Buổi có thể dạy ',
                              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '*',
                                  style: AppTextStyles.regularW400(context,
                                      size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.redEB5757),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: controller.errorBuoiDay ? Border.all(color: AppColors.redFF0033, width: 1) : null,
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
                              padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: AppDimens.smallPadding10),
                                    child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) => Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  controller.listbuoiday[index].thu,
                                                  textAlign: TextAlign.center,
                                                  style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.black),
                                                ),
                                                Spacer(),
                                                CustomButton3(
                                                  title: 'Sáng',
                                                  onPressed: () {
                                                    controller.errorBuoiDay = false;
                                                    controller.listbuoiday[index].sang = controller.listbuoiday[index].sang == "0" ? "1" : "0";
                                                    controller.update();
                                                    // controller.update();
                                                  },
                                                  color:
                                                      controller.listbuoiday[index].sang == "1" ? AppColors.secondaryF8971C : AppColors.whiteFFFFFF,
                                                  textColor: controller.listbuoiday[index].sang == "1" ? AppColors.whiteFFFFFF : AppColors.grey747474,
                                                  hasSide: controller.listbuoiday[index].sang == "1" ? false : true,
                                                ),
                                                SizedBox(
                                                  width: AppDimens.padding16,
                                                ),
                                                CustomButton3(
                                                  title: 'Chiều',
                                                  onPressed: () {
                                                    controller.errorBuoiDay = false;
                                                    controller.listbuoiday[index].chieu = controller.listbuoiday[index].chieu == "0" ? "1" : "0";
                                                    controller.update();
                                                    // controller.update();
                                                  },
                                                  color:
                                                      controller.listbuoiday[index].chieu == "1" ? AppColors.secondaryF8971C : AppColors.whiteFFFFFF,
                                                  textColor:
                                                      controller.listbuoiday[index].chieu == "1" ? AppColors.whiteFFFFFF : AppColors.grey747474,
                                                  hasSide: controller.listbuoiday[index].chieu == "1" ? false : true,
                                                ),
                                                SizedBox(
                                                  width: AppDimens.padding16,
                                                ),
                                                CustomButton3(
                                                  title: 'Tối',
                                                  onPressed: () {
                                                    controller.errorBuoiDay = false;
                                                    controller.listbuoiday[index].toi = controller.listbuoiday[index].toi == "0" ? "1" : "0";
                                                    controller.update();
                                                  },
                                                  color: controller.listbuoiday[index].toi == "1" ? AppColors.secondaryF8971C : AppColors.whiteFFFFFF,
                                                  textColor: controller.listbuoiday[index].toi == "1" ? AppColors.whiteFFFFFF : AppColors.grey747474,
                                                  hasSide: controller.listbuoiday[index].toi == "1" ? false : true,
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
                          controller.errorBuoiDay
                              ? Padding(
                                  padding: const EdgeInsets.only(top: AppDimens.space4),
                                  child: Text(
                                    'Trường bắt buộc!',
                                    style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: AppDimens.padding20,
                          ),
                          SizedBox(
                            width: AppDimens.width,
                            height: AppDimens.height * 0.07,
                            child: CustomButton2(
                              onPressed: () {
                                controller.checkButtonStep3();
                              },
                              title: 'Cập nhật',
                              textColor: AppColors.whiteFFFFFF,
                              color: AppColors.primary4C5BD4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}

Widget SelectSubjectGSScreen(BuildContext context) {
  return GetBuilder<UpdateInfoTeacherController>(
      init: UpdateInfoTeacherController(),
      builder: (controller) => SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.greyf6f6f6,
              appBar: AppBar(
                backgroundColor: AppColors.primary4C5BD4,
                title: Text(
                  'Môn học',
                  style:
                      AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
                ),
                leading: IconButton(
                  icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(vertical: AppDimens.space32, horizontal: AppDimens.padding16),
                child: ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                          // ignore: deprecated_member_use
                          onTap: () {
                            controller.onSelectSubject(listDataSubject[index]);
                            controller.listSubjectSelectTopic.clear();
                            controller.getListTopic(controller.listSubjectSelect.map((e) => e.asId).join(','));
                            Get.back();
                          },
                          child: SizedBox(
                            height: 30,
                            child: Row(
                              children: [
                                Text(
                                  listDataSubject[index].asName,
                                  style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                                ),
                                Spacer(),
                                controller.listSubjectSelect.map((e) => e).contains(listDataSubject[index])
                                    ? SvgPicture.asset(Images.ic_check_green)
                                    : Container()
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                          color: AppColors.black12,
                        ),
                    itemCount: listDataSubject.length),
              ),
            ),
          ));
}

Widget SelectTopicSubjectGSScreen(BuildContext context) {
  return GetBuilder<UpdateInfoTeacherController>(
      init: UpdateInfoTeacherController(),
      builder: (controller) => SafeArea(
            child: Scaffold(
              backgroundColor: AppColors.greyf6f6f6,
              appBar: AppBar(
                backgroundColor: AppColors.primary4C5BD4,
                title: Text(
                  'Môn học chi tiết',
                  style:
                      AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
                ),
                leading: IconButton(
                  icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(vertical: AppDimens.space32, horizontal: AppDimens.padding16),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => InkWell(
                          // ignore: deprecated_member_use
                          onTap: () {
                            controller.onSelectSubjectTopic(controller.listTopic[index]);
                            Get.back();
                          },
                          child: SizedBox(
                            height: 30,
                            child: Row(
                              children: [
                                Text(
                                  controller.listTopic[index].nameSubject,
                                  style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                                ),
                                Spacer(),
                                controller.listSubjectSelectTopic.map((e) => e.nameSubject).contains(controller.listTopic[index].nameSubject)
                                    ? SvgPicture.asset(Images.ic_check_green)
                                    : Container()
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1,
                          color: AppColors.black12,
                        ),
                    itemCount: controller.listTopic.length),
              ),
            ),
          ));
}

Widget SelectTinhThanh(BuildContext context) {
  UpdateInfoTeacherController updateInfoTeacherController = Get.put(UpdateInfoTeacherController());
  // List<String> list = ['Hà Nội', 'Hưng Yên', 'Thái Bình', 'Thanh Hóa'];
  return SafeArea(
      child: Scaffold(
    backgroundColor: AppColors.greyf6f6f6,
    appBar: AppBar(
      backgroundColor: AppColors.primary4C5BD4,
      title: Text(
        'TỈNH, THÀNH PHỐ',
        style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
      ),
      leading: IconButton(
        icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
        onPressed: () {
          Get.back();
        },
      ),
    ),
    body: Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchTextField(
              readOnly: false,
              textEditingController: updateInfoTeacherController.search,
              onChanged: (value) {
                updateInfoTeacherController.changeSearchProvincial(value);
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: AppDimens.space32, horizontal: AppDimens.padding16),
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                        // ignore: deprecated_member_use
                        onTap: () {
                          updateInfoTeacherController.area.text = updateInfoTeacherController.listProvincial[index].citName;
                          updateInfoTeacherController.idValueArea = int.parse(updateInfoTeacherController.listProvincial[index].citId);
                          updateInfoTeacherController.listDistrictSelect.clear();
                          updateInfoTeacherController.listIdDetailDistrictSelect.clear();
                          updateInfoTeacherController.getListDistrictArea(updateInfoTeacherController.idValueArea);
                          Get.back();
                        },
                        child: SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              Text(
                                updateInfoTeacherController.listProvincial[index].citName,
                                style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                              ),
                              Spacer(),
                              updateInfoTeacherController.listProvincial[index].citName == updateInfoTeacherController.area.text
                                  ? SvgPicture.asset(Images.ic_check_green)
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => Divider(
                        thickness: 1,
                        color: AppColors.black12,
                      ),
                  itemCount: updateInfoTeacherController.listProvincial.length),
            ),
          ),
        ],
      ),
    ),
  ));
}

// ignore: non_constant_identifier_names
Widget SelectDistrict(BuildContext context) {
  UpdateInfoTeacherController updateInfoTeacherController = Get.put(UpdateInfoTeacherController());
  // List<String> list = ['Hai bà trưng', 'Hoàng Mai', 'Tây Hồ', 'Ba Đình'];
  return SafeArea(
      child: Scaffold(
    backgroundColor: AppColors.greyf6f6f6,
    appBar: AppBar(
      backgroundColor: AppColors.primary4C5BD4,
      title: Text(
        'Quận/huyện',
        style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
      ),
      leading: IconButton(
        icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
        onPressed: () {
          Get.back();
        },
      ),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(vertical: AppDimens.space32, horizontal: AppDimens.padding16),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
                // ignore: deprecated_member_use
                onTap: () async {
                  if (updateInfoTeacherController.listDistrictSelect
                      .map((e) => e)
                      .contains(updateInfoTeacherController.listDistrictArea[index].nameCity)) {
                    updateInfoTeacherController.listIdDetailDistrictSelect.remove(updateInfoTeacherController.listDistrictArea[index].idCity);
                  } else {
                    updateInfoTeacherController.listIdDetailDistrictSelect.add(updateInfoTeacherController.listDistrictArea[index].idCity);
                    print(updateInfoTeacherController.listIdDetailDistrictSelect);
                  }
                  updateInfoTeacherController.onSelectQH(updateInfoTeacherController.listDistrictArea[index].nameCity);
                  Get.back();
                },
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        updateInfoTeacherController.listDistrictArea[index].nameCity,
                        style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                      ),
                      Spacer(),
                      updateInfoTeacherController.listDistrictSelect
                              .map((e) => e)
                              .contains(updateInfoTeacherController.listDistrictArea[index].nameCity)
                          ? SvgPicture.asset(Images.ic_check_green)
                          : Container()
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: AppColors.black12,
              ),
          itemCount: updateInfoTeacherController.listDistrictArea.length),
    ),
  ));
}
