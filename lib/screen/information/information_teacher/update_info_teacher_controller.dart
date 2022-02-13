import 'dart:io';

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
import 'package:giasu_vn/screen/navigation/navigation_controller.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

class UpdateInfoTeacherController extends GetxController {
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  ResultListDistrict resultListDistrict = ResultListDistrict();
  UserRepositories userRepositories = UserRepositories();
  NavigationController navigationController = Get.put(NavigationController());

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
  bool errorNTN = false;
  int idGender = 0;
  int idProvincial = 0;
  int idExp = 0;
  bool errorStatusTime = false;

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
  bool errorTime = false;

  //Step3
  String selectedSubject;
  String selectedClass;
  String selectedFormTeaching;
  String selectedLuong;
  bool valueCheckBox = false;
  bool errorKieuGS = false;
  bool errorDistrictS3 = false;

  String selectedStatusFee = 'Buổi';
  String selectedTime = 'Buổi';

  List<DataSubject> listSubjectSelect = [];
  List<String> listIdSubjectSelect = [];

  List<String> listDistrictSelect = [];
  List<String> listIdDistrictSelect = [];
  List<String> listIdDetailDistrictSelect = [];
  List<String> listMarriage = ['Đã kết hôn', 'Chưa kết hôn'];
  List<String> listFormTeaching = ['Online', 'Gặp mặt'];
  List<String> listGender = ['Nam', 'Nữ', 'Khác'];
  Map<int, String> listLuong = {
    2: 'Buổi',
    3: 'Tháng',
  };
  List<String> listFee = ['Chọn hình thức học phí', 'Cố định', 'Ước Lượng'];

  //Step1

  GlobalKey<FormState> fullNameKey = GlobalKey(debugLabel: '_SomeState');
  GlobalKey<FormState> phoneKey = GlobalKey(debugLabel: '_SomeState');
  GlobalKey<FormState> provincialKey = GlobalKey(debugLabel: '_SomeState');
  GlobalKey<FormState> districtKey = GlobalKey(debugLabel: '_SomeState');
  GlobalKey<FormState> addressKey = GlobalKey(debugLabel: '_SomeState');
  GlobalKey<FormState> numberYearExpKey = GlobalKey(debugLabel: '_SomeState');

  //Step2
  TextEditingController fullName = TextEditingController();
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
  TextEditingController specialized = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController information = TextEditingController();
  TextEditingController experienceTeaching = TextEditingController();

  //Step3
  TextEditingController informationSubject = TextEditingController();
  TextEditingController formTeach = TextEditingController();
  TextEditingController fee = TextEditingController();
  TextEditingController salaryCD = TextEditingController();
  TextEditingController salaryUL1 = TextEditingController();
  TextEditingController salaryUL2 = TextEditingController();
  TextEditingController areaTeaching = TextEditingController();

  GlobalKey<FormState> salaryCDKey = GlobalKey(debugLabel: '_SomeState');
  GlobalKey<FormState> salaryUL1Key = GlobalKey(debugLabel: '_SomeState');
  GlobalKey<FormState> salaryUL2Key = GlobalKey(debugLabel: '_SomeState');
  GlobalKey<FormState> areaTeachingKey = GlobalKey(debugLabel: '_SomeState');

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
    try {
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
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  @override
  void onInit() {
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
    fullNameKey.currentState.dispose();
    phoneKey.currentState.dispose();
    provincialKey.currentState.dispose();
    districtKey.currentState.dispose();
    numberYearExpKey.currentState.dispose();
    salaryCDKey.currentState.dispose();
    salaryUL1Key.currentState.dispose();
    salaryUL2Key.currentState.dispose();
    areaTeachingKey.currentState.dispose();
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
    } else if (errorTimeExpStart &&
        f.parse(timeExpEnd.text).isBefore(f.parse(timeExpStart.text))) {
      return 'Thời gian bắt đầu sai!';
    }
    return null;
  }

  String checkTimeExpEnd() {
    print('checkTimeExp');
    if (errorTimeExpEnd && timeExpEnd.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorTimeExpEnd &&
        f.parse(timeExpEnd.text).isBefore(f.parse(timeExpStart.text))) {
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
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: valueDate,
        firstDate: DateTime(1970, 8),
        lastDate: DateTime(2101));
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

    idFormTeaching = selectedFormTeaching == 'Gặp mặt' ? 1 : 2;
    errorFormTeaching = false;
    update();
  }

  void onSelectedLuong(String value) {
    selectedFormTeaching = value;

    errorFormTeaching = false;
    update();
  }

  int idTime;

  void onSelectedStatusFee(String value) {
    selectedTime = value;
    listLuong.forEach((key, values) {
      if (values == value) {
        idTime = key;
      }
    });
    errorStatusTime = false;
    update();
  }

  void onSelectedSubject(String value) {
    selectedSubject = value;

    print(idSubject);
    errorSubject = false;
    update();
  }

  void onSelectedKieuGs(String value) {
    print('value:$value');

    listKieuGS.forEach((key, values) {
      if (values == value) {
        idExp = key;
        if (value == '') {
          selectedKieuGS = listKieuGS[0];
        } else {
          selectedKieuGS = listKieuGS[key];
        }
      }
    });
    errorKieuGS = false;
    update();
  }

  void onSelectedMarriage(String value) {
    selectedMarriage = value;

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
    if (!listSubjectSelectTopic
        .map((e) => e.idSubject)
        .contains(value.idSubject)) {
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
    try {
      print(listSubjectSelect.join(','));
      ResultData res = await authenticationRepositories.listDetailSubject(idTopic);
      resultListTopic = resultListTopicFromJson(res.data);
      if (resultListTopic.data != null) {
        listTopic = resultListTopic.data.listSubjectTag;
      } else {}
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> getListDataTopic(String idTopic) async {
    listTopic = [];
    listSubjectSelectTopic.clear();
    print('getListTopic');
    print(listSubjectSelect.join(','));
    try {
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
      } else {}
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
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
        // Utils.showToast(resultListDistrict.data.message);
      } else {
        // Utils.showToast(resultListDistrict.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> getListDistrictArea(int idCity) async {
    listDistrictArea = [];
    try {
      ResultData res = await authenticationRepositories.listDistrict(idCity);
      resultListDistrict = resultListDistrictFromJson(res.data);
      if (resultListDistrict.data != null) {
        listDistrictArea = resultListDistrict.data.listCity;
        // Utils.showToast(resultListDistrict.data.message);
      } else {
        // Utils.showToast(resultListDistrict.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  void checkButtonStep1() {
    errorPhone = true;
    errorImage = true;
    errorDistrict = true;
    errorProvincial = true;
    errorTitleExp = true;
    errorTimeExpStart = true;
    errorTimeExpEnd = true;
    errorInformationExp = true;
    errorExp = selectedKieuGS.isNullOrBlank ? true : false;
    errorMarriage = selectedMarriage.isNullOrBlank ? true : false;
    errorImage = imageAvatar != null || urlAvatar != '' ? false : true;
    errorNumberYearExp = numberYearExp.text.isNotEmpty && int.parse(numberYearExp.text == '' ? '0' : numberYearExp.text) <= 0 ? true : false;
    print('checkNullButton');
    if (timeExpStart.text.isNotEmpty && timeExpEnd.text.isNotEmpty) {
      errorTime = f.parse(timeExpEnd.text).isBefore(f.parse(timeExpStart.text)) ? true : false;
      if (fullNameKey.currentState.validate() &&
          phoneKey.currentState.validate() &&
          phoneKey.currentState.validate() &&
          errorMarriage == false &&
          errorNumberYearExp == false &&
          provincialKey.currentState.validate() &&
          districtKey.currentState.validate() &&
          f.parse(timeExpStart.text).isBefore(f.parse(timeExpEnd.text)) &&
          errorImage == false) {
        Get.to(UpdateInfoTeacherStep2Screen());
      } else {
        fullNameKey.currentState.validate();
        phoneKey.currentState.validate();
        phoneKey.currentState.validate();
        provincialKey.currentState.validate();
        districtKey.currentState.validate();
        Get.dialog(DialogError(
          title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
          onTap: () => Get.back(),
          textButton: 'Ok',
          richText: false,
        ));
      }
    } else {
      if (fullNameKey.currentState.validate() &&
          phoneKey.currentState.validate() &&
          phoneKey.currentState.validate() &&
          errorMarriage == false &&
          errorNumberYearExp == false &&
          provincialKey.currentState.validate() &&
          districtKey.currentState.validate() &&
          errorImage == false) {
        Get.to(UpdateInfoTeacherStep2Screen());
      } else {
        fullNameKey.currentState.validate();
        phoneKey.currentState.validate();
        phoneKey.currentState.validate();
        provincialKey.currentState.validate();
        districtKey.currentState.validate();
        Get.dialog(DialogError(
          title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
          onTap: () => Get.back(),
          textButton: 'Ok',
          richText: false,
        ));
      }
    }

    update();
  }

  bool errorBuoiDay = false;
  bool errorLuong = false;

  void checkButtonStep3() {
    print('checkNullButtonStep3');

    errorArea = true;
    errorProvincial = true;
    errorExp = true;
    errorSubject = listSubjectSelect.isEmpty ? true : false;
    errorKieuGS = selectedKieuGS.isNullOrBlank || selectedKieuGS == listKieuGS.values.first ? true : false;
    errorSubjectTopic = listSubjectSelectTopic.isEmpty ? true : false;
    errorDistrictS3 = listDistrictSelect.isEmpty ? true : false;
    errorClass = selectedClass.isNullOrBlank ? true : false;
    errorFormTeaching = selectedFormTeaching.isNullOrBlank ? true : false;
    final data = listbuoiday.firstWhere((e) => e.sang == '1' || e.chieu == '1' || e.toi == '1', orElse: () => null);
    errorBuoiDay = data == null ? true : false;
    if (valueButtonLuong) {
      if (salaryCDKey.currentState.validate() &&
          listSubjectSelect.isNotEmpty &&
          !selectedClass.isNullOrBlank &&
          (listTopic.isNotEmpty ? listSubjectSelectTopic.isNotEmpty : true) &&
          !selectedFormTeaching.isNullOrBlank &&
          provincial.text.isNotEmpty &&
          listDistrictSelect.isNotEmpty &&
          valueCheckBox &&
          errorKieuGS == false &&
          errorSubject == false &&
          errorDistrictS3 == false &&
          errorClass == false &&
          errorFormTeaching == false &&
          data != null &&
          !selectedTime.isNullOrBlank) {
        updateInfoTeacher();
      } else {
        salaryCDKey.currentState.validate();
        Get.dialog(DialogError(
          title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
          onTap: () => Get.back(),
          textButton: 'Ok',
          richText: false,
        ));
      }
      update();
    } else {
      if (salaryUL1Key.currentState.validate() &&
          salaryUL2Key.currentState.validate() &&
          listSubjectSelect.isNotEmpty &&
          !selectedClass.isNullOrBlank &&
          (listTopic.isNotEmpty ? listSubjectSelectTopic.isNotEmpty : true) &&
          !selectedFormTeaching.isNullOrBlank &&
          provincial.text.isNotEmpty &&
          listDistrictSelect.isNotEmpty &&
          valueCheckBox &&
          errorKieuGS == false &&
          errorSubject == false &&
          errorDistrictS3 == false &&
          errorClass == false &&
          errorFormTeaching == false &&
          data != null &&
          !selectedTime.isNullOrBlank) {
        updateInfoTeacher();
      } else {
        Get.dialog(DialogError(
          title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
          onTap: () => Get.back(),
          textButton: 'Ok',
          richText: false,
        ));
        salaryUL1Key.currentState.validate();

        salaryUL2Key.currentState.validate();
      }
      update();
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
    try {
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
        selectedGender = resultGetInfoTeacher.data.infoTutor.ugsGender == '' ? "Khác" : resultGetInfoTeacher.data.infoTutor.ugsGender;
        dateTime.text = resultGetInfoTeacher.data.infoTutor.ugsBrithday;
        selectedMarriage = resultGetInfoTeacher.data.infoTutor.ugsMarriage;

        selectedTime = resultGetInfoTeacher.data.infoTutor.tutorMonth;
        print('resultGetInfoTeacher.data.infoTutor.tutorMonth${resultGetInfoTeacher.data.infoTutor.tutorMonth}');
        print('selectedTime${selectedTime}');
        onSelectedStatusFee(selectedTime);
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
        specialized.text = resultGetInfoTeacher.data.infoTutor.ugsSpecialized;
        company.text = resultGetInfoTeacher.data.infoTutor.ugsWorkplace;
        information.text = resultGetInfoTeacher.data.infoTutor.ugsAboutUs;
        if (resultGetInfoTeacher.data.infoTutor.nametype != '') {
          selectedKieuGS = resultGetInfoTeacher.data.infoTutor.nametype;
        } else {
          selectedKieuGS = listKieuGS[0];
        }

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
        areaTeaching.text = resultGetInfoTeacher.data.infoTutor.citName;
        listDistrictSelect = resultGetInfoTeacher.data.infoTutor.citDetail;
        errorDistrictArea = listDistrictSelect.isEmpty ? true : false;
        getListDistrictArea(int.parse(resultGetInfoTeacher.data.infoTutor.ugsCity));

        for (int i = 0; i < listDataClass.length; i++) {
          if (resultGetInfoTeacher.data.infoTutor.ctName == listDataClass[i].ctName) {
            idClass = int.parse(listDataClass[i].ctId);
          }
        }
        salaryCD.text = resultGetInfoTeacher.data.infoTutor.tutorSalary.contains('-') ? '' : resultGetInfoTeacher.data.infoTutor.tutorSalary;
        valueButtonLuong = resultGetInfoTeacher.data.infoTutor.tutorSalary.contains('-') ? false : true;
        // resultGetInfoTeacher.data.infoTutor.ugsUnitPrice.isNotEmpty ? valueButtonLuong = true : valueButtonLuong = false;
        selectedStatusFee = resultGetInfoTeacher.data.infoTutor.tutorMonth;
        salaryUL1.text =
            resultGetInfoTeacher.data.infoTutor.tutorSalary.contains('-') ? resultGetInfoTeacher.data.infoTutor.tutorSalary.split('-').first : '';
        salaryUL2.text =
            resultGetInfoTeacher.data.infoTutor.tutorSalary.contains('-') ? resultGetInfoTeacher.data.infoTutor.tutorSalary.split('-').last : '';
        idProvincial = int.parse(resultGetInfoTeacher.data.infoTutor.ugsCityGs);
        idDistrict = int.parse(resultGetInfoTeacher.data.infoTutor.ugsCountyGs);
        listIdSubjectSelect = resultGetInfoTeacher.data.infoTutor.asId.split(',');
        listIdDistrictSelect = resultGetInfoTeacher.data.infoTutor.asDetailId.split(',');

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
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
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
    final test = listbuoiday.map((e) => e.sang).toList() +
        listbuoiday.map((e) => e.chieu).toList() +
        listbuoiday.map((e) => e.toi).toList();
    print(test.join(','));
    Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await userRepositories.updateInfoTeacher(
          token,
          phone.text,
          fullName.text,
          idGender = selectedGender == "Nam"
              ? 1
              : selectedGender == "Nữ"
                  ? 2
                  : 0,
          dateTime.text,
          idMariage = selectedMarriage == 'Chưa kết hôn' ? 0 : 1,
          idExp,
          idClass,
          school.text,
          numberYearExp.text,
          specialized.text,
          idProvincial,
          idDistrict,
          address.text,
          company.text,
          information.text,
          prize.text,
          numberYearExp.text.isNotEmpty ? int.parse(numberYearExp.text) : null,
          titleExp.text,
          timeExpStart.text,
          timeExpEnd.text,
          informationExp.text,
          listSubjectSelect.map((e) => e.asId).join(','),
          listSubjectSelectTopic.map((e) => e.idSubject).join(','),
          idFormTeaching = selectedFormTeaching == 'Gặp mặt' ? 1 : 2,
          salaryCD.text,
          idTime,
          salaryUL1.text,
          salaryUL2.text,
          idValueArea,
          listIdDetailDistrictSelect.join(','),
          resultLichDayToJson(lichday));
      ResultGetInfoTeacher resultGetInfoTeacher = resultGetInfoTeacherFromJson(res.data);
      if (resultGetInfoTeacher.data != null) {
        Get.back();
        Utils.showToast('Cập nhật thông tin thành công!');
        navigationController.pageIndex.value = 0;
        Get
          ..back()
          ..offNamed(Routes.navigation);
        Get.delete();
      } else {
        Get.back();
        Utils.showToast(resultGetInfoTeacher.error.message);
      }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
}
