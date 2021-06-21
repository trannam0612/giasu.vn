import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_teaacher.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_district.dart';
import 'package:giasu_vn/common/shared/data/models/result_update_avatar.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/user_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/information/information_teacher/update_info_teacher_step1_screen.dart';
import 'package:giasu_vn/screen/information/information_teacher/update_info_teacher_step2_screen.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

class UpdateInfoTeacherController extends GetxController {
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  ResultListDistrict resultListDistrict = ResultListDistrict();
  UserRepositories userRepositories = UserRepositories();
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
  List<ListDistrict> listDistrict = [];

  // List<String> listGender = ['Khác', 'Nam', 'Nữ'];
  List<buoiday> listbuoiday = [
    buoiday('Thứ 2', '1', "0", "0"),
    buoiday('Thứ 3', "0", "0", "0"),
    buoiday('Thứ 4', "0", "0", "0"),
    buoiday('Thứ 5', "0", "0", "0"),
    buoiday('Thứ 6', "0", "0", "0"),
    buoiday('Thứ 7', "0", "0", "0"),
    buoiday('CN', "0", "0", "0"),
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
  bool errorNumberYearExp = false;
  bool errorExp = false;
  bool errorMarriage = false;
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
  int idDistrict = 0;
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
  String selectedMarriage;

  //Step3
  String selectedSubject;
  String selectedClass;
  String selectedFormTeaching;
  String selectedLuong;
  bool valueCheckBox = false;
  bool errorKieuGS = false;
  String selectedStatusFee = 'Giờ';

  List<String> listSubjectSelect = [];
  List<String> listDistrictSelect = [];
  List<String> listKieuGS = ['Sinh viên', 'Người đi làm', 'Giáo viên'];
  List<String> listMarriage = ['Đã kết hôn', 'Chưa kết hôn'];
  List<String> listSubjectTopic = ['Toán cấp 1', 'Toán Cấp 2', 'Văn cấp 1', 'Lý cấp 2', 'Hóa cấp 2'];
  List<String> listFormTeaching = ['Online', 'Tại nhà'];
  List<String> listClass = ['Lớp 1', 'Lớp 2', 'Lớp 3'];
  List<String> listSubject = ['Chọn hình thức dạy', 'Online', 'Tại nhà'];
  List<String> listQH = ['Quận Hai Bà Trưng', 'Quận Hoàng Mai', 'Quận Hoàn Kiếm', 'Huyện Mỹ Hào', 'Quận Thanh Xuân', 'Quận Nam Từ Niêm', 'Quận Tây Hồ'];
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
  TextEditingController numberYearExp = TextEditingController();
  TextEditingController titleExp = TextEditingController();
  TextEditingController timeExpStart = TextEditingController();
  TextEditingController timeExpEnd = TextEditingController();
  TextEditingController informationExp = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController school = TextEditingController();
  TextEditingController prize = TextEditingController();
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
  String urlAvatar = '';
  int idValueProvincial;

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
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await userRepositories.updateAvatar(token, avatar);
    ResultUpdateAvatar resultUpdateAvatar = resultUpdateAvatarFromJson(res.data);
    if (resultUpdateAvatar.data != null) {
      Get.back();
      Utils.showToast(resultUpdateAvatar.data.message);
    } else {
      Get.back();
      Utils.showToast(resultUpdateAvatar.error.message);
    }
    update();
  }

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
    numberYearExp.addListener(() {
      update();
    });
    titleExp.addListener(() {
      update();
    });
    timeExpStart.addListener(() {
      update();
    });
    timeExpEnd.addListener(() {
      update();
    });
    informationExp.addListener(() {
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

  String checkNumberYearExp() {
    print('checkNumberYearExp');
    if (errorNumberYearExp && numberYearExp.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorNumberYearExp && numberYearExp.text == '0') {
      return 'Số năm không hợp lệ!';
    }
    return null;
  }

  bool errorTitleExp = false;
  bool errorTimeExpStart = false;
  bool errorTimeExpEnd = false;
  bool errorInformationExp = false;

  String checkTitleExp() {
    print('checkTitleExp');
    if (errorTitleExp && titleExp.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkTimeExpStart() {
    print('checkTimeExp');
    if (errorTimeExpStart && timeExpStart.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkTimeExpEnd() {
    print('checkTimeExp');
    if (errorTimeExpEnd && timeExpEnd.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkInformationExp() {
    print('checkInformationExp');
    if (errorInformationExp && informationExp.text.isEmpty) {
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
    errorKieuGS = false;
    update();
  }

  void onSelectedMarriage(String value) {
    selectedMarriage = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachKieuGiaSu.length; i++) {
    //   if (loginController.resultListData.data.danhSachKieuGiaSu[i].nameType == value) {
    //     idExp = loginController.resultListData.data.danhSachKieuGiaSu[i].typeId;
    //   }
    // }
    errorMarriage = false;
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

  Future<void> getListDistrict(int idCity) async {
    listDistrict = [];
    ResultData res = await authenticationRepositories.listDistrict(idCity);
    resultListDistrict = resultListDistrictFromJson(res.data);
    if (resultListDistrict.data != null) {
      listDistrict = resultListDistrict.data.dataDistrict.listDistrict;
      Utils.showToast(resultListDistrict.data.message);
    } else {
      Utils.showToast(resultListDistrict.error.message);
    }
    update();
  }

//Step3
//
//   void checkButtonStep1() {
//     print('checkButton');
//
//     errorEmail = true;
//     errorShowPassword = true;
//     errorShowRePassword = true;
//     if (email.text.contains('@') && email.text.contains('.') && passWord.text.length >= 6 && passWord.text.isNotEmpty && passWord.text == rePassWord.text && rePassWord.text.isNotEmpty) {
//       print('done');
//       Get.toNamed(Routes.REGISTER_TEACHER_STEP2);
//     } else {
//       Get.dialog(DialogError(
//         title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
//         onTap: () => Get.back(),
//         textButton: 'Ok',
//         richText: false,
//       ));
//     }
//     update();
//   }

  void checkButtonStep1() {
    errorFullName = true;
    errorPhone = true;
    errorImage = true;
    errorDateTime = true;
    errorProvincial = true;
    errorDistrict = true;
    errorAddress = true;
    errorNumberYearExp = true;
    errorTitleExp = true;
    errorTimeExpStart = true;
    errorTimeExpEnd = true;
    errorInformationExp = true;
    // ignore: deprecated_member_use
    errorGender = selectedGender.isNullOrBlank ? true : false;
    // ignore: deprecated_member_use
    errorExp = selectedKieuGS.isNullOrBlank ? true : false;
    errorMarriage = selectedMarriage.isNullOrBlank ? true : false;
    errorImage = imageAvatar.isNullOrBlank ? true : false;
    print('checkNullButton');
    if (fullName.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        dateTime.text.isNotEmpty &&
        errorGender == false &&
        errorMarriage == false &&
        provincial.text.isNotEmpty &&
        district.text.isNotEmpty &&
        address.text.isNotEmpty &&
        numberYearExp.text.isNotEmpty &&
        numberYearExp.text != '0' &&
        titleExp.text.isNotEmpty &&
        timeExpStart.text.isNotEmpty &&
        timeExpEnd.text.isNotEmpty &&
        informationExp.text.isNotEmpty &&
        imageAvatar != null) {
      Get.to(UpdateInfoTeacherStep2Screen());
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
    print(areaTeaching.text);
    print(errorKieuGS);
    print(listDistrictSelect.length);
    print(valueCheckBox);
    print('oke');

    errorSalaryCD = true;
    errorSalaryUL1 = true;
    errorSalaryUL2 = true;
    errorArea = true;
    errorProvincial = true;
    errorExp = true;
    errorSubject = listSubjectSelect.isEmpty ? true : false;
    errorSubjectTopic = listSubjectSelectTopic.isEmpty ? true : false;
    errorDistrict = listDistrictSelect.isEmpty ? true : false;
    errorKieuGS = selectedKieuGS.isNullOrBlank ? true : false;
    errorClass = selectedClass.isNullOrBlank ? true : false;
    errorFormTeaching = selectedFormTeaching.isNullOrBlank ? true : false;
    final data = listbuoiday.firstWhere((e) => e.sang == 1 || e.chieu == 1 || e.toi == 1, orElse: () => null);
    errorBuoiDay = data == null ? true : false;

    if (valueButtonLuong) {
      salaryCD.text.isNotEmpty &&
              !errorKieuGS &&
              listSubjectSelect.isNotEmpty &&
              listSubjectSelectTopic.isNotEmpty &&
              !selectedClass.isNullOrBlank &&
              !selectedFormTeaching.isNullOrBlank &&
              areaTeaching.text.isNotEmpty &&
              listDistrictSelect.isNotEmpty &&
              // ignore: deprecated_member_use
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
              !errorKieuGS &&
              listSubjectSelect.isNotEmpty &&
              listSubjectSelectTopic.isNotEmpty &&
              !selectedClass.isNullOrBlank &&
              !selectedFormTeaching.isNullOrBlank &&
              areaTeaching.text.isNotEmpty &&
              listDistrictSelect.isNotEmpty &&
              // ignore: deprecated_member_use
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

  String checkDistrict() {
    print('checkProvincial');
    if (errorDistrict && district.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  Future<void> getInfoTeacher() async {
    Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await userRepositories.getInfoTeacher(token);
    ResultGetInfoTeacher resultGetInfoTeacher = resultGetInfoTeacherFromJson(res.data);
    if (resultGetInfoTeacher.data != null) {
      Get.back();
      Utils.showToast(resultGetInfoTeacher.data.message);
      urlAvatar = resultGetInfoTeacher.data.infoTutor.ugsAvatar;
      print(resultGetInfoTeacher.data.infoTutor.ugsBrithday);
      fullName.text = resultGetInfoTeacher.data.infoTutor.ugsName;
      phone.text = resultGetInfoTeacher.data.infoTutor.ugsPhone;
      selectedGender = resultGetInfoTeacher.data.infoTutor.ugsGender;
      dateTime.text = resultGetInfoTeacher.data.infoTutor.ugsBrithday;
      selectedMarriage = resultGetInfoTeacher.data.infoTutor.ugsMarriage;
      provincial.text = resultGetInfoTeacher.data.infoTutor.citNameGs;
      address.text = resultGetInfoTeacher.data.infoTutor.ugsAddress;
      numberYearExp.text = resultGetInfoTeacher.data.infoTutor.ugsExperence;
      titleExp.text = resultGetInfoTeacher.data.infoTutor.ugsTitle;
      timeExpStart.text = resultGetInfoTeacher.data.infoTutor.ugsYearStart;
      timeExpEnd.text = resultGetInfoTeacher.data.infoTutor.ugsYearEnd;
      informationExp.text = resultGetInfoTeacher.data.infoTutor.ugsJobDescription;
      school.text = resultGetInfoTeacher.data.infoTutor.ugsSchool;
      prize.text = resultGetInfoTeacher.data.infoTutor.ugsAchievements;
      company.text = resultGetInfoTeacher.data.infoTutor.ugsWorkplace;
      information.text = resultGetInfoTeacher.data.infoTutor.ugsAboutUs;
      selectedKieuGS = resultGetInfoTeacher.data.infoTutor.nametype;
      listSubjectSelect = resultGetInfoTeacher.data.infoTutor.asDetail;
      listSubjectSelectTopic = resultGetInfoTeacher.data.infoTutor.asDetail;
      selectedClass = resultGetInfoTeacher.data.infoTutor.ctName;
      selectedFormTeaching = resultGetInfoTeacher.data.infoTutor.ctName;
      areaTeaching.text = resultGetInfoTeacher.data.infoTutor.citName;
      listDistrictSelect = resultGetInfoTeacher.data.infoTutor.citDetail;

      listbuoiday[0].sang = resultGetInfoTeacher.data.lichday.st2;
      listbuoiday[0].chieu = resultGetInfoTeacher.data.lichday.ct2;
      listbuoiday[0].toi = resultGetInfoTeacher.data.lichday.tt2;
      listbuoiday[1].sang = resultGetInfoTeacher.data.lichday.st3;
      listbuoiday[1].chieu = resultGetInfoTeacher.data.lichday.ct3;
      listbuoiday[1].toi = resultGetInfoTeacher.data.lichday.tt3;
      listbuoiday[2].sang = resultGetInfoTeacher.data.lichday.st4;
      listbuoiday[2].chieu = resultGetInfoTeacher.data.lichday.ct4;
      listbuoiday[2].toi = resultGetInfoTeacher.data.lichday.tt4;
      listbuoiday[3].sang = resultGetInfoTeacher.data.lichday.st5;
      listbuoiday[3].chieu = resultGetInfoTeacher.data.lichday.ct5;
      listbuoiday[3].toi = resultGetInfoTeacher.data.lichday.tt5;
      listbuoiday[4].sang = resultGetInfoTeacher.data.lichday.st6;
      listbuoiday[4].chieu = resultGetInfoTeacher.data.lichday.ct6;
      listbuoiday[4].toi = resultGetInfoTeacher.data.lichday.tt6;
      listbuoiday[5].sang = resultGetInfoTeacher.data.lichday.st7;
      listbuoiday[5].chieu = resultGetInfoTeacher.data.lichday.ct7;
      listbuoiday[5].toi = resultGetInfoTeacher.data.lichday.tt7;
      listbuoiday[6].sang = resultGetInfoTeacher.data.lichday.scn;
      listbuoiday[6].chieu = resultGetInfoTeacher.data.lichday.ccn;
      listbuoiday[6].toi = resultGetInfoTeacher.data.lichday.tcn;
      // provincial.text = resultGetInfoTeacher.data.data.citName;
      // address.text = resultGetInfoTeacher.data.data.ugsAddress;
      Get.to(UpdateInfoTeacherStep1Screen());
    } else {
      Get.back();
      Utils.showToast(resultGetInfoTeacher.error.message);
    }
    update();
  }
}
