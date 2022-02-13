import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_check_mail.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_district.dart';
import 'package:giasu_vn/common/shared/data/models/result_register_parent.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/screen/authen/login/login_controller.dart';
import 'package:giasu_vn/screen/authen/otp/otp_screen.dart';
import 'package:giasu_vn/screen/authen/register/register_phuhuynh/register_phuhuynh_step2_screen.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:image_picker/image_picker.dart';
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
  RxBool errorImage = false.obs;
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

  final GlobalKey<FormState> formEmailKey = GlobalKey();
  final GlobalKey<FormState> passWordKey = GlobalKey();
  final GlobalKey<FormState> rePassWordKey = GlobalKey();

  //step2
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();
  FocusNode checkEmailPH = FocusNode();
  TextEditingController dateTime = TextEditingController();
  TextEditingController provincial = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController information = TextEditingController();

  final GlobalKey<FormState> fullNameKey = GlobalKey();
  final GlobalKey<FormState> phoneKey = GlobalKey();
  final GlobalKey<FormState> provincialKey = GlobalKey();
  final GlobalKey<FormState> districtKey = GlobalKey();
  final GlobalKey<FormState> addressKey = GlobalKey();

  String gender;
  List<String> listGender = ['Nam', 'Nữ'];
  List<ListDistrict> listDistrict = [];
  RxBool valueCheckEmailGS = false.obs;
  Timer searchOnStoppedTyping;

  onChangeHandler(value) {
    const duration = Duration(milliseconds: 800); // set the duration that you want call search() after that.
    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping.cancel(); // clear timer
    }
    searchOnStoppedTyping = new Timer(duration, () => checkMailPH());
  }

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
    if (formEmailKey.currentState.validate() && passWordKey.currentState.validate() && rePassWordKey.currentState.validate()) {
      print('done');
      Get.to(RegisterParentStep2Screen());
    } else {
      Get.dialog(DialogError(
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
    try {
      ResultData res = await authenticationRepositories.listDistrict(idCity);
      resultListDistrict = resultListDistrictFromJson(res.data);
      if (resultListDistrict.data != null) {
        listDistrict = resultListDistrict.data.listCity;
      } else {}
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> registerParent() async {
    try {
      ResultData res = await authenticationRepositories.registerParent(email.text, passWord.text, rePassWord.text, avatar, fullName.text, phone.text,
          idGender, dateTime.text, idProvincial, idDistrict, address.text, information.text);
      resultRegisterParent = resultRegisterParentFromJson(res.data);
      if (resultRegisterParent.data != null) {
        SpUtil.putString(ConstString.token_register, resultRegisterParent.data.dataUser.token);
        SpUtil.putString(ConstString.EMAIL, resultRegisterParent.data.dataUser.email);
        Get.find<LoginController>().email.text = SpUtil.getString(ConstString.EMAIL);
        Utils.showToast(resultRegisterParent.data.message);
        Get.to(OTPScreen(
          back: () => Get.back(),
        ));
      } else {
        Utils.showToast(resultRegisterParent.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
  }

  void checkButton() {
    avatar != null ? errorImage.value = false : true;
    print('errorImage:$errorImage');

    if (!errorImage.value &&
        fullNameKey.currentState.validate() &&
        phoneKey.currentState.validate() &&
        provincialKey.currentState.validate() &&
        addressKey.currentState.validate() &&
        districtKey.currentState.validate()) {
      registerParent();
    } else {
      errorImage.value = true;
      fullNameKey.currentState.validate();
      phoneKey.currentState.validate();
      provincialKey.currentState.validate();
      addressKey.currentState.validate();
      districtKey.currentState.validate();
      Get.dialog(DialogError(
        title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
        onTap: () => Get.back(),
        textButton: 'Ok',
        richText: false,
      ));
    }
    update();
  }

  Future<void> checkMailPH() async {
    print('getDataQH');
    try {
      if (email.text.isNotEmpty) {
        ResultData res = await authenticationRepositories.checkMailPH(email.text);
        ResultCheckMail resultCheckMail = resultCheckMailFromJson(res.data);
        if (resultCheckMail.data == null) {
          valueCheckEmailGS.value = true;
        } else {
          valueCheckEmailGS.value = false;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
}
