import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_teaacher.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_district.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_provincial_subject.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_topic.dart';
import 'package:giasu_vn/common/shared/data/models/result_update_avatar.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/user_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/information/information_teacher/update_info_teacher_step1_screen.dart';
import 'package:giasu_vn/screen/information/information_teacher/update_info_teacher_step2_screen.dart';
import 'package:giasu_vn/screen/navigation/navigation_screen.dart';
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
  ResultGetInfoTeacher resultGetInfoTeacher = ResultGetInfoTeacher();
  Lichday lichday = Lichday();
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
  DateTime start;
  DateTime end;
  String valueGender = 'Khác';
  String valueExperience = 'Chọn kiểu gia sư';
  DateTime valueDate = DateTime.now();
  final f = new DateFormat('dd-MM-yyyy');
  final picker = ImagePicker();
  List<ListDistrict> listDistrict = [];
  List<ListDistrict> listDistrictArea = [];

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
  bool errorDistrictArea = false;
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
  bool valueButtonLuong = true;
  int idClass = 0;
  int idLuong = 0;
  int idDistrict = 0;
  int idFormTeaching = 0;
  String valueArea;

  int idValueArea;

  int idSubject;

  void changValueButtonLuong() {
    print('valueButtonLuong');

    valueButtonLuong = !valueButtonLuong;
    print(valueButtonLuong);
    if (!valueButtonLuong) {
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

  List<DataSubject> listSubjectSelect = [];
  List<String> listIdSubjectSelect = [];
  List<String> listSubject = [];
  List<String> listSubjectTopic = [];

  List<String> listDistrictSelect = [];
  List<String> listIdDistrictSelect = [];
  List<String> listIdDetailDistrictSelect = [];
  List<String> listKieuGS = ['Sinh viên', 'Người đi làm', 'Giáo viên'];
  List<String> listMarriage = ['Đã kết hôn', 'Chưa kết hôn'];
  List<String> listFormTeaching = ['Online', 'Gặp mặt'];
  List<String> listGender = ['Nam', 'Nữ'];
  List<String> listLuong = ['Giờ', 'Ngày', 'Tháng'];
  List<String> listFee = ['Chọn hình thức học phí', 'Cố định', 'Ước Lượng'];

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
  TextEditingController area = TextEditingController();
  TextEditingController fee = TextEditingController();
  TextEditingController salaryCD = TextEditingController();
  TextEditingController salaryUL1 = TextEditingController();
  TextEditingController salaryUL2 = TextEditingController();

  String valueProvincial;
  String urlAvatar = '';
  int idValueProvincial;
  int idMariage;

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
    district.addListener(() {
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
    area.addListener(() {
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
    search.addListener(() {
      update();
    });
    super.onInit();
    update();
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

  @override
  void dispose() {
    // TODO: implement dispose
    fullName.dispose();
    passWord.dispose();
    rePassWord.dispose();
    fullName.dispose();
    email.dispose();
    phone.dispose();

    dateTime.dispose();
    provincial.dispose();
    district.dispose();
    address.dispose();
    numberYearExp.dispose();
    titleExp.dispose();
    timeExpStart.dispose();
    timeExpEnd.dispose();
    informationExp.dispose();
    area.dispose();
    salaryCD.dispose();
    salaryUL1.dispose();
    salaryUL2.dispose();
    search.dispose();
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
    if (errorArea && area.text.isEmpty) {
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
    } else if (errorTimeExpStart && f.parse(timeExpEnd.text).isBefore(f.parse(timeExpStart.text))) {
      return 'Thời gian bắt đầu sai!';
    }
    return null;
  }

  String checkTimeExpEnd() {
    print('checkTimeExp');
    if (errorTimeExpEnd && timeExpEnd.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorTimeExpEnd && f.parse(timeExpEnd.text).isBefore(f.parse(timeExpStart.text))) {
      return 'Thời gian kết thúc sai!';
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
    } else if (errorSalaryCD && int.parse(salaryCD.text) <= 0) {
      return 'Lương phải lớn hơn 0';
    }
    return null;
  }

  String checkSalaryUL1() {
    print('checkSalaryUL1');
    if (errorSalaryUL1 && salaryUL1.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorSalaryUL1 && int.parse(salaryUL1.text) <= 0) {
      return 'Lương phải lớn hơn 0';
    }
    return null;
  }

  String checkSalaryUL2() {
    print('checkSalaryUL2');
    if (errorSalaryUL2 && salaryUL2.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorSalaryUL2 && int.parse(salaryUL2.text) <= 0) {
      return 'Lương phải lớn hơn 0';
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
    area.text = value;
    print(area.text);
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
    for (int i = 0; i < listDataClass.length; i++) {
      if (value == listDataClass[i].ctName) {
        idClass = int.parse(listDataClass[i].ctId);
      }
    }
    ;
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
    idFormTeaching = selectedFormTeaching == 'Gặp mặt' ? 1 : 2;
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

  int idTime;

  void onSelectedStatusFee(String value) {
    selectedStatusFee = value;
    idTime = selectedStatusFee == 'Giờ'
        ? 1
        : selectedStatusFee == 'Ngày'
            ? 2
            : 3;
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

  RegExp regExp = new RegExp(r'^((0[0-9])|(84[0-9]))\d{8,10}$');

  String checkPhone() {
    print('checkPassword');
    if (errorPhone && phone.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorPhone && !regExp.hasMatch(phone.text)) {
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
    errorDistrictArea = false;
    update();
  }

  void onSelectSubject(DataSubject value) {
    print('onSelectSubject');
    if (!listSubjectSelect.map((e) => e).contains(value)) {
      listSubjectSelect.add(value);
    } else {
      listSubjectSelect.remove(value);
    }
    errorSubject = false;
    update();
  }

  List<ListSubjectTag> listSubjectSelectTopic = [];

  void onSelectSubjectTopic(ListSubjectTag value) {
    print('onSelectSubject');
    if (!listSubjectSelectTopic.map((e) => e.idSubject).contains(value.idSubject)) {
      listSubjectSelectTopic.add(value);
    } else {
      listSubjectSelectTopic.remove(value);
    }
    errorSubjectTopic = false;
    update();
  }

  List<ListSubjectTag> listTopic = [];
  ResultListTopic resultListTopic = ResultListTopic();

  Future<void> getListTopic(String idTopic) async {
    listTopic = [];
    print('getListTopic');
    print(listSubjectSelect.join(','));
    ResultData res = await authenticationRepositories.listDetailSubject(idTopic);
    resultListTopic = resultListTopicFromJson(res.data);
    if (resultListTopic.data != null) {
      listTopic = resultListTopic.data.listSubjectTag;
      // Utils.showToast(resultListTopic.data.message);
    } else {
      // Utils.showToast(resultListTopic.error.message);
    }
    update();
  }

  Future<void> getListDataTopic(String idTopic) async {
    listTopic = [];
    listSubjectSelectTopic.clear();
    print('getListTopic');
    print(listSubjectSelect.join(','));
    ResultData res = await authenticationRepositories.listDetailSubject(idTopic);
    resultListTopic = resultListTopicFromJson(res.data);
    if (resultListTopic.data != null) {
      listTopic = resultListTopic.data.listSubjectTag;
      resultGetInfoTeacher.data.infoTutor.asDetail.forEach((element) {
        // listDataSubject.map((e) => e.asName == element);
        print('element');
        print(element);
        print(listTopic.map((e) => e.nameSubject));
        for (int i = 0; i < listTopic.length; i++) {
          if (listTopic[i].nameSubject == element) {
            listSubjectSelectTopic.add(listTopic[i]);
          }
        }
      });
      // Utils.showToast(resultListTopic.data.message);
    } else {
      // Utils.showToast(resultListTopic.error.message);
    }
    update();
  }

  Future<void> getListDistrict(int idCity) async {
    listDistrict = [];
    ResultData res = await authenticationRepositories.listDistrict(idCity);
    resultListDistrict = resultListDistrictFromJson(res.data);
    if (resultListDistrict.data != null) {
      listDistrict = resultListDistrict.data.listCity;
      // Utils.showToast(resultListDistrict.data.message);
    } else {
      // Utils.showToast(resultListDistrict.error.message);
    }
    update();
  }

  Future<void> getListDistrictArea(int idCity) async {
    listDistrictArea = [];
    ResultData res = await authenticationRepositories.listDistrict(idCity);
    resultListDistrict = resultListDistrictFromJson(res.data);
    if (resultListDistrict.data != null) {
      listDistrictArea = resultListDistrict.data.listCity;
      // Utils.showToast(resultListDistrict.data.message);
    } else {
      // Utils.showToast(resultListDistrict.error.message);
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
    // errorDateTime = true;
    errorProvincial = true;
    errorDistrict = true;
    errorAddress = true;
    // errorNumberYearExp = true;
    // errorTitleExp = true;
    // errorTimeExpStart = true;
    // errorTimeExpEnd = true;
    // errorInformationExp = true;
    // ignore: deprecated_member_use
    // errorGender = selectedGender.isNullOrBlank ? true : false;
    // ignore: deprecated_member_use
    errorExp = selectedKieuGS.isNullOrBlank ? true : false;
    errorMarriage = selectedMarriage.isNullOrBlank ? true : false;
    errorImage = imageAvatar.isNullOrBlank ? true : false;
    print('checkNullButton');
    if (fullName.text.isNotEmpty &&
            phone.text.isNotEmpty &&
            regExp.hasMatch(phone.text) &&
            // dateTime.text.isNotEmpty &&
            // errorGender == false &&
            errorMarriage == false &&
            provincial.text.isNotEmpty &&
            district.text.isNotEmpty &&
            f.parse(timeExpStart.text).isBefore(f.parse(timeExpEnd.text))
        // &&
        // address.text.isNotEmpty &&
        // numberYearExp.text.isNotEmpty &&
        // numberYearExp.text != '0' &&
        // titleExp.text.isNotEmpty &&
        // timeExpStart.text.isNotEmpty &&
        // f.parse(timeExpStart.text).isBefore(f.parse(timeExpEnd.text)) &&
        // timeExpEnd.text.isNotEmpty &&
        // informationExp.text.isNotEmpty
        ) {
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
  bool errorLuong = false;

  void checkButtonStep3() {
    print('checkNullButtonStep3');
    errorSalaryCD = true;
    errorSalaryUL1 = true;
    errorSalaryUL2 = true;
    errorArea = true;
    errorProvincial = true;
    errorExp = true;
    errorSubject = listSubjectSelect.isEmpty ? true : false;
    errorSubjectTopic = listSubjectSelectTopic.isEmpty ? true : false;
    errorDistrictArea = listDistrictSelect.isEmpty ? true : false;
    errorKieuGS = selectedKieuGS.isNullOrBlank ? true : false;
    errorClass = selectedClass.isNullOrBlank ? true : false;
    errorFormTeaching = selectedFormTeaching.isNullOrBlank ? true : false;
    final data = listbuoiday.firstWhere((e) => e.sang == '1' || e.chieu == '1' || e.toi == '1', orElse: () => null);
    errorBuoiDay = data == null ? true : false;
print('idTime');
print(idTime);
    if (valueButtonLuong) {
      print('TH1');
      salaryCD.text.isNotEmpty &&
              int.parse(salaryCD.text) > 0 &&
              !errorKieuGS &&
              listSubjectSelect.isNotEmpty &&
              listSubjectSelectTopic.isNotEmpty &&
              !selectedClass.isNullOrBlank &&
              !selectedFormTeaching.isNullOrBlank &&
              area.text.isNotEmpty &&
              listDistrictSelect.isNotEmpty &&
              // ignore: deprecated_member_use
              data != null &&
              !selectedStatusFee.isNullOrBlank
          // ignore: unnecessary_statements
          ? updateInfoTeacher()
          // registerTeacher()
          : Get.dialog(DialogError(
              title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
              onTap: () => Get.back(),
              textButton: 'Ok',
              richText: false,
            ));
    } else {
      print('TH2');

      errorLuong = int.parse(salaryUL1.text) > int.parse(salaryUL2.text) ? true : false;
      salaryUL1.text.isNotEmpty &&
              salaryUL2.text.isNotEmpty &&
              !errorKieuGS &&
              listSubjectSelect.isNotEmpty &&
              listSubjectSelectTopic.isNotEmpty &&
              !selectedClass.isNullOrBlank &&
              !selectedFormTeaching.isNullOrBlank &&
              area.text.isNotEmpty &&
              listDistrictSelect.isNotEmpty &&
              data != null &&
              int.parse(salaryUL1.text) > 0 &&
              int.parse(salaryUL2.text) > 0 &&
              int.parse(salaryUL1.text) < int.parse(salaryUL2.text) &&
              !selectedStatusFee.isNullOrBlank
          // ignore: unnecessary_statements
          ? updateInfoTeacher()
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
    resultGetInfoTeacher = resultGetInfoTeacherFromJson(res.data);
    if (resultGetInfoTeacher.data != null) {
      Get.back();
      // Utils.showToast(resultGetInfoTeacher.data.message);
      urlAvatar = resultGetInfoTeacher.data.infoTutor.ugsAvatar;
      print(resultGetInfoTeacher.data.infoTutor.ugsBrithday);
      fullName.text = resultGetInfoTeacher.data.infoTutor.ugsName;
      phone.text = resultGetInfoTeacher.data.infoTutor.ugsPhone;
      selectedGender = resultGetInfoTeacher.data.infoTutor.ugsGender;
      dateTime.text = resultGetInfoTeacher.data.infoTutor.ugsBrithday;
      selectedMarriage = resultGetInfoTeacher.data.infoTutor.ugsMarriage;
      provincial.text = resultGetInfoTeacher.data.infoTutor.citNameGs;
      district.text = resultGetInfoTeacher.data.infoTutor.citDetailGs;
      address.text = resultGetInfoTeacher.data.infoTutor.ugsAddress;
      numberYearExp.text = resultGetInfoTeacher.data.infoTutor.ugsExperence;
      graduationYear.text = resultGetInfoTeacher.data.infoTutor.ugsGraduationYear;
      titleExp.text = resultGetInfoTeacher.data.infoTutor.ugsTitle;
      timeExpStart.text = resultGetInfoTeacher.data.infoTutor.ugsYearStart;
      timeExpEnd.text = resultGetInfoTeacher.data.infoTutor.ugsYearEnd;
      // end = DateTime.parse(resultGetInfoTeacher.data.infoTutor.ugsYearEnd);
      // start = DateTime.parse(resultGetInfoTeacher.data.infoTutor.ugsYearStart);
      informationExp.text = resultGetInfoTeacher.data.infoTutor.ugsJobDescription;
      school.text = resultGetInfoTeacher.data.infoTutor.ugsSchool;
      prize.text = resultGetInfoTeacher.data.infoTutor.ugsAchievements;
      company.text = resultGetInfoTeacher.data.infoTutor.ugsWorkplace;
      information.text = resultGetInfoTeacher.data.infoTutor.ugsAboutUs;
      selectedKieuGS = resultGetInfoTeacher.data.infoTutor.nametype;
      listSubjectSelect.clear();
      resultGetInfoTeacher.data.infoTutor.asName.forEach((element) {
        // listDataSubject.map((e) => e.asName == element);
        for (int i = 0; i < listDataSubject.length; i++) {
          if (listDataSubject[i].asName == element) {
            listSubjectSelect.add(listDataSubject[i]);
          }
        }
      });
      // getListTopic(listSubjectSelect.map((e) => e.asId).join(','));
      getListDataTopic(listSubjectSelect.map((e) => e.asId).join(','));
      // listSubjectTopic = resultGetInfoTeacher.data.infoTutor.asDetail;
      selectedClass = resultGetInfoTeacher.data.infoTutor.ctName;
      selectedFormTeaching = resultGetInfoTeacher.data.infoTutor.ugsFormality;
      area.text = resultGetInfoTeacher.data.infoTutor.citName;
      listDistrictSelect = resultGetInfoTeacher.data.infoTutor.citDetail;
      errorDistrictArea = listDistrictSelect.isEmpty ? true : false;
      getListDistrictArea(int.parse(resultGetInfoTeacher.data.infoTutor.ugsCity));
      salaryCD.text = resultGetInfoTeacher.data.infoTutor.ugsUnitPrice;
      for (int i = 0; i < listDataClass.length; i++) {
        if (resultGetInfoTeacher.data.infoTutor.ctName == listDataClass[i].ctName) {
          idClass = int.parse(listDataClass[i].ctId);
        }
      }
      valueButtonLuong = resultGetInfoTeacher.data.infoTutor.ugsSalary == '' ? true : false;

      // resultGetInfoTeacher.data.infoTutor.ugsUnitPrice.isNotEmpty ? valueButtonLuong = true : valueButtonLuong = false;
      idProvincial = int.parse(resultGetInfoTeacher.data.infoTutor.ugsCityGs);
      idDistrict = int.parse(resultGetInfoTeacher.data.infoTutor.ugsCountyGs);
      listIdSubjectSelect = resultGetInfoTeacher.data.infoTutor.asId.split(',');
      listIdDistrictSelect = resultGetInfoTeacher.data.infoTutor.asDetailId.split(',');
      selectedStatusFee = resultGetInfoTeacher.data.infoTutor.ugsTime;
      salaryUL1.text = resultGetInfoTeacher.data.infoTutor.ugsSalary.split('-').first;
      salaryUL2.text = resultGetInfoTeacher.data.infoTutor.ugsSalary.split('-').last;
      idValueArea = int.parse(resultGetInfoTeacher.data.infoTutor.ugsCity);
      listIdDetailDistrictSelect = resultGetInfoTeacher.data.infoTutor.citDetailId.split(',');

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
      lichday = resultGetInfoTeacher.data.lichday;

      // provincial.text = resultGetInfoTeacher.data.data.citName;
      // address.text = resultGetInfoTeacher.data.data.ugsAddress;
      Get.to(UpdateInfoTeacherStep1Screen());
    } else {
      Get.back();
      Utils.showToast(resultGetInfoTeacher.error.message);
    }
    update();
  }

  void setDataLichDay() {
    resultGetInfoTeacher.data.lichday.st2 = listbuoiday[0].sang;
    resultGetInfoTeacher.data.lichday.ct2 = listbuoiday[0].chieu;
    resultGetInfoTeacher.data.lichday.tt2 = listbuoiday[0].toi;
    resultGetInfoTeacher.data.lichday.st3 = listbuoiday[1].sang;
    resultGetInfoTeacher.data.lichday.ct3 = listbuoiday[1].chieu;
    resultGetInfoTeacher.data.lichday.tt3 = listbuoiday[1].toi;
    resultGetInfoTeacher.data.lichday.st4 = listbuoiday[2].sang;
    resultGetInfoTeacher.data.lichday.ct4 = listbuoiday[2].chieu;
    resultGetInfoTeacher.data.lichday.tt4 = listbuoiday[2].toi;
    resultGetInfoTeacher.data.lichday.st5 = listbuoiday[3].sang;
    resultGetInfoTeacher.data.lichday.ct5 = listbuoiday[3].chieu;
    resultGetInfoTeacher.data.lichday.tt5 = listbuoiday[3].toi;
    resultGetInfoTeacher.data.lichday.st6 = listbuoiday[4].sang;
    resultGetInfoTeacher.data.lichday.ct6 = listbuoiday[4].chieu;
    resultGetInfoTeacher.data.lichday.tt6 = listbuoiday[4].toi;
    resultGetInfoTeacher.data.lichday.st7 = listbuoiday[5].sang;
    resultGetInfoTeacher.data.lichday.ct7 = listbuoiday[5].chieu;
    resultGetInfoTeacher.data.lichday.tt7 = listbuoiday[5].toi;
    resultGetInfoTeacher.data.lichday.scn = listbuoiday[6].sang;
    resultGetInfoTeacher.data.lichday.ccn = listbuoiday[6].chieu;
    resultGetInfoTeacher.data.lichday.tcn = listbuoiday[6].toi;
    update();
  }

  Future<void> updateInfoTeacher() async {
    setDataLichDay();
    print('resultLichDayToJson(lichday)');
    print(resultLichDayToJson(lichday));
    final test = listbuoiday.map((e) => e.sang).toList() + listbuoiday.map((e) => e.chieu).toList() + listbuoiday.map((e) => e.toi).toList();
    print(test.join(','));
    Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await userRepositories.updateInfoTeacher(
        token,
        phone.text,
        fullName.text,
        idGender = selectedGender == "Nam" ? 1 : 2,
        dateTime.text,
        idMariage = selectedMarriage == 'Chưa kết hôn' ? 0 : 1,
        idExp = selectedKieuGS == 'Sinh viên'
            ? 1
            : selectedKieuGS == 'Người đi làm'
                ? 2
                : 3,
        idClass,
        school.text,
        numberYearExp.text,
        'specialized',
        idProvincial,
        idDistrict,
        address.text,
        company.text,
        information.text,
        prize.text,
        int.parse(numberYearExp.text),
        titleExp.text,
        timeExpStart.text,
        timeExpEnd.text,
        informationExp.text,
        listSubjectSelect.map((e) => e.asId).join(','),
        listSubjectSelectTopic.map((e) => e.idSubject).join(','),
        idFormTeaching = selectedFormTeaching == 'Gặp mặt' ? 1 : 2,
        salaryCD.text,
        idTime = selectedStatusFee == 'Giờ'
            ? 1
            : selectedStatusFee == 'Ngày'
                ? 2
                : 3,
        salaryUL1.text,
        salaryUL2.text,
        idValueArea,
        listIdDetailDistrictSelect.join(','),
        resultLichDayToJson(lichday));
    print('11111');
    print(idTime);
    print(selectedStatusFee);
    print(listIdDetailDistrictSelect.join(','));
    ResultGetInfoTeacher resultGetInfoTeacher = resultGetInfoTeacherFromJson(res.data);
    if (resultGetInfoTeacher.data != null) {
      Get.back();
      Utils.showToast(resultGetInfoTeacher.data.message);
      Get.offAndToNamed(Routes.navigation);
    } else {
      Get.back();
      Utils.showToast(resultGetInfoTeacher.error.message);
    }
    update();
  }
}
