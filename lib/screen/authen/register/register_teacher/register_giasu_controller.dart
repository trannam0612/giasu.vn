import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

class RegisterGiaSuController extends GetxController {
  String valueErrorPassword = '';
  bool isShowPassword = true;
  bool errorShowPassword = false;
  bool isShowRePassword = true;
  bool errorShowRePassword = false;
  bool errorFullName = false;
  bool errorEmail = false;
  File imageAvatar;
  File imageInfor;
  File avatar;
  String valueGender = 'Khác';
  String valueExperience = 'Chọn kiểu gia sư';
  DateTime valueDate = DateTime.now();
  final f = new DateFormat('dd-MM-yyyy');
  final picker = ImagePicker();

  // List<String> listGender = ['Khác', 'Nam', 'Nữ'];
  List<buoiday> listbuoiday = [
    buoiday('Thứ 2', 0, 0, 0),
    buoiday('Thứ 3', 0, 0, 0),
    buoiday('Thứ 4', 0, 0, 0),
    buoiday('Thứ 5', 0, 0, 0),
    buoiday('Thứ 6', 0, 0, 0),
    buoiday('Thứ 7', 0, 0, 0),
    buoiday('CN', 0, 0, 0),
  ];

  //Step1

  //Step2
  bool errorPhone = false;
  bool errorImage = false;
  bool errorDateTime = false;
  bool errorGender = false;
  bool errorProvincial = false;
  bool errorDistrict = false;
  bool errorAddress = false;
  bool errorExp = false;
  int idGender = 0;
  int idProvincial = 0;
  int idExp = 0;

  //Step3
  bool errorClass = false;
  bool errorSubject = false;
  bool errorFormTeaching = false;
  bool errorStatusFee = false;
  bool errorSubjectTopic = false;
  bool errorArea = false;
  bool valueButtonLuong = false;
  int idClass = 0;
  int idLuong = 0;
  int idFormTeaching = 0;
  String valueArea;

  int idValueArea;

  int idSubject;

  void changValueButtonLuong() {
    valueButtonLuong = !valueButtonLuong;
    if (valueButtonLuong) {
      salaryCD.clear();
    } else {
      salaryUL1.clear();
      salaryUL2.clear();
    }
    update();
  }

  //Step1

  //Step2
  String selectedGender;
  String selectedKieuGS;

  //Step3
  String selectedSubject;
  String selectedClass;
  String selectedFormTeaching;
  String selectedLuong;
  bool valueCheckBox = false;
  String selectedStatusFee = 'Giờ';

  List<String> listSubjectSelect = [];
  List<String> listDistrictSelect = [];
  List<String> listKieuGS = ['Chọn hình thức dạy', 'Online', 'Tại nhà'];
  List<String> listSubjectTopic = ['Toán cấp 1', 'Toán Cấp 2', 'Văn cấp 1', 'Lý cấp 2', 'Hóa cấp 2'];
  List<String> listFormTeaching = ['Chọn hình thức dạy', 'Online', 'Tại nhà'];
  List<String> listClass = ['Lớp 1', 'Lớp 2', 'Lớp 3'];
  List<String> listSubject = ['Chọn hình thức dạy', 'Online', 'Tại nhà'];
  List<String> listQH = [
    'Quận Hai Bà Trưng',
    'Quận Hoàng Mai',
    'Quận Hoàn Kiếm',
    'Huyện Mỹ Hào',
    'Quận Thanh Xuân',
    'Quận Nam Từ Niêm',
    'Quận Tây Hồ'
  ];
  List<String> listFee = ['Chọn hình thức học phí', 'Cố định', 'Ước Lượng'];
  List<String> listGender = ['Nam', 'Nữ', 'Khác'];
  List<String> listLuong = ['Giờ', 'Ngày', 'Tháng'];

  //Step1
  TextEditingController passWord = TextEditingController();
  TextEditingController rePassWord = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();

  //Step2
  TextEditingController phone = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController dateTime = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController provincial = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController school = TextEditingController();
  TextEditingController specialized = TextEditingController();
  TextEditingController graduationYear = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController information = TextEditingController();
  TextEditingController experienceTeaching = TextEditingController();
  TextEditingController achievements = TextEditingController();

  //Step3
  TextEditingController informationSubject = TextEditingController();
  TextEditingController formTeach = TextEditingController();
  TextEditingController areaTeaching = TextEditingController();
  TextEditingController fee = TextEditingController();
  TextEditingController salaryCD = TextEditingController();
  TextEditingController salaryUL1 = TextEditingController();
  TextEditingController salaryUL2 = TextEditingController();

  String valueProvincial;
  int idValueProvincial;

  // void onSelectTopicSubject(DanhSachMonHocChiTietTheoMonHoc value) {
  //   print('onSelectSubject');
  //   errorSubjectTopic = false;
  //   if (listSubjectTopic.map((e) => e.nameTopic).contains(value.nameTopic)) {
  //     listSubjectTopic.remove(value);
  //   } else {
  //     listSubjectTopic.add(value);
  //   }
  //
  //   update();
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    passWord.addListener(() {
      // checkPassword();
      update();
    });
    rePassWord.addListener(() {
      // checkRePassword();
      update();
    });
    fullName.addListener(() {
      update();
    });
    email.addListener(() {
      // checkEmail();
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
    address.addListener(() {
      update();
    });
    areaTeaching.addListener(() {
      update();
    });
    salaryCD.addListener(() {
      update();
    });
    salaryUL1.addListener(() {
      update();
    });
    salaryUL2.addListener(() {
      update();
    });
    super.onInit();
    update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fullName.dispose();
    super.dispose();
  }

  //Step2
  String checkProvincial() {
    print('checkProvincial');
    if (errorProvincial && provincial.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkArea() {
    print('checkProvincial');
    if (errorArea && areaTeaching.text.isEmpty) {
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

  bool errorSalaryCD = false;
  bool errorSalaryUL1 = false;
  bool errorSalaryUL2 = false;

  String checkSalaryCD() {
    print('checkSalaryCD');
    if (errorSalaryCD && salaryCD.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkSalaryUL1() {
    print('checkSalaryUL1');
    if (errorSalaryUL1 && salaryUL1.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkSalaryUL2() {
    print('checkSalaryUL2');
    if (errorSalaryUL2 && salaryUL2.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  void changeProvincial(String value) {
    provincial.text = value;
    print(provincial.text);
    print(value);
    update();
  }

  void changeArea(String value) {
    areaTeaching.text = value;
    print(areaTeaching.text);
    print(value);
    update();
  }

  void changeValuePassword() {
    print('changeValuePassword');
    isShowPassword = !isShowPassword;
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

  String checkFullName() {
    if (errorFullName && fullName.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
    update();
  }

  String checkEmail() {
    print('checkEmail');
    if (errorEmail && email.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorEmail && !email.text.contains('@') && !email.text.contains('.')) {
      return 'Email không hợp lệ!';
    } else if (errorEmail && !email.text.contains('.')) {
      return 'Email không hợp lệ!';
    } else {
      return null;
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

  imgFromCameraImageInfor() async {
    final cameraImage = await ImagePicker.pickImage(source: ImageSource.camera);
    imageInfor = File(cameraImage.path);
    print(imageInfor);
    update();
  }

  imgFromGalleryImageInfor() async {
    final galleryImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    imageInfor = File(galleryImage.path);
    image.text = imageInfor.path.split('image_picker').last.toString();
    print(imageInfor.path.split('image_picker').last.toString());
    update();
  }

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(context: context, initialDate: valueDate, firstDate: DateTime(1970, 8), lastDate: DateTime(2101));
    if (picked != null && picked != valueDate) valueDate = picked;
    dateTime.text = f.format(valueDate);
  }

  void changeGender(String value) {
    valueGender = value;
    gender.text = value;
    update();
  }

  void onSelectedGender(String value) {
    selectedGender = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachGioiTinh.length; i++) {
    //   if (loginController.resultListData.data.danhSachGioiTinh[i].sexName == value) {
    //     idGender = loginController.resultListData.data.danhSachGioiTinh[i].sexId;
    //   }
    // }
    errorGender = false;
    update();
  }

  void onSelectedClass(String value) {
    selectedClass = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachLopHocSeDay.length; i++) {
    //   if (loginController.resultListData.data.danhSachLopHocSeDay[i].levelClassName == value) {
    //     idClass = loginController.resultListData.data.danhSachLopHocSeDay[i].levelClassId;
    //   }
    // }
    errorClass = false;
    update();
  }

  void onSelectedFormTeaching(String value) {
    selectedFormTeaching = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachHinhThucGiangDay.length; i++) {
    //   if (loginController.resultListData.data.danhSachHinhThucGiangDay[i].methodName == value) {
    //     idFormTeaching = loginController.resultListData.data.danhSachHinhThucGiangDay[i].methodId;
    //   }
    // }
    errorFormTeaching = false;
    update();
  }

  void onSelectedLuong(String value) {
    selectedFormTeaching = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachLuongTheo.length; i++) {
    //   if (loginController.resultListData.data.danhSachLuongTheo[i].name == value) {
    //     idLuong = loginController.resultListData.data.danhSachLuongTheo[i].id;
    //   }
    // }
    errorFormTeaching = false;
    update();
  }

  void onSelectedStatusFee(String value) {
    selectedStatusFee = value;
    errorStatusFee = false;
    update();
  }

  void onSelectedSubject(String value) {
    selectedSubject = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachMonHoc.length; i++) {
    //   if (loginController.resultListData.data.danhSachMonHoc[i].subject == value) {
    //     idSubject = loginController.resultListData.data.danhSachMonHoc[i].idSubject;
    //   }
    // }
    // print(data);
    print(idSubject);
    errorSubject = false;
    update();
  }

  void onSelectedKieuGS(String value) {
    selectedKieuGS = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachKieuGiaSu.length; i++) {
    //   if (loginController.resultListData.data.danhSachKieuGiaSu[i].nameType == value) {
    //     idExp = loginController.resultListData.data.danhSachKieuGiaSu[i].typeId;
    //   }
    // }
    errorExp = false;
    update();
  }

  void changeExperience(String value) {
    valueExperience = value;
    experience.text = value;
    update();
  }

  String checkPhone() {
    print('checkPassword');
    if (errorPhone && phone.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorPhone && phone.text.length < 6) {
      return 'Số điện thoại không hợp lệ!';
    }
    return null;
  }

  String checkImage() {
    if (errorImage && imageInfor.isNullOrBlank) {
      return 'Vui lòng chọn ảnh';
    }
    return null;
  }

  void changeAvatar() {
    avatar = imageAvatar;
    update();
  }

  String checkDate() {
    if (errorDateTime && dateTime.text.isEmpty) {
      return 'Ngày sinh không hợp lệ!';
    }
    return null;
  }

  void changeFormTeaching(String value) {
    print('changeFormTeaching');
    formTeach.text = value;
    update();
  }

  void changeValueCheckBox() {
    print('changeValueCheckBox');
    valueCheckBox = !valueCheckBox;
    update();
  }

  void onSelectQH(String value) {
    print('onSelectQH');
    if (listDistrictSelect.map((e) => e).contains(value)) {
      listDistrictSelect.remove(value);
    } else {
      listDistrictSelect.add(value);
    }
    errorDistrict = false;
    update();
  }

  void onSelectSubject(String value) {
    print('onSelectSubject');
    if (!listSubjectSelect.map((e) => e).contains(value)) {
      listSubjectSelect.add(value);
    } else {
      listSubjectSelect.remove(value);
    }
    errorSubject = false;
    update();
  }

  List<String> listSubjectSelectTopic = [];

  void onSelectSubjectTopic(String value) {
    print('onSelectSubject');
    if (!listSubjectSelectTopic.map((e) => e).contains(value)) {
      listSubjectSelectTopic.add(value);
    } else {
      listSubjectSelectTopic.remove(value);
    }
    errorSubjectTopic = false;
    update();
  }

//Step3

  void checkButtonStep1() {
    print('checkButton');

    errorEmail = true;
    errorShowPassword = true;
    errorShowRePassword = true;
    if (email.text.contains('@') &&
        email.text.contains('.') &&
        passWord.text.length >= 6 &&
        passWord.text.isNotEmpty &&
        passWord.text == rePassWord.text &&
        rePassWord.text.isNotEmpty) {
      print('done');
      Get.toNamed(Routes.REGISTER_TEACHER_STEP2);
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

  void checkButtonStep2() {
    errorFullName = true;
    errorPhone = true;
    errorImage = true;
    errorDateTime = true;
    errorProvincial = true;
    errorAddress = true;
    // ignore: deprecated_member_use
    errorGender = selectedGender.isNullOrBlank ? true : false;
    // ignore: deprecated_member_use
    errorExp = selectedKieuGS.isNullOrBlank ? true : false;
    errorImage = imageAvatar.isNullOrBlank ? true : false;
    print('checkNullButton');
    if (fullName.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        dateTime.text.isNotEmpty &&
        errorGender == false &&
        provincial.text.isNotEmpty &&
        address.text.isNotEmpty &&
        errorExp == false &&
        imageAvatar != null) {
      Get.toNamed(Routes.REGISTER_TEACHER_STEP3);
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

  bool errorBuoiDay = false;

  void checkButtonStep3() {
    print('checkNullButtonStep3');
    print(listSubjectSelect.length);
    print(selectedClass);
    print(listSubjectSelectTopic.length);
    print(selectedFormTeaching);
    print(provincial.text);
    print(listDistrictSelect.length);
    print(valueCheckBox);
    print('oke');

    errorSalaryCD = true;
    errorSalaryUL1 = true;
    errorSalaryUL2 = true;
    errorArea = true;
    errorProvincial = true;
    errorSubject = listSubjectSelect.isEmpty ? true : false;
    errorSubjectTopic = listSubjectSelectTopic.isEmpty ? true : false;
    errorDistrict = listDistrictSelect.isEmpty ? true : false;
    errorClass = selectedClass.isNullOrBlank ? true : false;
    errorFormTeaching = selectedFormTeaching.isNullOrBlank ? true : false;
    final data = listbuoiday.firstWhere((e) => e.sang == 1 || e.chieu == 1 || e.toi == 1, orElse: () => null);
    errorBuoiDay = data == null ? true : false;

    if (valueButtonLuong) {
      salaryCD.text.isNotEmpty &&
              listSubjectSelect.isNotEmpty &&
              !selectedClass.isNullOrBlank &&
              listSubjectSelectTopic.isNotEmpty &&
              !selectedFormTeaching.isNullOrBlank &&
              provincial.text.isNotEmpty &&
              listDistrictSelect.isNotEmpty &&
              // ignore: deprecated_member_use
              valueCheckBox &&
              salaryCD.text.isNotEmpty &&
              data != null &&
              !selectedStatusFee.isNullOrBlank
          // ignore: unnecessary_statements
          ? print('Đăng ký thành công')
          // registerTeacher()
          : Get.dialog(DialogError(
              title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
              onTap: () => Get.back(),
              textButton: 'Ok',
              richText: false,
            ));
    } else {
      salaryUL1.text.isNotEmpty &&
              salaryUL2.text.isNotEmpty &&
              listSubjectSelect.isNotEmpty &&
              !selectedClass.isNullOrBlank &&
              listSubjectSelectTopic.isNotEmpty &&
              !selectedFormTeaching.isNullOrBlank &&
              provincial.text.isNotEmpty &&
              listDistrictSelect.isNotEmpty &&
              // ignore: deprecated_member_use
              valueCheckBox &&
              salaryCD.text.isNotEmpty &&
              data != null &&
              !selectedStatusFee.isNullOrBlank
          // ignore: unnecessary_statements
          ? print('Đăng ký thành công')
          // registerTeacher()
          : Get.dialog(DialogError(
              title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
              onTap: () => Get.back(),
              textButton: 'Ok',
              richText: false,
            ));
    }

    update();
  }

// Future<void> getDataQH(int id) async {
//   print('getDataQH');
//
//   ResultData res = await authenticationRepositories.getListDataQH(id);
//   listDataQh = resultListDataQhFromJson(res.data);
//   if (res.data != null) {
//     print(200);
//   } else {
//     print('error');
//   }
// }

//   Future<void> listDataTopicSubject(String id) async {
//     print('listDataTopicSubject');
//     ResultData res = await authenticationRepositories.listDataTopicSubject(id);
//     resultDataTopic = resultDataTopicFromJson(res.data);
//     if (res.data != null) {
//       Get.to(SelectTopicSubjectGSScreen());
//       print(200);
//     } else {
//       print('error');
//     }
//   }
//
//   ResultResendOtp resultResendOtp = ResultResendOtp();
//
//   Future<void> reSendOtp() async {
//     await Future.delayed(Duration(milliseconds: 1));
//     Get.dialog(DialogLoading());
//     ResultData res = await authenticationRepositories.resendOtp(resultRegisterTeacher.data.refreshToken.userEmail);
//     resultResendOtp = resultResendOtpFromJson(res.data);
//     if (resultResendOtp.data != null) {
//       Get.back();
//       SpUtil.putString(ConstString.token, resultResendOtp.data.accessToken);
//       Utils.showToast(resultResendOtp.data.message);
//     } else {
//       Utils.showToast(resultResendOtp.error.message);
//     }
//     update();
//   }
//
//   Future<void> uploadAvatar() async {
//     print('uploadAvatar');
//
//     ResultData res = await authenticationRepositories.uploadAvatar(avatar);
//     if (res.data != null) {
//       print(200);
//     } else {
//       print('error');
//     }
//   }
// String emailOTP;
//   Future<void> registerTeacher() async {
//     Get.dialog(DialogLoading());
//     print(listQH.join(',').toString());
//     print(listQH.map((e) => e.districtId));
//     String idDistrict = listQH.map((e) => e.districtId).toString();
//     print(idDistrict);
//
//     ResultData res = await authenticationRepositories.registerTeacher(
//       fullName.text,
//       email.text,
//       passWord.text,
//       rePassWord.text,
//       imageAvatar,
//       phone.text,
//       dateTime.text,
//       idGender,
//       idProvincial,
//       //Quận huyện
//       listQH.map((e) => e.districtId).toString(),
//       address.text,
//       //Kinh nghiệm
//       idExp,
//       school.text,
//       specialized.text,
//       graduationYear.text,
//       company.text,
//       information.text,
//       experienceTeaching.text,
//       achievements.text,
//       listSubject.map((e) => e.idSubject).toString(),
//       idClass,
//       listSubjectTopic.map((e) => e.topicId).toString(),
//       idFormTeaching,
//       idValueArea,
//       salaryCD.text,
//       salaryUL1.text,
//       salaryUL2.text,
//       listbuoiday[0].sang,
//       listbuoiday[0].chieu,
//       listbuoiday[0].toi,
//       listbuoiday[1].sang,
//       listbuoiday[1].chieu,
//       listbuoiday[1].toi,
//       listbuoiday[2].sang,
//       listbuoiday[2].chieu,
//       listbuoiday[2].toi,
//       listbuoiday[3].sang,
//       listbuoiday[3].chieu,
//       listbuoiday[3].toi,
//       listbuoiday[4].sang,
//       listbuoiday[4].chieu,
//       listbuoiday[4].toi,
//       listbuoiday[5].sang,
//       listbuoiday[5].chieu,
//       listbuoiday[5].toi,
//       listbuoiday[6].sang,
//       listbuoiday[6].chieu,
//       listbuoiday[6].toi,
//     );
//     resultRegisterTeacher = resultRegisterTeacherFromJson(res.data);
//     if (resultRegisterTeacher.data != null) {
//       Get.back();
//       print(200);
//       emailOTP = resultRegisterTeacher.data.refreshToken.userEmail;
//       Utils.showToast(resultRegisterTeacher.data.message);
//       SpUtil.putString(ConstString.token_register, resultRegisterTeacher.data.accessToken);
//       Get.to(ConfirmRegisterScreen(
//         email: emailOTP,
//       ));
//       print(res.data);
//     } else {
//       Get.back();
//       Utils.showToast(resultRegisterTeacher.error.message);
//       print('Lỗi');
//     }
//     update();
//   }
//
//   ResultRegisterTeacher resultRegisterTeacher = ResultRegisterTeacher();
}
