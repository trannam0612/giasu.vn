import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_check_mail.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_district.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_provincial_subject.dart';
import 'package:giasu_vn/common/shared/data/models/result_register_parent.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/screen/authen/otp/otp_screen.dart';
import 'package:giasu_vn/screen/authen/register/register_phuhuynh/register_phuhuynh_step2_screen.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_pass.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

class RegisterPhuHuynhController extends GetxController {
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  ResultRegisterParent resultRegisterParent = ResultRegisterParent();
  ResultListDistrict resultListDistrict = ResultListDistrict();
  bool isShowRePassword = true;
  bool isShowPassword = true;
  bool valueErrorPassword = true;
  bool valueErrorRePassword = true;
  bool errorEmail = false;
  bool errorShowPassword = false;
  bool errorShowRePassword = false;
  bool errorGender = false;

  bool errorName = false;
  bool errorPhone = false;
  bool errorDateTime = false;
  bool errorProvincial = false;
  bool errorDistrict = false;
  bool errorAddress = false;
  bool errorImage = false;
  bool errorInformation = false;
  File imageAvatar;
  File imageInfor;
  File avatar;

  int idProvincial;
  int idDistrict;
  int idGender;
  TextEditingController email = TextEditingController();
  TextEditingController passWord = TextEditingController();
  TextEditingController rePassWord = TextEditingController();

  //step2
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();
  FocusNode checkEmailPH = FocusNode();
  TextEditingController dateTime = TextEditingController();
  TextEditingController provincial = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController information = TextEditingController();
  String gender;
  List<String> listGender = ['Nam', 'Nữ'];
  List<ListDistrict> listDistrict = [];
  RxBool valueCheckEmailGS = true.obs;

  @override
  void onInit() {
    email.addListener(() {
      update();
    });
    passWord.addListener(() {
      update();
    });
    rePassWord.addListener(() {
      update();
    });
    fullName.addListener(() {
      update();
    });
    phone.addListener(() {
      update();
    });
    dateTime.addListener(() {
      update();
    });
    provincial.addListener(() {
      update();
    });
    district.addListener(() {
      update();
    });
    address.addListener(() {
      update();
    });
    information.addListener(() {
      update();
    });
    search.addListener(() {
      update();
    });
    checkEmailPH.addListener(() {
      checkMailPH();
    });
    // TODO: implement onInit

    super.onInit();
  }

  RxList<dynamic> listProvincial = [].obs;
  TextEditingController search = TextEditingController();

  void changeSearchProvincial(String value) {
    listProvincial.clear();
    for (int i = 0; i < listDataCity.length; i++) {
      if (listDataCity[i].citName.toLowerCase().contains(value.toLowerCase())) {
        listProvincial.add(listDataCity[i]);
      }
    }
    update();
  }

  imgFromGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    imageAvatar = File(image.path);
    update();
  }

  imgFromCamera() async {
    final cameraImage = await ImagePicker.pickImage(source: ImageSource.camera);

    imageAvatar = File(cameraImage.path);
    update();
  }

  void changeAvatar() {
    avatar = imageAvatar;
    update();
  }

  void onSelectedGender(String value) {
    gender = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachGioiTinh.length; i++) {
    //   if (loginController.resultListData.data.danhSachGioiTinh[i].sexName == value) {
    //     idGender = loginController.resultListData.data.danhSachGioiTinh[i].sexId;
    //   }
    // }
    idGender = value == "Nam" ? 1 : 2;
    // errorGender = false;
    update();
  }

  void changeValueRePassword() {
    print('changeValueRePassword');
    isShowRePassword = !isShowRePassword;
    update();
  }

  String checkPassword() {
    print('checkPassword');
    if (errorShowPassword && passWord.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorShowPassword && passWord.text.length < 8) {
      return 'Mật khẩu tối thiểu 8 kí tự!';
    } else if (errorShowPassword && !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(passWord.text)) {
      return 'Mật khẩu sai định dạng!';
    }
    return null;
  }

  String checkRePassword() {
    print('checkRePassword');
    if (errorShowRePassword && rePassWord.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorShowRePassword && passWord.text != rePassWord.text) {
      return 'Mật khẩu không khớp!';
    }
    return null;
  }

  String checkEmail() {
    if (errorEmail && email.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorEmail && !email.text.contains('@')) {
      return 'Email không hợp lệ!';
    } else if (errorEmail && !email.text.contains('.')) {
      return 'Email không hợp lệ!';
    } else if (!valueCheckEmailGS.value) {
      return 'Email đã tồn tại!';
    } else {
      return null;
    }
  }

  String checkFullName() {
    if (errorName && fullName.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  RegExp regExp = new RegExp(r'^((0[0-9])|(84[0-9]))\d{8,10}$');

  String checkPhone() {
    print('checkPassword');

    if (errorPhone && phone.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    // else if (errorPhone && phone.text.length != 10) {
    //   return 'Số điện thoại không hợp lệ!';
    // }
    else if (errorPhone && !regExp.hasMatch(phone.text)) {
      return 'Số điện thoại sai định dạng!';
    }
    return null;
  }

  String checkDate() {
    if (errorDateTime && dateTime.text.isEmpty) {
      return 'Ngày sinh không hợp lệ!';
    }
    return null;
  }

  String checkProvincial() {
    print('checkProvincial');
    if (errorProvincial && provincial.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkDistrict() {
    print('checkProvincial');
    if (errorDistrict && district.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkAddress() {
    print('checkProvincial');
    if (errorAddress && address.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkInformation() {
    print('checkProvincial');
    if (errorInformation && information.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  void changeValuePassword() {
    print('changeValuePassword');
    isShowPassword = !isShowPassword;
    update();
  }

  void checkButtonStep1() {
    errorEmail = true;
    errorShowPassword = true;
    errorShowRePassword = true;
    if (passWord.text.length >= 8 && !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(passWord.text)) {
      Get.dialog(DialogErrorPass());
    } else {
      email.text.isNotEmpty &&
              valueCheckEmailGS.value &&
              email.text.contains('@') &&
              email.text.contains('.') &&
              passWord.text.length >= 8 &&
              RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])').hasMatch(passWord.text) &&
              rePassWord.text == passWord.text
          ? Get.to(RegisterParentStep2Screen())
          : Get.dialog(DialogError(
              title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
              onTap: () => Get.back(),
              textButton: 'Ok',
              richText: false,
            ));
    }

    update();
  }

  Future<void> getListDistrict(int idCity) async {
    listDistrict = [];
    ResultData res = await authenticationRepositories.listDistrict(idCity);
    resultListDistrict = resultListDistrictFromJson(res.data);
    if (resultListDistrict.data != null) {
      listDistrict = resultListDistrict.data.listCity;
    } else {}
    update();
  }

  Future<void> registerParent() async {
    ResultData res = await authenticationRepositories.registerParent(email.text, passWord.text, rePassWord.text, avatar, fullName.text, phone.text,
        idGender, dateTime.text, idProvincial, idDistrict, address.text, information.text);
    resultRegisterParent = resultRegisterParentFromJson(res.data);
    if (resultRegisterParent.data != null) {
      SpUtil.putString(ConstString.token_register, resultRegisterParent.data.dataUser.token);
      SpUtil.putString(ConstString.EMAIL, resultRegisterParent.data.dataUser.email);
      Utils.showToast(resultRegisterParent.data.message);
      Get.to(OTPScreen(
        back: () => Get.back(),
      ));
    } else {
      Utils.showToast(resultRegisterParent.error.message);
    }
  }

  void checkButton() {
    errorEmail = true;
    errorShowPassword = true;
    errorShowRePassword = true;
    errorName = true;
    errorPhone = true;
    // errorDateTime = true;
    errorProvincial = true;
    errorDistrict = true;
    // errorAddress = true;
    errorInformation = true;
    // errorGender = gender.isNullOrBlank ? true : false;
    errorImage = avatar.isNullOrBlank ? true : false;
    // print()
    fullName.text.isNotEmpty &&
            phone.text.isNotEmpty &&
            regExp.hasMatch(phone.text) &&
            // errorGender == false &&
            // dateTime.text.isNotEmpty &&
            provincial.text.isNotEmpty &&
            district.text.isNotEmpty &&
            information.text.isNotEmpty
        // &&
        // address.text.isNotEmpty
        ?
        // Get.to(RegisterParentStep2Screen())
        // Utils.showToast('Cập nhật thành công')
        registerParent()
        : Get.dialog(DialogError(
            title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
            onTap: () => Get.back(),
            textButton: 'Ok',
            richText: false,
          ));
    update();
  }

  Future<void> checkMailPH() async {
    print('getDataQH');
    if (email.text.isNotEmpty) {
      ResultData res = await authenticationRepositories.checkMailPH(email.text);
      ResultCheckMail resultCheckMail = resultCheckMailFromJson(res.data);
      if (resultCheckMail.data != null) {
        valueCheckEmailGS.value = true;
      } else {
        valueCheckEmailGS.value = false;
        Utils.showToast(resultCheckMail.error.message);
      }
    } else {
      return null;
    }
    update();
  }
}
