import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/authen/register/register_phuhuynh/register_phuhuynh_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';
import 'package:giasu_vn/widgets/dialog_time.dart';
import 'package:giasu_vn/widgets/drop_down_select.dart';
import 'package:intl/intl.dart';

class RegisterParentStep2Screen extends StatelessWidget {
  final f = new DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPhuHuynhController>(
        init: RegisterPhuHuynhController(),
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
                  physics: BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.all(AppDimens.padding16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2. Thông tin cá nhân (Phụ huynh)',
                          style: AppTextStyles.regularW400(context, size: AppDimens.textSize18, color: AppColors.secondaryF8971C),
                        ),
                        SizedBox(
                          height: AppDimens.height * 0.07,
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
                          height: AppDimens.space10,
                        ),
                        CustomTextField(
                          textEditingController: controller.fullName,
                          obligatory: true,
                          error: controller.checkFullName(),
                          onPressed: () {
                            // controller.imgFromGallery();
                          },
                          title: 'Họ tên',
                          hintText: 'Nhập họ tên',
                          isPassword: false,
                          isShowIcon: false,
                          iconSuffix: Images.ic_file_upload,
                        ),
                        SizedBox(
                          height: AppDimens.space10,
                        ),
                        CustomTextField(
                          keyboardType: TextInputType.number,
                          obligatory: true,
                          onPressed: () {
                            controller.changeValuePassword();
                          },
                          title: 'Số điện thoại',
                          textEditingController: controller.phone,
                          hintText: 'Nhập số điện thoại',
                          error: controller.checkPhone(),
                        ),
                        SizedBox(
                          height: AppDimens.space10,
                        ),
                        DropDownSelect(
                          obligatory: true,
                          title: 'Giới Tính',
                          isTitle: true,
                          hint: 'Chọn Giới Tính',
                          dropdownValue: controller.gender,
                          onChanged: (String value) => controller.onSelectedGender(value),
                          list: controller.listGender,
                          borderColor: controller.errorGender ? AppColors.redFF0033 : AppColors.grey747474,
                        ),
                        controller.errorGender
                            ? Padding(
                                padding: const EdgeInsets.only(top: AppDimens.space4),
                                child: Text(
                                  '\t\tTrường bắt buộc!',
                                  style: AppTextStyles.regularW400(context, size: 12, color: AppColors.redFF0033),
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: AppDimens.space10,
                        ),
                        CustomTextField(
                          onTapTextField: () {
                            // controller.dateTime.text.isEmpty
                            controller.dateTime.text = f.format(DateTime.now());
                            Get.dialog(DialogTime(
                              onChanged: (DateTime value) {
                                controller.dateTime.text = f.format(value);
                              },
                            ));
                          },
                          readOnly: true,
                          isShowIcon: true,
                          obligatory: true,
                          textEditingController: controller.dateTime,
                          onPressed: () {},
                          title: 'Ngày sinh',
                          hintText: 'Chọn ngày sinh',
                          iconSuffix: Images.ic_date,
                          error: controller.checkDate(),
                        ),
                        SizedBox(
                          height: AppDimens.space10,
                        ),
                        CustomTextField(
                          onTapTextField: () {
                            Get.to(SelectTinhThanh(context));
                          },
                          readOnly: true,
                          isShowIcon: true,
                          obligatory: true,
                          textEditingController: controller.provincial,
                          onPressed: () {},
                          title: 'Tỉnh, thành phố',
                          hintText: 'Chọn tỉnh, thành phố',
                          iconSuffix: Images.ic_arrow_down,
                          error: controller.checkProvincial(),
                        ),
                        SizedBox(
                          height: AppDimens.space10,
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
                          title: 'Quận, huyện',
                          hintText: 'Chọn quận, huyện',
                          iconSuffix: Images.ic_arrow_down,
                          error: controller.checkDistrict(),
                        ),
                        SizedBox(
                          height: AppDimens.space10,
                        ),
                        CustomTextField(
                          onTapTextField: () {},
                          isShowIcon: false,
                          obligatory: true,
                          textEditingController: controller.address,
                          onPressed: () {},
                          title: 'Địa chỉ',
                          hintText: 'Địa chỉ của bạn',
                          iconSuffix: Images.ic_arrow_down,
                          error: controller.checkAddress(),
                        ),
                        SizedBox(
                          height: AppDimens.height * 0.07,
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
                              title: 'Đăng ký',
                              textColor: AppColors.whiteFFFFFF,
                              color: AppColors.primary4C5BD4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ));
  }
}

Widget SelectTinhThanh(BuildContext context) {
  RegisterPhuHuynhController registerPhuHuynhController = Get.put(RegisterPhuHuynhController());
  List<String> list = ['Hà Nội', 'Hưng Yên', 'Thái Bình', 'Thanh Hóa'];
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
    body: Container(
      padding: EdgeInsets.symmetric(vertical: AppDimens.space32, horizontal: AppDimens.padding16),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
                // ignore: deprecated_member_use
                onTap: () {
                  registerPhuHuynhController.provincial.text = list[index];
                  Get.back();
                },
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        list[index],
                        style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                      ),
                      Spacer(),
                      list[index] == registerPhuHuynhController.provincial.text ? SvgPicture.asset(Images.ic_check_green) : Container()
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: AppColors.black12,
              ),
          itemCount: list.length),
    ),
  ));
}

// ignore: non_constant_identifier_names
Widget SelectDistrict(BuildContext context) {
  RegisterPhuHuynhController registerPhuHuynhController = Get.put(RegisterPhuHuynhController());
  List<String> list = ['Hai bà trưng', 'Hoàng Mai', 'Tây Hồ', 'Ba Đình'];
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
          itemBuilder: (context, index) => GestureDetector(
                // ignore: deprecated_member_use
                onTap: () {
                  registerPhuHuynhController.district.text = list[index];
                  Get.back();
                },
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        list[index],
                        style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                      ),
                      Spacer(),
                      list[index] == registerPhuHuynhController.district.text ? SvgPicture.asset(Images.ic_check_green) : Container()
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: AppColors.black12,
              ),
          itemCount: list.length),
    ),
  ));
}

DialogImage() {
  BuildContext context = Get.context;
  var width = MediaQuery.of(context).size.width;
  var height = MediaQuery.of(context).size.height;
  return GetBuilder<RegisterPhuHuynhController>(
    init: RegisterPhuHuynhController(),
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
