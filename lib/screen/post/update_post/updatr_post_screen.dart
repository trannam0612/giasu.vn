import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_controller.dart';
import 'package:giasu_vn/screen/post/post_controller.dart';
import 'package:giasu_vn/screen/post/update_post/update_post_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_button_3.dart';
import 'package:giasu_vn/widgets/custom_search_textfield.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';
import 'package:giasu_vn/widgets/custom_textfield_box.dart';
import 'package:giasu_vn/widgets/dialog_time.dart';
import 'package:giasu_vn/widgets/drop_down_select.dart';
import 'package:intl/intl.dart';

class UpdatePostScreen extends StatelessWidget {
  final f = new DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdatePostController>(
        init: UpdatePostController(),
        builder: (controller) => GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: AppColors.greyf6f6f6,
                appBar: AppBar(
                  backgroundColor: AppColors.primary4C5BD4,
                  title: Text(
                    'Sửa bài đăng',
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
                        CustomTextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'[@#$%^&*()_+\-=\[\]{}\\|<>\/~`•√π÷×¶∆₫£€¢°©®™℅]+')),
                          ],
                          textEditingController: controller.title,
                          obligatory: true,
                          error: controller.checkTitle(),
                          onPressed: () {},
                          title: 'Tiêu để',
                          hintText: 'Nhập tiêu đề ',
                          isPassword: false,
                          isShowIcon: false,
                          iconSuffix: Images.ic_arrow_down,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextFieldBox(
                          inputFormatters: [
                            FilteringTextInputFormatter.deny(RegExp(r'[@#$%^&*()_+\-=\[\]{}\\|<>\/~`•√π÷×¶∆₫£€¢°©®™℅]+')),
                          ],
                          textEditingController: controller.contentTitle,
                          obligatory: true,
                          error: controller.checkContentTitle(),
                          onPressed: () {},
                          title: 'Nội dung chi tiết ',
                          hintText: 'Nhập nội dung',
                          isPassword: false,
                          iconSuffix: Images.ic_plus,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        DropDownSelect(
                          hint: 'Chọn gia sư',
                          obligatory: true,
                          title: 'Yêu cầu gia sư',
                          list: controller.listKieuGS,
                          onChanged: (String value) => controller.onSelectedKieuGS(value),
                          dropdownValue: controller.selectedKieuGS,
                          borderColor: controller.errorKieuGS ? AppColors.redFF0033 : AppColors.grey747474,
                        ),
                        controller.errorKieuGS
                            ? Text(
                                'Trường bắt buộc!',
                                style: AppTextStyles.regularW500(context, size: AppDimens.textSize12, color: AppColors.redEB5757),
                              )
                            : Container(),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        DropDownSelect(
                          hint: 'Khác',
                          obligatory: true,
                          title: 'Giới tính',
                          list: controller.listGender,
                          onChanged: (String value) => controller.onSelectedGender(value),
                          dropdownValue: controller.selectedGender,
                          borderColor: controller.errorGender ? AppColors.redFF0033 : AppColors.grey747474,
                        ),
                        controller.errorGender
                            ? Text(
                                'Trường bắt buộc!',
                                style: AppTextStyles.regularW500(context, size: AppDimens.textSize12, color: AppColors.redEB5757),
                              )
                            : Container(),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        DropDownSelect(
                          hint: 'Chọn môn học',
                          obligatory: true,
                          title: 'Môn học',
                          list: listDataSubject.map((e) => e.asName).toList(),
                          onChanged: (String value) => controller.onSelectedSubject(value),
                          dropdownValue: controller.selectedSubject,
                          borderColor: controller.errorSubject ? AppColors.redFF0033 : AppColors.grey747474,
                        ),
                        controller.errorSubject
                            ? Text(
                                'Trường bắt buộc!',
                                style: AppTextStyles.regularW500(context, size: AppDimens.textSize12, color: AppColors.redEB5757),
                              )
                            : Container(),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        DropDownSelect(
                          hint: 'Chọn môn học chi tiết',
                          obligatory: true,
                          title: 'Môn học chi tiết',
                          list: controller.listTopic.map((e) => e.nameSubject).toList(),
                          onChanged: (String value) => controller.onSelectedTopicSubject(value),
                          dropdownValue: controller.selectedTopicSubject,
                          borderColor: controller.errorTopicSubject ? AppColors.redFF0033 : AppColors.grey747474,
                        ),
                        controller.errorTopicSubject
                            ? Text(
                                'Trường bắt buộc!',
                                style: AppTextStyles.regularW500(context, size: AppDimens.textSize12, color: AppColors.redEB5757),
                              )
                            : Container(),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        DropDownSelect(
                          hint: 'Chọn lớp',
                          obligatory: true,
                          title: 'Dạy lớp',
                          list: listStringClass,
                          onChanged: (String value) => controller.onSelectedClass(value),
                          dropdownValue: controller.selectedClass,
                          borderColor: controller.errorClass ? AppColors.redFF0033 : AppColors.grey747474,
                        ),
                        controller.errorClass
                            ? Text(
                                'Trường bắt buộc!',
                                style: AppTextStyles.regularW500(context, size: AppDimens.textSize12, color: AppColors.redEB5757),
                              )
                            : Container(),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          textEditingController: controller.numberStudent,
                          obligatory: true,
                          error: controller.checkNumberStudent(),
                          keyboardType: TextInputType.number,
                          onPressed: () {},
                          title: 'Số lượng học sinh',
                          hintText: 'Nhập số lượng học sinh',
                          isPassword: false,
                          isShowIcon: false,
                          iconSuffix: Images.ic_arrow_down,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        DropDownSelect(
                          hint: 'Chọn thời gian',
                          obligatory: true,
                          title: 'Số giờ học 1 buổi',
                          list: controller.listTime,
                          onChanged: (String value) => controller.onSelectedTimeTeaching(value),
                          dropdownValue: controller.selectedTimeTeaching,
                          borderColor: controller.errorTimeTeaching ? AppColors.redFF0033 : AppColors.grey747474,
                        ),
                        controller.errorTimeTeaching
                            ? Text(
                                'Trường bắt buộc!',
                                style: AppTextStyles.regularW500(context, size: AppDimens.textSize12, color: AppColors.redEB5757),
                              )
                            : Container(),
                        SizedBox(
                          height: AppDimens.padding20,
                        ),
                        DropDownSelect(
                          hint: 'Chọn số buổi',
                          obligatory: true,
                          title: 'Số buổi học 1 tuần',
                          list: controller.listDay,
                          onChanged: (String value) => controller.onSelectedDayTeaching(value),
                          dropdownValue: controller.selectedDayTeaching,
                          borderColor: controller.errorDayTeaching ? AppColors.redFF0033 : AppColors.grey747474,
                        ),
                        controller.errorDayTeaching
                            ? Text(
                                'Trường bắt buộc!',
                                style: AppTextStyles.regularW500(context, size: AppDimens.textSize12, color: AppColors.redEB5757),
                              )
                            : Container(),
                        SizedBox(
                          height: AppDimens.padding20,
                        ),
                        DropDownSelect(
                          hint: 'Chọn hình thức học',
                          obligatory: true,
                          title: 'Hình thức học',
                          list: controller.listFormTeaching,
                          onChanged: (String value) => controller.onSelectMethodTeach(value),
                          dropdownValue: controller.selectMethodTeach,
                          borderColor: controller.errorMethodTeach ? AppColors.redFF0033 : AppColors.grey747474,
                        ),
                        controller.errorMethodTeach
                            ? Text(
                                'Trường bắt buộc!',
                                style: AppTextStyles.regularW500(context, size: AppDimens.textSize12, color: AppColors.redEB5757),
                              )
                            : Container(),
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
                        // Row(
                        //   children: [
                        //     Expanded(
                        //       child: SizedBox(
                        //         height: AppDimens.height * 0.06,
                        //         child: TextButton(
                        //           onPressed: () {
                        //             controller.changValueButtonLuong();
                        //           },
                        //           child: Text(
                        //             'Cố định',
                        //             style: AppTextStyles.regularW700(context, size: AppDimens.textSize16, color: controller.valueButtonLuong ? AppColors.whiteFFFFFF : AppColors.black12),
                        //             textAlign: TextAlign.center,
                        //           ),
                        //           style: ElevatedButton.styleFrom(
                        //             primary: controller.valueButtonLuong ? AppColors.primary4C5BD4 : AppColors.whiteFFFFFF,
                        //             padding: EdgeInsets.all(AppDimens.space8),
                        //             onPrimary: Colors.white,
                        //             shape: RoundedRectangleBorder(
                        //               side: BorderSide(width: 1, color: AppColors.primary4C5BD4),
                        //               borderRadius: BorderRadius.all(Radius.circular(AppDimens.space10)),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: AppDimens.padding8,
                        //     ),
                        //     Expanded(
                        //       child: SizedBox(
                        //         height: AppDimens.height * 0.06,
                        //         child: TextButton(
                        //           onPressed: () {
                        //             controller.changValueButtonLuong();
                        //           },
                        //           child: Text(
                        //             'Ước lượng',
                        //             style: AppTextStyles.regularW700(context, size: AppDimens.textSize16, color: controller.valueButtonLuong ? AppColors.black12 : AppColors.whiteFFFFFF),
                        //             textAlign: TextAlign.center,
                        //           ),
                        //           style: ElevatedButton.styleFrom(
                        //             primary: controller.valueButtonLuong ? AppColors.whiteFFFFFF : AppColors.primary4C5BD4,
                        //             padding: EdgeInsets.all(AppDimens.space8),
                        //             onPrimary: Colors.white,
                        //             shape: RoundedRectangleBorder(side: BorderSide(width: 1, color: AppColors.primary4C5BD4), borderRadius: BorderRadius.all(Radius.circular(AppDimens.space10))),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: AppDimens.space8,
                        // ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child:
                                  // controller.valueButtonLuong
                                  //     ?
                                  CustomTextField(
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
                              ),
                              // : Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     crossAxisAlignment: CrossAxisAlignment.center,
                              //     children: [
                              //       Expanded(
                              //         child: CustomTextField(
                              //           error: controller.checkSalaryUL1(),
                              //           textEditingController: controller.salaryUL1,
                              //           obligatory: false,
                              //           isTitle: false,
                              //           onPressed: () {},
                              //           title: '',
                              //           keyboardType: TextInputType.number,
                              //           hintText: '1.000.000VNĐ',
                              //           isPassword: false,
                              //         ),
                              //       ),
                              //       Text(
                              //         '~',
                              //         style: AppTextStyles.regularW700(context, size: AppDimens.textSize20, color: AppColors.black12),
                              //       ),
                              //       Expanded(
                              //         child: CustomTextField(
                              //           error: controller.checkSalaryUL2(),
                              //           textEditingController: controller.salaryUL2,
                              //           obligatory: false,
                              //           isTitle: false,
                              //           keyboardType: TextInputType.number,
                              //           onPressed: () {},
                              //           title: '',
                              //           hintText: '6.000.000VNĐ',
                              //           isPassword: false,
                              //         ),
                              //       ),
                              //     ],
                              //   )),
                            ),
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
                        SizedBox(
                          height: AppDimens.space8,
                        ),
                        SizedBox(
                          height: AppDimens.space8,
                        ),
                        Text(
                          'Lưu ý : Học phí tính VNĐ/ ${controller.selectedStatusFee}  ',
                          style: AppTextStyles.regularW400(context, size: AppDimens.textSize10, color: AppColors.redEB5757),
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          textEditingController: controller.phone,
                          obligatory: true,
                          error: controller.checkPhone(),
                          keyboardType: TextInputType.phone,
                          onPressed: () {
                            // Get.dialog(DialogFee());
                          },
                          title: 'Điện thoại liên hệ',
                          hintText: '',
                          isPassword: false,
                          isShowIcon: false,
                          iconSuffix: Images.ic_arrow_down,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          textEditingController: controller.provincial,
                          readOnly: true,
                          error: controller.checkProvincial(),
                          onTapTextField: () {
                            controller.changeSearchProvincial('');
                            Get.to(SelectTinhThanh(context));
                          },
                          obligatory: true,
                          keyboardType: TextInputType.phone,
                          onPressed: () {},
                          title: 'Khu vực dạy học',
                          hintText: 'Chọn tỉnh, thành phố',
                          isPassword: false,
                          isShowIcon: true,
                          iconSuffix: Images.ic_arrow_down,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          textEditingController: controller.district,
                          readOnly: true,
                          error: controller.checkDistrict(),
                          onTapTextField: () {
                            Get.to(SelectDistrict(context));
                          },
                          obligatory: true,
                          keyboardType: TextInputType.phone,
                          onPressed: () {
                            // Get.dialog(DialogFee());
                          },
                          title: 'Quận, huyện',
                          hintText: 'Chọn quận, huyện',
                          isPassword: false,
                          isShowIcon: true,
                          iconSuffix: Images.ic_arrow_down,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          textEditingController: controller.address,
                          obligatory: true,
                          error: controller.checkAddress(),
                          onPressed: () {},
                          title: 'Địa chỉ lớp học',
                          hintText: 'Nhập địa chỉ cụ thể',
                          isPassword: false,
                          isShowIcon: false,
                          iconSuffix: Images.ic_arrow_down,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Buổi có thể học ',
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
                          height: AppDimens.space20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: controller.errorbuoiday ? Border.all(color: AppColors.redFF0033, width: 1) : null,
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
                                                  controller.errorbuoiday = false;
                                                  controller.listbuoiday[index].sang = controller.listbuoiday[index].sang == "0" ? "1" : "0";
                                                  controller.update();
                                                  // controller.update();
                                                },
                                                color: controller.listbuoiday[index].sang == "1" ? AppColors.secondaryF8971C : AppColors.whiteFFFFFF,
                                                textColor: controller.listbuoiday[index].sang == "1" ? AppColors.whiteFFFFFF : AppColors.grey747474,
                                                hasSide: controller.listbuoiday[index].sang == "1" ? false : true,
                                              ),
                                              SizedBox(
                                                width: AppDimens.padding16,
                                              ),
                                              CustomButton3(
                                                title: 'Chiều',
                                                onPressed: () {
                                                  controller.errorbuoiday = false;
                                                  controller.listbuoiday[index].chieu = controller.listbuoiday[index].chieu == "0" ? "1" : "0";
                                                  controller.update();
                                                  // controller.update();
                                                },
                                                color: controller.listbuoiday[index].chieu == "1" ? AppColors.secondaryF8971C : AppColors.whiteFFFFFF,
                                                textColor: controller.listbuoiday[index].chieu == "1" ? AppColors.whiteFFFFFF : AppColors.grey747474,
                                                hasSide: controller.listbuoiday[index].chieu == "1" ? false : true,
                                              ),
                                              SizedBox(
                                                width: AppDimens.padding16,
                                              ),
                                              CustomButton3(
                                                title: 'Tối',
                                                onPressed: () {
                                                  controller.errorbuoiday = false;
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
                        controller.errorbuoiday
                            ? Text(
                                'Trường bắt buộc!',
                                style: AppTextStyles.regularW500(context, size: AppDimens.textSize12, color: AppColors.redEB5757),
                              )
                            : Container(),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        SizedBox(
                          height: AppDimens.padding16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppDimens.space16),
                          child: SizedBox(
                            width: AppDimens.width,
                            height: AppDimens.height * 0.07,
                            child: CustomButton2(
                              onPressed: () {
                                controller.checkButton();
                              },
                              title: 'Cập nhật',
                              textColor: AppColors.whiteFFFFFF,
                              color: AppColors.primary4C5BD4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}

Widget SelectTinhThanh(BuildContext context) {
  UpdatePostController updatePostController = Get.put(UpdatePostController());
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
              textEditingController: updatePostController.search,
              onChanged: (value) {
                updatePostController.changeSearchProvincial(value);
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
                          updatePostController.provincial.text = updatePostController.listProvincial[index].citName;
                          updatePostController.idProvincial = int.parse(updatePostController.listProvincial[index].citId);
                          updatePostController.listDistrict.clear();
                          updatePostController.district.clear();
                          updatePostController.getListDistrict(int.parse(updatePostController.listProvincial[index].citId));

                          Get.back();
                        },
                        child: SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              Text(
                                updatePostController.listProvincial[index].citName,
                                style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                              ),
                              Spacer(),
                              updatePostController.listProvincial[index].citName == updatePostController.provincial.text
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
                  itemCount: updatePostController.listProvincial.length),
            ),
          ),
        ],
      ),
    ),
  ));
}

// ignore: non_constant_identifier_names
Widget SelectDistrict(BuildContext context) {
  UpdatePostController updatePostController = Get.put(UpdatePostController());
  return SafeArea(
      child: Scaffold(
    backgroundColor: AppColors.greyf6f6f6,
    appBar: AppBar(
      backgroundColor: AppColors.primary4C5BD4,
      title: Text(
        'Quận, Huyện',
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
                  updatePostController.district.text = updatePostController.listDistrict[index].nameCity;
                  updatePostController.idDistrict = int.parse(updatePostController.listDistrict[index].idCity);
                  Get.back();
                },
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        updatePostController.listDistrict[index].nameCity,
                        style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                      ),
                      Spacer(),
                      updatePostController.listDistrict[index].nameCity == updatePostController.district.text
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
          itemCount: updatePostController.listDistrict.length),
    ),
  ));
}

// DialogImage() {
//   BuildContext context = Get.context;
//   var width = MediaQuery.of(context).size.width;
//   var height = MediaQuery.of(context).size.height;
//   return GetBuilder<PostController>(
//     init: PostController(),
//     builder: (controller) => Dialog(
//         insetPadding: EdgeInsets.only(top: 10.0),
//         backgroundColor: Colors.transparent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: Colors.white,
//           ),
//           margin: EdgeInsets.symmetric(horizontal: 14),
//           padding: EdgeInsets.symmetric(horizontal: 15),
//           width: width,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(height: 15),
//               controller.imageAvatar == null
//                   ? Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppDimens.space100), border: Border.all(color: AppColors.primary4C5BD4, width: 0.5)),
//                       child: Center(
//                           child: SvgPicture.asset(
//                         Images.ic_add_camera,
//                         width: 60,
//                         height: 60,
//                         color: AppColors.grey747474,
//                       )))
//                   : ClipRRect(
//                       borderRadius: BorderRadius.circular(100),
//                       child: Image.file(
//                         controller.imageAvatar,
//                         width: 100,
//                         height: 100,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//               SizedBox(height: 65),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         controller.imgFromCamera();
//                       },
//                       child: Text(
//                         'Chụp ảnh trực tiếp',
//                         style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
//                       )),
//                   SizedBox(width: 36),
//                   InkWell(
//                       onTap: () {
//                         controller.imgFromGallery();
//                       },
//                       child: Text(
//                         'Ảnh trong thư viện',
//                         style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
//                       )),
//                 ],
//               ),
//               SizedBox(height: 65),
//               Container(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: SizedBox(
//                         height: height * 0.06,
//                         child: CustomButton1(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           title: 'Hủy',
//                           textColor: AppColors.black,
//                           color: AppColors.grey747474,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     Expanded(
//                       child: SizedBox(
//                         height: height * 0.06,
//                         child: CustomButton2(
//                           onPressed: () {
//                             // controller.avatar = controller.imageAvatar;
//                             controller.changeAvatar();
//                             controller.errorImage = false;
//                             // controller.uploadAvatar();
//                             Get.back();
//                           },
//                           title: 'Cập nhật',
//                           textColor: AppColors.whiteFFFFFF,
//                           color: AppColors.primary4C5BD4,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16),
//             ],
//           ),
//         )),
//   );
// }
