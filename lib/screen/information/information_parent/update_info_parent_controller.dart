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
import 'package:giasu_vn/screen/information/information_parent/update_info_parent_screen.dart';
import 'package:giasu_vn/screen/settings/settings_controller.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:image_picker/image_picker.dart';
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

  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dateTime = TextEditingController();
  TextEditingController provincial = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController address = TextEditingController();

  final GlobalKey<FormState> fullNameKey = GlobalKey();
  final GlobalKey<FormState> phoneKey = GlobalKey();
  final GlobalKey<FormState> dateTimeKey = GlobalKey();
  final GlobalKey<FormState> provincialKey = GlobalKey();
  final GlobalKey<FormState> districtKey = GlobalKey();
  final GlobalKey<FormState> addressKey = GlobalKey();

  String gender;
  List<String> listGender = ['Nam', 'Nữ', 'Khác'];

  @override
  void onInit() {
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
        : value == "Nữ"
            ? 2
            : 0;
    errorGender = false;
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
            ? 'Khác'
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
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  void checkAvatar() {
    if (avatar == null) {
      errorImage = true;
      Utils.showToast('Bạn chưa chọn ảnh đại diện!');
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
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
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
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    Get.back();
    update();
  }

  void checkButton() {
    errorGender = gender.isNullOrBlank ? true : false;
    errorImage = avatar.isNullOrBlank ? true : false;
    if (fullNameKey.currentState.validate() &&
        phoneKey.currentState.validate() &&
        dateTimeKey.currentState.validate() &&
        provincialKey.currentState.validate() &&
        addressKey.currentState.validate()) {
      updateInfoParent();
    } else {
      Get.dialog(DialogError(
        title: 'Tất cả các thông tin trên là bắt buộc để cập nhật thông tin.',
        onTap: () => Get.back(),
        textButton: 'Ok',
        richText: false,
      ));
    }

    update();
  }
}
