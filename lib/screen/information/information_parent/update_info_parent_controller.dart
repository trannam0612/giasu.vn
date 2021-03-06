import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_parent.dart';
import 'package:giasu_vn/common/shared/data/models/result_update_avatar.dart';
import 'package:giasu_vn/common/shared/data/models/result_update_info_parent.dart';
import 'package:giasu_vn/common/shared/data/repositories/user_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/authen/register/register_phuhuynh/register_phuhuynh_step2_screen.dart';
import 'package:giasu_vn/screen/information/information_parent/update_info_parent_screen.dart';
import 'package:giasu_vn/screen/settings/settings_controller.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

class UpdateInformationParentController extends GetxController {
  UserRepositories userRepositories = UserRepositories();
  SettingsController settingsController = Get.put(SettingsController());
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
  String urlAvatar = '';
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
  List<String> listGender = ['Nam', 'N???', 'Kh??c'];

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
    search.addListener(() {
      update();
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
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

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
    idGender = value == "Nam"
        ? 1
        : value == "N???"
            ? 2
            : 0;
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
      return 'Tr?????ng b???t bu???c!';
    } else if (errorShowPassword && passWord.text.length < 6) {
      return 'M???t kh???u t???i thi???u 6 k?? t???!';
    }
    return null;
  }

  String checkRePassword() {
    print('checkRePassword');
    if (errorShowRePassword && rePassWord.text.isEmpty) {
      return 'Tr?????ng b???t bu???c!';
    } else if (errorShowRePassword && passWord.text != rePassWord.text) {
      return 'M???t kh???u kh??ng kh???p!';
    }
    return null;
  }

  String checkEmail() {
    if (errorEmail && email.text.isEmpty) {
      return 'Tr?????ng b???t bu???c!';
    } else if (errorEmail &&
        !email.text.contains('@') &&
        !email.text.contains('.')) {
      return 'Email kh??ng h???p l???!';
    } else if (errorEmail && !email.text.contains('.')) {
      return 'Email kh??ng h???p l???!';
    } else {
      return null;
    }
  }

  String checkFullName() {
    if (errorName && fullName.text.isEmpty) {
      return 'Tr?????ng b???t bu???c!';
    }
    return null;
  }

  RegExp regExp = new RegExp(r'^((0[0-9])|(84[0-9]))\d{8,10}$');

  String checkPhone() {
    print('checkPassword');
    if (errorPhone && phone.text.isEmpty) {
      return 'Tr?????ng b???t bu???c!';
    } else if (errorPhone && !regExp.hasMatch(phone.text)) {
      return 'S??? ??i???n tho???i kh??ng h???p l???!';
    }
    return null;
  }

  String checkDate() {
    if (errorDateTime && dateTime.text.isEmpty) {
      return 'Ng??y sinh kh??ng h???p l???!';
    }
    return null;
  }

  String checkProvincial() {
    print('checkProvincial');
    if (errorProvincial && provincial.text.isEmpty) {
      return 'Tr?????ng b???t bu???c!';
    }
    return null;
  }

  String checkDistrict() {
    print('checkProvincial');
    if (errorDistrict && district.text.isEmpty) {
      return 'Tr?????ng b???t bu???c!';
    }
    return null;
  }

  String checkAddress() {
    print('checkProvincial');
    if (errorAddress && address.text.isEmpty) {
      return 'Tr?????ng b???t bu???c!';
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
    try {
      ResultData res = await userRepositories.getInfoParent(token);
      ResultGetInfoParent resultGetInfoParent =
          resultGetInfoParentFromJson(res.data);
      if (resultGetInfoParent.data != null) {
        Get.back();
        Utils.showToast(resultGetInfoParent.data.message);
        urlAvatar = resultGetInfoParent.data.data.ugsAvatar;
        fullName.text = resultGetInfoParent.data.data.ugsName;
        phone.text = resultGetInfoParent.data.data.ugsPhone;
        gender = resultGetInfoParent.data.data.ugsGender == ''
            ? 'Kh??c'
            : resultGetInfoParent.data.data.ugsGender;
        dateTime.text = resultGetInfoParent.data.data.ugsBrithday;
        provincial.text = resultGetInfoParent.data.data.citName;
        address.text = resultGetInfoParent.data.data.ugsAddress;
        idGender = int.parse(resultGetInfoParent.data.data.ugsGenderId);
        idProvincial = int.parse(resultGetInfoParent.data.data.ugsCity);
        Get.to(UpdateInformationParentScreen());
      } else {
        Get.back();
        Utils.showToast(resultGetInfoParent.error.message);
      }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('X???y ra l???i. Vui l??ng th??? l???i!');
    }
    update();
  }

  void checkAvatar() {
    if (avatar == null) {
      errorImage = true;
      Utils.showToast('B???n ch??a ch???n ???nh ?????i di???n!');
    } else {
      updateAvatar();
    }
    update();
  }

  Future<void> updateAvatar() async {
    Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await userRepositories.updateAvatar(token, avatar);
      ResultUpdateAvatar resultUpdateAvatar =
          resultUpdateAvatarFromJson(res.data);
      if (resultUpdateAvatar.data != null) {
        Get.back();
        Utils.showToast(resultUpdateAvatar.data.message);
      } else {
        Get.back();
        Utils.showToast(resultUpdateAvatar.error.message);
      }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('X???y ra l???i. Vui l??ng th??? l???i!');
    }
    update();
  }

  Future<void> updateInfoParent() async {
    String token = SpUtil.getString(ConstString.token);
    try {
      ResultData res = await userRepositories.updateInfoParent(
          token,
          phone.text,
          fullName.text,
          idGender,
          dateTime.text,
          idProvincial,
          address.text);
      ResultUpdateInfoParent resultUpdateInfoParent =
          resultUpdateInfoParentFromJson(res.data);
      if (resultUpdateInfoParent.data != null) {
        Utils.showToast(resultUpdateInfoParent.data.message);
        settingsController.getInfoParent();
        Get.offAndToNamed(Routes.navigation);
      } else {
        Utils.showToast(resultUpdateInfoParent.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('X???y ra l???i. Vui l??ng th??? l???i!');
    }
    Get.back();
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
    fullName.text.isNotEmpty &&
            phone.text.isNotEmpty &&
            regExp.hasMatch(phone.text) &&
            errorGender == false &&
            dateTime.text.isNotEmpty &&
            provincial.text.isNotEmpty &&
            address.text.isNotEmpty
        ?
        // Get.to(RegisterParentStep2Screen())
        updateInfoParent()
        // registerParent()
        : Get.dialog(DialogError(
            title: 'T???t c??? c??c th??ng tin tr??n l?? b???t bu???c ????? ????ng k??.',
            onTap: () => Get.back(),
            textButton: 'Ok',
            richText: false,
          ));
    update();
  }
}
