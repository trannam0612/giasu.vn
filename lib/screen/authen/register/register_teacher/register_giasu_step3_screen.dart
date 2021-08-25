import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_button_3.dart';
import 'package:giasu_vn/widgets/custom_search_textfield.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';
import 'package:giasu_vn/widgets/drop_down_select.dart';

class RegisterGiaSuStep3Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterGiaSuController>(
        init: RegisterGiaSuController(),
        builder: (controller) => GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: AppColors.greyf6f6f6,
                  appBar: AppBar(
                    backgroundColor: AppColors.primary4C5BD4,
                    title: Text(
                      'Đăng ký',
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
                            height: AppDimens.space30,
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
                                    color: AppColors.whiteFFFFFF,
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
                                                  color: AppColors.greyC4C4C4, borderRadius: BorderRadius.circular(AppDimens.padding16)),
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
                              onTap: controller.listSubjectSelectTopic.length < 5
                                  ? () {
                                      controller.getListTopic(controller.listSubjectSelect.map((e) => e.asId).join(','));
                                      controller.listSubjectSelectTopic.length < 5 ? Get.to(SelectTopicSubjectGSScreen(context)) : null;
                                    }
                                  : null,
                              child: Container(
                                  constraints: BoxConstraints(
                                    minHeight: 50,
                                    minWidth: double.infinity,
                                  ),
                                  padding: EdgeInsets.all(AppDimens.padding8),
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteFFFFFF,
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
                                                    color: AppColors.greyC4C4C4, borderRadius: BorderRadius.circular(AppDimens.padding16)),
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
                            list: listStringClass,
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
                            height: AppDimens.space30,
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
                            height: AppDimens.space30,
                          ),
                          CustomTextField(
                            onTapTextField: () {
                              controller.changeSearchProvincial('');
                              Get.to(SelectTinhThanh(context));
                            },
                            readOnly: true,
                            isShowIcon: true,
                            obligatory: true,
                            textEditingController: controller.areaTeaching,
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
                                    border: Border.all(color: controller.errorDistrict ? AppColors.redFF0033 : AppColors.grey747474, width: 1)),
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
                                                      controller.listDistrictSelect[index].nameCity,
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
                          controller.errorDistrictS3
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
                                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                            SizedBox(width: 10,),
                                            Expanded(
                                              child: CustomTextField(
                                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
                                padding: EdgeInsets.symmetric(horizontal: AppDimens.space4),
                                margin: EdgeInsets.symmetric(vertical: AppDimens.space4),
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
                                    value: controller.selectedTime,
                                    onChanged: (value) => controller.onSelectedStatusFee(value),
                                    dropdownColor: AppColors.whiteFFFFFF,
                                    elevation: 10,
                                    items: controller.listLuong.values.map((selectedType) {
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
                                    controller.stringErrorLuong,
                                    style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                  ),
                                )
                              : Container(),
                          SizedBox(
                            height: AppDimens.space8,
                          ),
                          Text(
                            'Lưu ý : Học phí tính VNĐ/ ${controller.fee.text == controller.listFee[1] ? '1 Giờ' : '1 Tuần'} ',
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
                                                    controller.listbuoiday[index].sang = controller.listbuoiday[index].sang == '0' ? "1" : "0";
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
                            height: AppDimens.space20,
                          ),
                          Container(
                            width: AppDimens.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Theme(
                                  child: Checkbox(
                                    value: controller.valueCheckBox,
                                    onChanged: (value) {
                                      controller.changeValueCheckBox();
                                    },
                                  ),
                                  data: ThemeData(
                                    primarySwatch: Colors.blue,
                                    unselectedWidgetColor: AppColors.greyAAAAAA, // Your color
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Tôi đã đọc và đồng ý với ',
                                    style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Điều khoản \nsử dụng ',
                                        style: AppTextStyles.regularW400(context,
                                            size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.primary4C5BD4),
                                      ),
                                      TextSpan(
                                        text: 'và ',
                                        style: AppTextStyles.regularW400(context,
                                            size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.black),
                                      ),
                                      TextSpan(
                                        text: 'Chính sách bảo mật',
                                        style: AppTextStyles.regularW400(context,
                                            size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.primary4C5BD4),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton1(
                                onPressed: () {},
                                title: 'LÀM LẠI',
                                textColor: AppColors.primary4C5BD4,
                                color: AppColors.primary4C5BD4,
                              ),
                              SizedBox(
                                width: AppDimens.space8,
                              ),
                              CustomButton2(
                                onPressed: () {
                                  controller.checkButtonStep3();
                                },
                                title: 'ĐĂNG KÝ',
                              )
                            ],
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
  return GetBuilder<RegisterGiaSuController>(
      init: RegisterGiaSuController(),
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
  return GetBuilder<RegisterGiaSuController>(
      init: RegisterGiaSuController(),
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
  RegisterGiaSuController registerGiaSuController = Get.put(RegisterGiaSuController());
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
              textEditingController: registerGiaSuController.search,
              onChanged: (value) {
                registerGiaSuController.changeSearchProvincial(value);
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
                          registerGiaSuController.areaTeaching.text = registerGiaSuController.listProvincial[index].citName;
                          registerGiaSuController.idArea = int.parse(registerGiaSuController.listProvincial[index].citId);
                          registerGiaSuController.listDistrictSelect.clear();
                          registerGiaSuController.getListDistrict(int.parse(registerGiaSuController.listProvincial[index].citId));
                          Get.back();
                        },
                        child: SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              Text(
                                registerGiaSuController.listProvincial[index].citName,
                                style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                              ),
                              Spacer(),
                              registerGiaSuController.listProvincial[index].citName == registerGiaSuController.areaTeaching.text
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
                  itemCount: registerGiaSuController.listProvincial.length),
            ),
          ),
        ],
      ),
    ),
  ));
}

Widget SelectDistrict(BuildContext context) {
  RegisterGiaSuController registerGiaSuController = Get.put(RegisterGiaSuController());
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
                onTap: () {
                  registerGiaSuController.onSelectQH(registerGiaSuController.listDistrict[index]);
                  Get.back();
                },
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        registerGiaSuController.listDistrict[index].nameCity,
                        style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                      ),
                      Spacer(),
                      registerGiaSuController.listDistrictSelect.map((e) => e).contains(registerGiaSuController.listDistrict[index])
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
          itemCount: registerGiaSuController.listDistrict.length),
    ),
  ));
}
