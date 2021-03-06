import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_check_mail.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_district.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_provincial_subject.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_topic.dart';
import 'package:giasu_vn/common/shared/data/models/result_register_teacher.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/authen/login/login_controller.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:giasu_vn/widgets/dialog_pass.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

class RegisterGiaSuController extends GetxController {
  AuthenticationRepositories authenticationRepositories =
      AuthenticationRepositories();
  ResultListDistrict resultListDistrict = ResultListDistrict();
  ResultListTopic resultListTopic = ResultListTopic();
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
    buoiday('Thứ 2', '0', "0", "0"),
    buoiday('Thứ 3', "0", "0", "0"),
    buoiday('Thứ 4', "0", "0", "0"),
    buoiday('Thứ 5', "0", "0", "0"),
    buoiday('Thứ 6', "0", "0", "0"),
    buoiday('Thứ 7', "0", "0", "0"),
    buoiday('CN', "0", "0", "0"),
  ];

  //Step1

  //Step2
  bool errorLuong = false;
  bool errorPhone = false;
  bool errorImage = false;
  bool errorDateTime = false;
  bool errorGender = false;
  bool errorProvincial = false;
  bool errorDistrict = false;
  bool errorDistrictS3 = false;
  bool errorAddress = false;
  bool errorNumberYearExp = false;
  bool errorExp = false;
  bool errorTime = false;
  bool errorMarriage = false;
  int idGender = 0;
  int idProvincial = 0;
  int idExp = 0;

  //Step3
  bool errorClass = false;
  bool errorSubject = false;
  bool errorFormTeaching = false;
  bool errorStatusTime = false;
  bool errorSubjectTopic = false;
  bool errorArea = false;
  bool valueButtonLuong = true;
  int idClass = 0;
  int idLuong = 0;
  int idFormTeaching = 0;
  int idMariage;
  int idDistrict;
  String valueArea;

  int idArea;

  int idSubject;
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
  RxBool valueCheckEmailGS = true.obs;
  String selectedTime = 'Buổi';
  List<ListDistrict> listDistrict = [];
  List<ListSubjectTag> listTopic = [];
  List<DataSubject> listSubjectSelect = [];
  List<ListDistrict> listDistrictSelect = [];
  List<String> listKieuGS = ['Sinh viên', 'Người đi làm', 'Giáo viên'];
  List<String> listMarriage = ['Chưa kết hôn', 'Đã kết hôn'];
  List<String> listSubjectTopic = [
    'Toán cấp 1',
    'Toán Cấp 2',
    'Văn cấp 1',
    'Lý cấp 2',
    'Hóa cấp 2'
  ];
  List<String> listFormTeaching = ['Online', 'Tại nhà'];
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
  List<String> listGender = ['Nam', 'Nữ'];

  // List<String> listLuong = ['Giờ', 'Ngày', 'Tháng'];
  Map<int, String> listLuong = {
    2: 'Buổi',
    3: 'Tháng',
  };

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
  TextEditingController specialized = TextEditingController();
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
  FocusNode focusEmail = FocusNode();
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
    search.addListener(() {
      // checkPassword();
      update();
    });
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
    focusEmail.addListener(() {
      checkEmailGS();
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

  String checkTimeExpEnd() {
    print('checkTimeExp');
    if (errorTimeExpEnd && timeExpEnd.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    // else if (errorTimeExpEnd && f.parse(timeExpEnd.text).isBefore(f.parse(timeExpStart.text))) {
    //   return 'Thời gian kết thúc sai!';
    // }
    return null;
  }

  String checkTimeExpStart() {
    print('checkTimeExp');
    if (errorTimeExpStart && timeExpStart.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    // else if (errorTimeExpStart && f.parse(timeExpEnd.text).isBefore(f.parse(timeExpStart.text))) {
    //   return 'Thời gian bắt đầu sai!';
    // }
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
    if (errorSalaryUL1 &&
        (int.tryParse(salaryUL1.text ?? '0') ?? 0) >
            (int.tryParse(salaryUL2.text ?? '0') ?? 0)) {
      return 'Học phí sai định dạng!';
    }
    return null;
  }

  String checkSalaryUL2() {
    print('checkSalaryUL2');
    if (errorSalaryUL2 && salaryUL2.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    if (errorSalaryUL1 &&
        int.tryParse(salaryUL1.text ?? '0') >
            int.tryParse(salaryUL2.text ?? '0')) {
      return 'Học phí sai định dạng!';
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
    } else if (errorShowPassword && passWord.text.length < 8) {
      return 'Mật khẩu tối thiểu 8 kí tự!';
    } else if (errorShowPassword &&
        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])')
            .hasMatch(passWord.text)) {
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
    } else if (errorEmail && !email.text.contains('@')) {
      return 'Email không hợp lệ!';
    } else if (errorEmail && !email.text.contains('.')) {
      return 'Email không hợp lệ!';
    } else if (!valueCheckEmailGS.value) {
      return 'Email đã tồn tại!';
    } else {
      return null;
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

  imgFromCameraImageInfor() async {
    final cameraImage = await ImagePicker.pickImage(source: ImageSource.camera);
    imageInfor = File(cameraImage.path);
    print(imageInfor);
    update();
  }

  imgFromGalleryImageInfor() async {
    final galleryImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
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
    idGender = value == "Nam" ? 1 : 2;
    errorGender = false;
    update();
  }

  void onSelectedClass(String value) {
    selectedClass = value;
    for (int i = 0; i < listDataClass.length; i++) {
      if (listDataClass[i].ctName == value) {
        idClass = int.parse(listDataClass[i].ctId);
      }
    }

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

  int idTime = 1;

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
    idExp = selectedKieuGS == 'Sinh viên'
        ? 1
        : selectedKieuGS == 'Người đi làm'
            ? 2
            : 3;
    errorKieuGS = false;
    update();
  }

  Future<void> getListTopic(String idTopic) async {
    listTopic = [];
    print('getListTopic');
    try {
      print(listSubjectSelect.join(','));
      ResultData res =
          await authenticationRepositories.listDetailSubject(idTopic);
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

  void onSelectedMarriage(String value) {
    selectedMarriage = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachKieuGiaSu.length; i++) {
    //   if (loginController.resultListData.data.danhSachKieuGiaSu[i].nameType == value) {
    //     idExp = loginController.resultListData.data.danhSachKieuGiaSu[i].typeId;
    //   }
    // }
    idMariage = selectedMarriage == value ? 0 : 1;
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
    }
    // else if (errorPhone && phone.text.length != 10) {
    //   return 'Số điện thoại không hợp lệ!';
    // }
    else if (errorPhone && !regExp.hasMatch(phone.text)) {
      return 'Số điện thoại sai định dạng!';
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

  void onSelectQH(ListDistrict value) {
    print('onSelectQH');
    if (listDistrictSelect.map((e) => e).contains(value)) {
      listDistrictSelect.remove(value);
    } else {
      listDistrictSelect.add(value);
    }
    errorDistrict = false;
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

//Step3

  void checkButtonStep1() {
    print('checkButton');
    checkEmailGS();
    errorEmail = true;
    errorShowPassword = true;
    errorShowRePassword = true;
    if (passWord.text.length >= 8 &&
        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])')
            .hasMatch(passWord.text)) {
      Get.dialog(DialogErrorPass());
    } else {
      if (valueCheckEmailGS.value &&
          email.text.contains('@') &&
          email.text.contains('.') &&
          passWord.text.length >= 8 &&
          RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])')
              .hasMatch(passWord.text) &&
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
  }

  void checkButtonStep2() {
    String pattern =
        r'^((09[0-9])|(03[0-9])|(07[0-9])|(08[0-9])|(05[0-9]))\d{7}$';
    RegExp regExp = new RegExp(pattern);
    errorFullName = true;
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
    errorImage = imageAvatar.isNullOrBlank ? true : false;

    print('checkNullButton');
    if (timeExpStart.text.isNotEmpty && timeExpEnd.text.isNotEmpty) {
      errorTime = f.parse(timeExpEnd.text).isBefore(f.parse(timeExpStart.text))
          ? true
          : false;
      if (fullName.text.isNotEmpty &&
          phone.text.isNotEmpty &&
          regExp.hasMatch(phone.text) &&
          errorMarriage == false &&
          provincial.text.isNotEmpty &&
          district.text.isNotEmpty &&
          f.parse(timeExpStart.text).isBefore(f.parse(timeExpEnd.text)) &&
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
    } else {
      if (fullName.text.isNotEmpty &&
          phone.text.isNotEmpty &&
          regExp.hasMatch(phone.text) &&
          errorMarriage == false &&
          provincial.text.isNotEmpty &&
          district.text.isNotEmpty &&
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
    }

    update();
  }

  bool errorBuoiDay = false;
  String stringErrorLuong;

  void checkButtonStep3() {
    print('checkNullButtonStep3');
    print(valueButtonLuong);
    errorSalaryCD = true;
    errorSalaryUL1 = true;
    errorSalaryUL2 = true;
    errorArea = true;
    errorProvincial = true;
    errorExp = true;
    errorSubject = listSubjectSelect.isEmpty ? true : false;
    errorSubjectTopic = listSubjectSelectTopic.isEmpty ? true : false;
    errorDistrictS3 = listDistrictSelect.isEmpty ? true : false;
    errorClass = selectedClass.isNullOrBlank ? true : false;
    errorFormTeaching = selectedFormTeaching.isNullOrBlank ? true : false;
    final data = listbuoiday.firstWhere(
        (e) => e.sang == '1' || e.chieu == '1' || e.toi == '1',
        orElse: () => null);
    errorBuoiDay = data == null ? true : false;

    if (valueButtonLuong) {
      print('TH1');
      if (salaryCD.text.isNotEmpty &&
          listSubjectSelect.isNotEmpty &&
          !selectedClass.isNullOrBlank &&
          (listTopic.isNotEmpty ? listSubjectSelectTopic.isNotEmpty : true) &&
          !selectedFormTeaching.isNullOrBlank &&
          provincial.text.isNotEmpty &&
          listDistrictSelect.isNotEmpty &&
          // ignore: deprecated_member_use
          valueCheckBox &&
          salaryCD.text.isNotEmpty &&
          data != null &&
          !selectedTime.isNullOrBlank &&
          int.tryParse(salaryCD.text) > 0) {
        registerTeacher();
      } else {
        errorLuong = int.parse(salaryCD.text) <= 0 ? true : false;
        stringErrorLuong = 'Học phí phải lớn hơn 0';
        Get.dialog(DialogError(
          title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
          onTap: () => Get.back(),
          textButton: 'Ok',
          richText: false,
        ));
        update();
      }
    } else {
      print('TH2');
      errorLuong =
          int.parse(salaryUL1.text ?? "0") >= int.parse(salaryUL2.text ?? "0")
              ? true
              : false;
      if (salaryUL1.text.isNotEmpty &&
          salaryUL2.text.isNotEmpty &&
          listSubjectSelect.isNotEmpty &&
          !selectedClass.isNullOrBlank &&
          (listTopic.isNotEmpty ? listSubjectSelectTopic.isNotEmpty : true) &&
          !selectedFormTeaching.isNullOrBlank &&
          provincial.text.isNotEmpty &&
          listDistrictSelect.isNotEmpty &&
          valueCheckBox &&
          data != null &&
          int.parse(salaryUL1.text) < int.parse(salaryUL2.text) &&
          !selectedTime.isNullOrBlank &&
          int.tryParse(salaryUL1.text) > 0 &&
          int.tryParse(salaryUL2.text) > 0) {
        registerTeacher();
      } else {
        if (int.parse(salaryUL1.text) >= int.parse(salaryUL2.text)) {
          errorLuong = true;
          stringErrorLuong = 'Học phí bắt đầu phải nhỏ hơn học phí kết thúc!';
        } else {
          errorLuong = false;
        }
        if (int.parse(salaryUL1.text) < 1 || int.parse(salaryUL2.text) < 1) {
          stringErrorLuong = 'Học phí phải lớn hơn 0';
          errorLuong = true;
        } else {
          errorLuong = false;
        }

        Get.dialog(DialogError(
          title: 'Tất cả các thông tin trên là bắt buộc để đăng ký.',
          onTap: () => Get.back(),
          textButton: 'Ok',
          richText: false,
        ));
        update();
      }
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

  String checkDistrict() {
    print('checkProvincial');
    if (errorDistrict && district.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  Future<void> registerTeacher() async {
    Get.dialog(DialogLoading());
    final test = listbuoiday.map((e) => e.sang).toList() +
        listbuoiday.map((e) => e.chieu).toList() +
        listbuoiday.map((e) => e.toi).toList();
    try {
      ResultData res = await authenticationRepositories.registerTeacher(
          phone.text,
          email.text,
          passWord.text,
          rePassWord.text,
          avatar,
          fullName.text,
          idGender,
          dateTime.text,
          idMariage,
          // tutorStyle,
          idExp,
          // classTeach,
          idClass,
          school.text,
          // graduationYear, năm tốt nghiệp
          graduationYear.text,
          // specialized, Chuyên ngành
          specialized.text,
          idProvincial,
          idDistrict,
          address.text,
          company.text,
          information.text,
          prize.text,
          int.parse(numberYearExp.text = '0'),
          titleExp.text,
          timeExpStart.text,
          timeExpEnd.text,
          informationExp.text,
          // asId, id môn học
          listSubjectSelect.map((e) => e.asId).join(','),
          listSubjectSelectTopic.map((e) => e.idSubject).join(','),
          idFormTeaching,
          salaryCD.text,
          idTime,
          salaryUL1.text,
          salaryUL2.text,
          idArea,
          listDistrictSelect.map((e) => e.idCity).join(','),
          test.join(','));
      ResultRegisterTeacher resultRegisterTeacher =
          resultRegisterTeacherFromJson(res.data);
      if (resultRegisterTeacher.data != null) {
        Get.back();
        Utils.showToast(resultRegisterTeacher.data.message);
        SpUtil.putString(ConstString.token_register,
            resultRegisterTeacher.data.dataUser.token);
        SpUtil.putString(
            ConstString.EMAIL, resultRegisterTeacher.data.dataUser.email);
        Get.find<LoginController>().email.text =
            SpUtil.getString(ConstString.EMAIL);
        Get.toNamed(Routes.verify_register);
      } else {
        Get.back();

        Utils.showToast(resultRegisterTeacher.error.message);
      }
    } catch (e) {
      Get.back();

      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> checkEmailGS() async {
    print('getDataQH');
    try {
      if (email.text.isNotEmpty) {
        ResultData res =
            await authenticationRepositories.checkMailGS(email.text);
        ResultCheckMail resultCheckMail = resultCheckMailFromJson(res.data);
        if (resultCheckMail.data != null) {
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

//   ResultRegisterTeacher resultRegisterTeacher = ResultRegisterTeacher();
}
