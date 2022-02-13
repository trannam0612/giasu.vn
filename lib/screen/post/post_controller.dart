import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_create_post.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_district.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_topic.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/post_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_post_created/list_post_created_screen.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:sp_util/sp_util.dart';

class PostController extends GetxController {
  HomeAfterParentController homeAfterParentController = Get.put(HomeAfterParentController());
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  PostRepositories postRepositories = PostRepositories();
  ResultListTopic resultListTopic = ResultListTopic();
  List<ListDistrict> listDistrict = [];
  ResultListDistrict resultListDistrict = ResultListDistrict();
  int idProvincial;
  int idDistrict;
  int idFormTeaching;
  int idExp;

  List<String> listDay = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14'];
  List<String> listTime = ['1', '1.5', '2', '3'];
  List<String> listMarriage = ['Chọn tình trạng', 'Đã kết hôn', 'Cô đơn'];
  List<ListSubjectTag> listTopic = [];
  List<String> listStringTopic = [];
  List<String> listFormTeaching = ['Online', 'Gặp mặt'];
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
  List<String> listGender = ['Nam', 'Nữ', "Không yêu cầu"];
  List<String> listLuong = ['Buổi', 'Tháng'];

  List<buoiday> listbuoiday = [
    buoiday('Thứ 2', '0', "0", "0"),
    buoiday('Thứ 3', "0", "0", "0"),
    buoiday('Thứ 4', "0", "0", "0"),
    buoiday('Thứ 5', "0", "0", "0"),
    buoiday('Thứ 6', "0", "0", "0"),
    buoiday('Thứ 7', "0", "0", "0"),
    buoiday('CN', "0", "0", "0"),
  ];


  String selectedKieuGS;

  String selectedGender;

  String selectedSubject;

  String selectedTopicSubject;

  String selectedInforSubject;

  String selectedClass;

  String selectedTimeTeaching;

  String selectedDayTeaching;


  String selectedFormTeaching;

  String selectedProvincial;
  String selectedDistrict;
  TextEditingController title = TextEditingController();
  TextEditingController numberStudent = TextEditingController();
  TextEditingController contentTitle = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController provincial = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController classDescription = TextEditingController();
  TextEditingController salaryCD = TextEditingController();
  TextEditingController salaryUL1 = TextEditingController();
  TextEditingController salaryUL2 = TextEditingController();

  GlobalKey<FormState> titleKey = GlobalKey();
  GlobalKey<FormState> numberStudentKey = GlobalKey();
  GlobalKey<FormState> contentTitleKey = GlobalKey();
  GlobalKey<FormState> phoneKey = GlobalKey();
  GlobalKey<FormState> addressKey = GlobalKey();
  GlobalKey<FormState> provincialKey = GlobalKey();
  GlobalKey<FormState> districtKey = GlobalKey();
  GlobalKey<FormState> salaryCDKey = GlobalKey();

  GlobalKey<FormState> salaryUL1Key = GlobalKey();
  GlobalKey<FormState> salaryUL2Key = GlobalKey();
  bool errorTitle = false;
  bool errorKieuGS = false;
  bool errorGender = false;
  bool errorSubject = false;
  bool errorTopicSubject = false;
  bool errorClass = false;
  bool errorNumberStudent = false;
  bool errorTimeTeaching = false;
  bool errorDayTeaching = false;
  bool errorMethodTeach = false;
  bool errorFormTeaching = false;
  bool errorContentTitle = false;
  bool errorPhone = false;
  bool errorProvincial = false;
  bool errorDistrict = false;
  bool errorAddress = false;
  bool errorClassDescription = false;
  bool errorbuoiday = false;
  bool errorImage = false;
  int idGender;
  int idMethodTeach;
  int idSubject;
  int idTopicSubject;
  int idClass;
  int idTime;
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
  void onInit() {
    // TODO: implement onInit
    selectedKieuGS = listKieuGS.values.first;

    super.onInit();
  }

  bool valueButtonLuong = false;

  Future<void> getListTopic(String idTopic) async {
    listTopic = [];
    try {
      ResultData res = await authenticationRepositories.listDetailSubject(idTopic);
      resultListTopic = resultListTopicFromJson(res.data);
      if (resultListTopic.data != null) {
        listTopic = resultListTopic.data.listSubjectTag;
        selectedTopicSubject = listTopic[0].nameSubject;
        idTopicSubject = int.parse(listTopic[0].idSubject);
      } else {
        selectedTopicSubject = '';
        idTopicSubject = null;
      }
      print('selectedTopicSubject:${selectedTopicSubject}');
      print('idTopicSubject:${idTopicSubject}');
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
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

  bool errorSalaryCD = false;
  bool errorSalaryUL1 = false;
  bool errorSalaryUL2 = false;
  bool errorStatusFee = false;
  String selectedStatusFee = 'Buổi';
  String valueStatusFee = 'time';

  void onSelectedStatusFee(String value) {
    selectedStatusFee = value;
    valueStatusFee = value == "Giờ" ? 'time' : 'month';
    errorStatusFee = false;
    update();
  }

  String checkSalaryCD() {
    print('checkSalaryCD');
    if (errorSalaryCD && salaryCD.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorSalaryCD && int.parse(salaryCD.text) <= 0) {
      return 'Học phí không hợp lệ!';
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

  void onSelectedGender(String value) {
    selectedGender = value;
    idGender = value == "Nam"
        ? 1
        : value == "Nữ"
            ? 2
            : 3;
    errorGender = false;
    update();
  }

  void onSelectedSubject(String value) {
    selectedSubject = value;
    for (int i = 0; i < listDataSubject.length; i++) {
      if (value == listDataSubject[i].asName) {
        idSubject = int.parse(listDataSubject[i].asId);
      }
    }

    getListTopic(idSubject.toString());
    errorSubject = false;
    update();
  }

  void onSelectedTopicSubject(String value) {
    selectedTopicSubject = value;
    for (int i = 0; i < listTopic.length; i++) {
      if (value == listTopic[i].nameSubject) {
        idTopicSubject = int.parse(listTopic[i].idSubject);
      }
    }
    errorTopicSubject = false;
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

  void onSelectedTimeTeaching(String value) {
    selectedTimeTeaching = value;
    idTime = value == '1'
        ? 1
        : value == '1.5'
            ? 2
            : value == '2'
                ? 3
                : 4;
    errorTimeTeaching = false;
    update();
  }

  void onSelectedDayTeaching(String value) {
    selectedDayTeaching = value;
    errorDayTeaching = false;
    update();
  }

  void onSelectMethodTeach(String value) {
    selectedFormTeaching = value;
    idFormTeaching = selectedFormTeaching == 'Gặp mặt' ? 1 : 2;
    errorMethodTeach = false;
    print(idMethodTeach);
    update();
  }

  void onSelectedKieuGs(String value) {
    listKieuGS.forEach((key, values) {
      if (values == value) {
        idExp = key;
        selectedKieuGS = listKieuGS[key];
      }
    });
    errorKieuGS = false;
    update();
  }

  void checkButton() {
    print('checkButton');
    print('selectedKieuGS:${selectedKieuGS}');
    print('listKieuGS.values.first:${listKieuGS.values.first}');
    if (valueButtonLuong) {
      errorMethodTeach = true;
      errorSalaryCD = true;
      errorSalaryUL1 = true;
      errorSalaryUL2 = true;
      // ignore: deprecated_member_use
      errorKieuGS = selectedKieuGS.isNullOrBlank || selectedKieuGS == listKieuGS.values.first ? true : false;
      errorGender = selectedGender.isNull ? true : false;
      errorSubject = selectedSubject.isNull ? true : false;
      errorTopicSubject = selectedTopicSubject.isNull ? true : false;
      errorClass = selectedSubject.isNull ? true : false;
      errorTimeTeaching = selectedTimeTeaching.isNull ? true : false;
      errorDayTeaching = selectedDayTeaching.isNull ? true : false;
      errorMethodTeach = selectedFormTeaching.isNull ? true : false;
      final data = listbuoiday.firstWhere((e) => e.sang == '1' || e.chieu == '1' || e.toi == '1', orElse: () => null);
      errorbuoiday = data == null ? true : false;
      if (titleKey.currentState.validate() &&
              contentTitleKey.currentState.validate() &&
              errorKieuGS == false &&
              errorGender == false &&
              errorSubject == false &&
              errorClass == false &&
              numberStudentKey.currentState.validate() &&
              errorTimeTeaching == false &&
              errorDayTeaching == false &&
              errorMethodTeach == false &&
              salaryCDKey.currentState.validate() &&
              phoneKey.currentState.validate() &&
              provincialKey.currentState.validate() &&
              districtKey.currentState.validate() &&
              addressKey.currentState.validate() &&
              errorbuoiday == false
          // classDescriptionKey.currentState.validate()&&

          // salaryUL1Key.currentState.validate()&&
          // salaryUL2Key.currentState.validate()&&
          // data != null
          ) {
        print('Đúng');
        createPost();
      } else {
        titleKey.currentState.validate();
        numberStudentKey.currentState.validate();
        contentTitleKey.currentState.validate();
        phoneKey.currentState.validate();
        addressKey.currentState.validate();
        provincialKey.currentState.validate();
        districtKey.currentState.validate();
        salaryCDKey.currentState.validate();
        print('Sai');
        Get.dialog(DialogError(
          title: 'Tất cả các thông tin trên là bắt buộc để đăng tin.',
          onTap: () => Get.back(),
          textButton: 'Ok',
          richText: false,
        ));
      }
    } else {
      errorMethodTeach = true;
      errorSalaryCD = true;
      errorSalaryUL1 = true;
      errorSalaryUL2 = true;
      errorKieuGS = selectedKieuGS.isNullOrBlank || selectedKieuGS == listKieuGS.values.first ? true : false;
      errorGender = selectedGender.isNull ? true : false;
      errorSubject = selectedSubject.isNull ? true : false;
      errorTopicSubject = selectedTopicSubject.isNull ? true : false;
      errorClass = selectedSubject.isNull ? true : false;
      errorTimeTeaching = selectedTimeTeaching.isNull ? true : false;
      errorDayTeaching = selectedDayTeaching.isNull ? true : false;
      errorMethodTeach = selectedFormTeaching.isNull ? true : false;
      final data = listbuoiday.firstWhere((e) => e.sang == '1' || e.chieu == '1' || e.toi == '1', orElse: () => null);
      errorbuoiday = data == null ? true : false;
      if (titleKey.currentState.validate() &&
          contentTitleKey.currentState.validate() &&
          errorKieuGS == false &&
          errorGender == false &&
          errorSubject == false &&
          errorClass == false &&
          numberStudentKey.currentState.validate() &&
          errorTimeTeaching == false &&
          errorDayTeaching == false &&
          errorMethodTeach == false &&
          salaryUL1Key.currentState.validate() &&
          salaryUL2Key.currentState.validate() &&
          phoneKey.currentState.validate() &&
          provincialKey.currentState.validate() &&
          districtKey.currentState.validate() &&
          addressKey.currentState.validate() &&
          errorbuoiday == false) {
        print('Đúng');
        createPost();
      } else {
        titleKey.currentState.validate();
        numberStudentKey.currentState.validate();
        contentTitleKey.currentState.validate();
        phoneKey.currentState.validate();
        addressKey.currentState.validate();
        provincialKey.currentState.validate();
        districtKey.currentState.validate();
        salaryUL1Key.currentState.validate();
        salaryUL2Key.currentState.validate();
        print('Sai');
        Get.dialog(DialogError(
          title: 'Tất cả các thông tin trên là bắt buộc để đăng tin.',
          onTap: () => Get.back(),
          textButton: 'Ok',
          richText: false,
        ));
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

  Future<void> createPost() async {
    final test = listbuoiday.map((e) => e.sang).toList() + listbuoiday.map((e) => e.chieu).toList() + listbuoiday.map((e) => e.toi).toList();
    String token = SpUtil.getString(ConstString.token);
    try {
      ResultData res = await postRepositories.createPost(
          token,
          title.text,
          idFormTeaching,
          // time,l
          idTime,
          int.parse(numberStudent.text),
          int.parse(selectedDayTeaching),
          idGender,
          phone.text,
          address.text,
          valueButtonLuong ? salaryCD.text : '${salaryUL1.text},${salaryUL2.text}',
          valueButtonLuong ? '1' : '2',
          valueStatusFee,
          contentTitle.text,
          idSubject,
          idClass,
          idTopicSubject,
          idProvincial,
          idDistrict,
          idExp,
          test.join(','));
      ResultCreatePost resultCreatePost = resultCreatePostFromJson(res.data);
      if (resultCreatePost.data != null) {
        Get.off(ListPostCreatedScreen(
          back: () {
            homeAfterParentController.homeAfterParent(1, 10);
          },
        ));
        Utils.showToast(resultCreatePost.data.message);
      } else {
        Utils.showToast(resultCreatePost.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
  }
}
