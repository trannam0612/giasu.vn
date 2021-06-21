import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_parent.dart';
import 'package:giasu_vn/common/shared/data/models/result_update_info_parent.dart';
import 'package:giasu_vn/common/shared/data/repositories/user_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/screen/authen/register/register_phuhuynh/register_phuhuynh_step2_screen.dart';
import 'package:giasu_vn/screen/information/information_parent/update_info_parent_screen.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

class UpdateInformationParentController extends GetxController {
  UserRepositories userRepositories = UserRepositories();
  bool isShowRePassword = true;
  bool isShowPassword = true;
  bool errorEmail = false;
  bool errorShowPassword = false;
  bool errorShowRePassword = false;
  bool errorGender = false;
  bool errorInformation = false;

  bool errorName = false;
  bool errorPhone = false;
  bool errorDateTime = false;
  bool errorProvincial = false;
  bool errorDistrict = false;
  bool errorAddress = false;
  bool errorImage = false;
  File imageAvatar;
  File imageInfor;
  File avatar;
  int idGender;
  int idProvincial;
  TextEditingController email = TextEditingController();
  TextEditingController passWord = TextEditingController();
  TextEditingController rePassWord = TextEditingController();

  //step2
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController dateTime = TextEditingController();
  TextEditingController provincial = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController address = TextEditingController();
  String gender;
  List<String> listGender = ['Nam', 'Nữ'];

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
    // TODO: implement onInit
    super.onInit();
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
    errorGender = false;
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
    } else if (errorShowPassword && passWord.text.length < 6) {
      return 'Mật khẩu tối thiểu 6 kí tự!';
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
    } else if (errorEmail && !email.text.contains('@') && !email.text.contains('.')) {
      return 'Email không hợp lệ!';
    } else if (errorEmail && !email.text.contains('.')) {
      return 'Email không hợp lệ!';
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

  String checkPhone() {
    print('checkPassword');
    if (errorPhone && phone.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorPhone && phone.text.length < 9) {
      return 'Số điện thoại không hợp lệ!';
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

  void changeValuePassword() {
    print('changeValuePassword');
    isShowPassword = !isShowPassword;
    update();
  }

  Future<void> getInfoParent() async {
    Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await userRepositories.getInfoParent(token);
    ResultGetInfoParent resultGetInfoParent = resultGetInfoParentFromJson(res.data);
    if (resultGetInfoParent.data != null) {
      Get.back();
      Utils.showToast(resultGetInfoParent.data.message);
      fullName.text = resultGetInfoParent.data.data.ugsName;
      phone.text = resultGetInfoParent.data.data.ugsPhone;
      gender = resultGetInfoParent.data.data.ugsGender;
      dateTime.text = resultGetInfoParent.data.data.ugsBrithday;
      provincial.text = resultGetInfoParent.data.data.citName;
      address.text = resultGetInfoParent.data.data.ugsAddress;
      Get.to(UpdateInformationParentScreen());
    } else {
      Get.back();
      Utils.showToast(resultGetInfoParent.error.message);
    }
    update();
  }

  Future<void> updateInfoParent() async {
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await userRepositories.updateInfoParent(token, fullName.text, idGender, dateTime.text, idProvincial, address.text);
    ResultUpdateInfoParent resultUpdateInfoParent = resultUpdateInfoParentFromJson(res.data);
    if (resultUpdateInfoParent.data != null) {
      Utils.showToast(resultUpdateInfoParent.data.message);
    } else {
      Utils.showToast(resultUpdateInfoParent.error.message);
    }
    update();
  }

  void checkButton() {
    errorEmail = true;
    errorShowPassword = true;
    errorShowRePassword = true;
    errorName = true;
    errorPhone = true;
    errorDateTime = true;
    errorProvincial = true;
    errorDistrict = true;
    errorAddress = true;
    errorInformation = true;
    errorGender = gender.isNullOrBlank ? true : false;
    errorImage = avatar.isNullOrBlank ? true : false;
    // print()
    fullName.text.isNotEmpty && phone.text.isNotEmpty && errorGender == false && dateTime.text.isNotEmpty && provincial.text.isNotEmpty && address.text.isNotEmpty
        ?
        // Get.to(RegisterParentStep2Screen())
        updateInfoParent()
        // registerParent()
        : Get.dialog(DialogError(
            title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
            onTap: () => Get.back(),
            textButton: 'Ok',
            richText: false,
          ));
    update();
  }
}
