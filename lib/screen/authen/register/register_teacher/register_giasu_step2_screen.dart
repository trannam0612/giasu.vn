import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_search_textfield.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';
import 'package:giasu_vn/widgets/custom_textfield_box.dart';
import 'package:giasu_vn/widgets/dialog_time.dart';
import 'package:giasu_vn/widgets/drop_down_select.dart';
import 'package:intl/intl.dart';

class RegisterGiaSuStep2Screen extends StatelessWidget {
  final f = new DateFormat('dd-MM-yyyy');

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2. Thông tin cá nhân (Gia sư)',
                          style: AppTextStyles.regularW400(context, size: AppDimens.textSize18, color: AppColors.secondaryF8971C),
                        ),
                        SizedBox(
                          height: AppDimens.space10,
                        ),
                        InkWell(
                          onTap: () {
                            Get.dialog(DialogImage());
                          },
                          child: controller.avatar == null
                              ? Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    padding: EdgeInsets.all(30),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(AppDimens.space100),
                                        border: Border.all(color: controller.errorImage ? AppColors.redFF0033 : AppColors.primary4C5BD4, width: 0.5)),
                                    child: SvgPicture.asset(Images.ic_add_camera),
                                  ),
                                )
                              : Align(
                                  alignment: Alignment.center,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(
                                      controller.avatar,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                        ),
                        controller.errorImage
                            ? Padding(
                                padding: const EdgeInsets.only(top: AppDimens.space4),
                                child: Text(
                                  '\t\tTrường bắt buộc!',
                                  style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: 4,
                        ),
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Ảnh đại diện ',
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
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          error: controller.checkFullName(),
                          textEditingController: controller.fullName,
                          obligatory: true,
                          onPressed: () {},
                          title: 'Họ tên',
                          hintText: 'Trần Văn A',
                          isPassword: false,
                          iconSuffix: Images.ic_plus,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          textEditingController: controller.phone,
                          error: controller.checkPhone(),
                          keyboardType: TextInputType.phone,
                          obligatory: true,
                          title: 'Số điện thoại',
                          hintText: '0123456789',
                          isPassword: false,
                          iconSuffix: Images.ic_plus,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        DropDownSelect(
                          obligatory: false,
                          title: 'Giới Tính',
                          isTitle: true,
                          hint: 'Chọn Giới Tính',
                          dropdownValue: controller.selectedGender,
                          onChanged: (String value) => controller.onSelectedGender(value),
                          list: controller.listGender,
                          borderColor: controller.errorGender ? AppColors.redFF0033 : AppColors.grey747474,
                        ),
                        SizedBox(
                          height: AppDimens.space30,
                        ),
                        CustomTextField(
                          onTapTextField: () {
                            controller.dateTime.text = f.format(DateTime.now());
                            Get.dialog(DialogTime(
                              onChanged: (DateTime value) {
                                controller.dateTime.text = f.format(value);
                              },
                            ));
                          },
                          readOnly: true,
                          isShowIcon: true,
                          obligatory: false,
                          textEditingController: controller.dateTime,
                          onPressed: () {},
                          title: 'Ngày sinh',
                          hintText: 'Chọn ngày sinh',
                          iconSuffix: Images.ic_date,
                          // error: controller.checkDate(),
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        DropDownSelect(
                          obligatory: true,
                          title: 'Tình trạng hôn nhân',
                          isTitle: true,
                          hint: 'Chọn tình trạng hôn nhân',
                          dropdownValue: controller.selectedMarriage,
                          onChanged: (String value) => controller.onSelectedMarriage(value),
                          list: controller.listMarriage,
                          borderColor: controller.errorMarriage ? AppColors.redFF0033 : AppColors.grey747474,
                        ),
                        controller.errorMarriage
                            ? Padding(
                                padding: const EdgeInsets.only(top: AppDimens.space4),
                                child: Text(
                                  '\t\tTrường bắt buộc!',
                                  style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: AppDimens.space30,
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
                          onPressed: () {},
                          title: 'Tỉnh, Thành Phố',
                          hintText: 'Chọn tỉnh, thành phố',
                          isPassword: false,
                          isShowIcon: true,
                          iconSuffix: Images.ic_arrow_down,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          onTapTextField: () {
                            Get.to(SelectDistrict(context));
                          },
                          readOnly: true,
                          isShowIcon: true,
                          obligatory: true,
                          textEditingController: controller.district,
                          onPressed: () {},
                          title: 'Quận/huyện',
                          hintText: 'Chọn Quận/huyện',
                          iconSuffix: Images.ic_arrow_down,
                          error: controller.checkDistrict(),
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          textEditingController: controller.address,
                          obligatory: false,
                          // error: controller.checkAddress(),
                          onPressed: () {},
                          title: 'Địa chỉ',
                          hintText: 'Nhập địa chỉ cụ thể',
                          isPassword: false,
                          isShowIcon: false,
                          iconSuffix: Images.ic_arrow_down,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        // DropDownSelect(
                        //   obligatory: true,
                        //   title: 'Trình độ hiện tại',
                        //   isTitle: true,
                        //   hint: 'Chọn trình độ hiện tại',
                        //   dropdownValue: controller.selectedKieuGS,
                        //   onChanged: (String value) => controller.onSelectedKieuGS(value),
                        //   list: controller.listKieuGS,
                        //   borderColor: controller.errorExp ? AppColors.redFF0033 : AppColors.grey747474,
                        // ),
                        // controller.errorExp
                        //     ? Padding(
                        //         padding: const EdgeInsets.only(top: AppDimens.space4),
                        //         child: Text(
                        //           'Trường bắt buộc!',
                        //           style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                        //         ),
                        //       )
                        //     : Container(),
                        // SizedBox(
                        //   height: AppDimens.space20,
                        // ),
                        CustomTextField(
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          textEditingController: controller.numberYearExp,
                          obligatory: false,
                          keyboardType: TextInputType.number,
                          // error: controller.checkNumberYearExp(),
                          onPressed: () {},
                          title: 'Số năm kinh nghiệm',
                          hintText: 'Số năm kinh nghiệm',
                          isPassword: false,
                          isShowIcon: false,
                          iconSuffix: Images.ic_arrow_down,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          textEditingController: controller.titleExp,
                          obligatory: false,
                          // keyboardType: TextInputType.number,
                          // error: controller.checkTitleExp(),
                          onPressed: () {},
                          title: 'Kinh nghiệm giảng dạy',
                          hintText: 'Tiêu đề',
                          isPassword: false,
                          isShowIcon: false,
                          iconSuffix: Images.ic_arrow_down,
                        ),
                        SizedBox(
                          height: AppDimens.space10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              flex: 5,
                              child: CustomTextField(
                                readOnly: true,
                                onTapTextField: () {
                                  controller.timeExpStart.text = f.format(DateTime.now());
                                  Get.dialog(DialogTime(
                                    onChanged: (DateTime value) {
                                      controller.errorTime = false;
                                      controller.timeExpStart.text = f.format(value);
                                    },
                                  ));
                                },
                                textEditingController: controller.timeExpStart,
                                obligatory: false,
                                keyboardType: TextInputType.number,
                                // error: controller.checkTimeExpStart(),
                                onPressed: () {},
                                title: '',
                                isTitle: false,
                                hintText: 'Thời gian bắt đầu',
                                isPassword: false,
                                isShowIcon: false,
                                iconSuffix: Images.ic_arrow_down,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              flex: 5,
                              child: CustomTextField(
                                readOnly: true,
                                onTapTextField: () {
                                  controller.timeExpEnd.text = f.format(DateTime.now());
                                  Get.dialog(DialogTime(
                                    onChanged: (DateTime value) {
                                      controller.errorTime = false;
                                      controller.timeExpEnd.text = f.format(value);
                                    },
                                  ));
                                },
                                textEditingController: controller.timeExpEnd,
                                obligatory: false,
                                keyboardType: TextInputType.number,
                                // error: controller.checkTimeExpEnd(),
                                onPressed: () {},
                                title: '',
                                isTitle: false,
                                hintText: 'Thời gian kết thúc',
                                isPassword: false,
                                isShowIcon: false,
                                iconSuffix: Images.ic_arrow_down,
                              ),
                            ),
                          ],
                        ),
                        controller.errorTime
                            ? Padding(
                                padding: const EdgeInsets.only(top: AppDimens.space4),
                                child: Text(
                                  'Thời gian bắt đầu phải trước thời gian kết thúc!',
                                  style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                ),
                              )
                            : Container(),
                        // SizedBox(
                        //   height: AppDimens.space10,
                        // ),
                        CustomTextFieldBox(
                          hasTitle: false,
                          textEditingController: controller.informationExp,
                          obligatory: false,
                          // error: controller.checkInformationExp(),
                          onPressed: () {},
                          title: '',
                          hintText: 'Mô tả',
                          isPassword: false,
                          iconSuffix: Images.ic_plus,
                        ),
                        SizedBox(
                          height: AppDimens.space30,
                        ),
                        CustomTextField(
                          textEditingController: controller.school,
                          obligatory: false,
                          onPressed: () {},
                          title: 'Trường học',
                          hintText: 'Đại học Hà Nội',
                          isPassword: false,
                          iconSuffix: Images.ic_plus,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          textEditingController: controller.graduationYear,
                          obligatory: false,
                          keyboardType: TextInputType.number,
                          onPressed: () {},
                          title: 'Năm tốt nghiệp',
                          hintText: 'Nhập năm tốt nghiệp',
                          isPassword: false,
                          iconSuffix: Images.ic_plus,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          textEditingController: controller.specialized,
                          obligatory: false,
                          onPressed: () {},
                          title: 'Chuyên ngành',
                          hintText: 'Nhập chuyên ngành',
                          isPassword: false,
                          iconSuffix: Images.ic_plus,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextField(
                          textEditingController: controller.prize,
                          obligatory: false,
                          onPressed: () {},
                          title: 'Thành tích bản thân',
                          hintText: 'Nhập thành tích bản thân',
                          isPassword: false,
                          iconSuffix: Images.ic_plus,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        // CustomTextField(
                        //   textEditingController: controller.graduationYear,
                        //   obligatory: false,
                        //   onPressed: () {},
                        //   title: 'Năm tốt nghiệp',
                        //   hintText: '05/2012',
                        //   isPassword: false,
                        //   isShowIcon: true,
                        //   iconSuffix: Images.ic_date,
                        // ),
                        // SizedBox(
                        //   height: AppDimens.space20,
                        // ),
                        CustomTextField(
                          textEditingController: controller.company,
                          obligatory: false,
                          onPressed: () {},
                          title: 'Nơi công tác hiện tại (nếu có)',
                          hintText: 'Nhập nơi công tác hiện tại',
                          isPassword: false,
                          iconSuffix: Images.ic_plus,
                        ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        CustomTextFieldBox(
                          textEditingController: controller.information,
                          obligatory: false,
                          onPressed: () {},
                          title: 'Mô tả về bản thân',
                          hintText: 'Nhập mô tả',
                          isPassword: false,
                          iconSuffix: Images.ic_plus,
                        ),
                        // SizedBox(
                        //   height: AppDimens.space20,
                        // ),
                        // CustomTextFieldBox(
                        //   textEditingController: controller.experienceTeaching,
                        //   obligatory: false,
                        //   onPressed: () {},
                        //   title: 'Kinh nghiệm đi dạy',
                        //   hintText: '',
                        //   isPassword: false,
                        //   iconSuffix: Images.ic_plus,
                        // ),
                        // SizedBox(
                        //   height: AppDimens.space20,
                        // ),
                        // CustomTextFieldBox(
                        //   textEditingController: controller.achievements,
                        //   obligatory: false,
                        //   onPressed: () {},
                        //   title: 'Thành tích',
                        //   hintText: '',
                        //   isPassword: false,
                        //   iconSuffix: Images.ic_plus,
                        // ),
                        SizedBox(
                          height: AppDimens.space20,
                        ),
                        Center(
                          child: CustomButton2(
                            title: 'TIẾP THEO',
                            onPressed: () {
                              controller.checkButtonStep2();
                            },
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
                          registerGiaSuController.provincial.text = registerGiaSuController.listProvincial[index].citName;
                          registerGiaSuController.idProvincial = int.parse(registerGiaSuController.listProvincial[index].citId);
                          registerGiaSuController.district.clear();
                          registerGiaSuController.getListDistrict(registerGiaSuController.idProvincial);
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
                              registerGiaSuController.listProvincial[index].citName == registerGiaSuController.provincial.text
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

// ignore: non_constant_identifier_names
Widget SelectDistrict(BuildContext context) {
  RegisterGiaSuController registerGiaSuController = Get.put(RegisterGiaSuController());
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
                onTap: () {
                  registerGiaSuController.district.text = registerGiaSuController.listDistrict[index].nameCity;
                  registerGiaSuController.idDistrict = int.parse(registerGiaSuController.listDistrict[index].idCity);
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
                      registerGiaSuController.listDistrict[index].nameCity == registerGiaSuController.district.text
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

DialogImage() {
  BuildContext context = Get.context;
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return GetBuilder<RegisterGiaSuController>(
    init: RegisterGiaSuController(),
    builder: (controller) => Dialog(
        insetPadding: EdgeInsets.only(top: 10.0),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          margin: EdgeInsets.symmetric(horizontal: 14),
          padding: EdgeInsets.symmetric(horizontal: 15),
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 15),
              controller.imageAvatar == null
                  ? Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimens.space100), border: Border.all(color: AppColors.primary4C5BD4, width: 0.5)),
                      child: Center(
                          child: SvgPicture.asset(
                        Images.ic_add_camera,
                        width: 60,
                        height: 60,
                        color: AppColors.grey747474,
                      )))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        controller.imageAvatar,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
              SizedBox(height: 65),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        controller.imgFromCamera();
                      },
                      child: Text(
                        'Chụp ảnh trực tiếp',
                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
                      )),
                  SizedBox(width: 36),
                  InkWell(
                      onTap: () {
                        controller.imgFromGallery();
                      },
                      child: Text(
                        'Ảnh trong thư viện',
                        style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
                      )),
                ],
              ),
              SizedBox(height: 65),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: height * 0.06,
                        child: CustomButton1(
                          onPressed: () {
                            Get.back();
                          },
                          title: 'Hủy',
                          textColor: AppColors.black,
                          color: AppColors.grey747474,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: height * 0.06,
                        child: CustomButton2(
                          onPressed: () {
                            // controller.avatar = controller.imageAvatar;
                            controller.changeAvatar();
                            controller.errorImage = false;
                            // controller.uploadAvatar();
                            Get.back();
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
              SizedBox(height: 16),
            ],
          ),
        )),
  );
}
