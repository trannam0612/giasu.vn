import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_create_post.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_post.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_district.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_topic.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/post_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_post_created/list_post_created_screen.dart';
import 'package:giasu_vn/screen/post/update_post/updatr_post_screen.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:sp_util/sp_util.dart';

class UpdatePostController extends GetxController {
  AuthenticationRepositories authenticationRepositories =
      AuthenticationRepositories();
  HomeRepositories homeRepositories = HomeRepositories();
  HomeAfterParentController homeAfterParentController = Get.put(HomeAfterParentController());
  PostRepositories postRepositories = PostRepositories();
  ResultListTopic resultListTopic = ResultListTopic();
  List<ListDistrict> listDistrict = [];
  ResultListDistrict resultListDistrict = ResultListDistrict();
  int idProvincial;
  int idDistrict;
  int idFormTeaching;
  int idKieuGs;
  List<String> listDay = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14'];
  List<String> listTime = ['1h', '1.5h', '2h', '3h'];
  List<String> listMarriage = ['Chọn tình trạng', 'Đã kết hôn', 'Cô đơn'];
  List<ListSubjectTag> listTopic = [];
  List<String> listStringTopic = [];
  List<String> listFormTeaching = ['Gặp mặt', 'Online'];

  List<String> listGender = ['Nam', 'Nữ', 'Không yêu cầu'];
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

  int classId;

  String selectedKieuGS;

  String selectedGender;

  String selectedSubject;

  String selectedTopicSubject;

  String selectedInforSubject;

  String selectedClass;

  String selectedTimeTeaching;

  String selectedDayTeaching;

  String selectMethodTeach;


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

  @override
  void onInit() {
    // TODO: implement onInit
    title.addListener(() {
      update();
    });
    numberStudent.addListener(() {
      update();
    });
    contentTitle.addListener(() {
      update();
    });
    phone.addListener(() {
      update();
    });
    address.addListener(() {
      update();
    });
    provincial.addListener(() {
      update();
    });
    district.addListener(() {
      update();
    });
    classDescription.addListener(() {
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
    // getDataQH(idProvincial);
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

  bool valueButtonLuong = false;

  Future<void> getListTopic(String idTopic) async {
    // listTopic = [];
    try {
      ResultData res =
          await authenticationRepositories.listDetailSubject(idTopic);
      resultListTopic = resultListTopicFromJson(res.data);
      if (resultListTopic.data != null) {
        listTopic = [];
        listTopic = resultListTopic.data.listSubjectTag;
        selectedTopicSubject = listTopic[0].nameSubject;
        idTopicSubject = int.parse(listTopic[0].idSubject);
      } else {
        listTopic = [];
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

  Future<void> getListTopicUpdate(String idTopic) async {
    listTopic = [];
    try {
      ResultData res =
          await authenticationRepositories.listDetailSubject(idTopic);
      resultListTopic = resultListTopicFromJson(res.data);
      if (resultListTopic.data != null) {
        listTopic = [];
        listTopic = resultListTopic.data.listSubjectTag;
      } else {}
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
    valueStatusFee = value == "Buổi" ? 'time' : 'month';
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
    idTime = value == '1h'
        ? 1
        : value == '1.5h'
            ? 2
            : value == '2h'
                ? 3
                : 4;
    errorTimeTeaching = false;
    print(value);
    print(idTime);
    update();
  }

  void onSelectedDayTeaching(String value) {
    selectedDayTeaching = value;
    errorDayTeaching = false;
    update();
  }

  void onSelectMethodTeach(String value) {
    selectMethodTeach = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachHinhThucGiangDay.length; i++) {
    //   if (value == loginController.resultListData.data.danhSachHinhThucGiangDay[i].methodName) {
    //     idMethodTeach = loginController.resultListData.data.danhSachHinhThucGiangDay[i].methodId;
    //   }
    // }
    idFormTeaching = value == 'Online' ? 2 : 1;
    errorMethodTeach = false;
    print(idFormTeaching);
    print(selectMethodTeach);
    print(value);
    update();
  }

  void onSelectedKieuGs(String value) {
    listKieuGS.forEach((key, values) {
      if (values == value) {
        idKieuGs = key;
        selectedKieuGS = listKieuGS[key];
      }
    });
    print('value:$value');
    print('idKieuGs:$idKieuGs');
    print('selectedKieuGS:$selectedKieuGS');
    errorKieuGS = false;
    update();
  }

  void checkButton() {
    print('checkButton');
    if (valueButtonLuong) {
      errorMethodTeach = true;
      errorSalaryCD = true;
      errorSalaryUL1 = true;
      errorSalaryUL2 = true;
      // ignore: deprecated_member_use
      errorKieuGS = selectedKieuGS.isNull ? true : false;
      errorGender = selectedGender.isNull ? true : false;
      errorSubject = selectedSubject.isNull ? true : false;
      errorTopicSubject = selectedTopicSubject.isNull ? true : false;
      errorClass = selectedSubject.isNull ? true : false;
      errorTimeTeaching = selectedTimeTeaching.isNull ? true : false;
      errorDayTeaching = selectedDayTeaching.isNull ? true : false;
      errorMethodTeach = selectMethodTeach.isNull ? true : false;
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
          errorbuoiday == false) {
        print('Đúng');
        updatePost(idPost);
      } else {
        titleKey.currentState.validate();
        numberStudentKey.currentState.validate();
        contentTitleKey.currentState.validate();
        phoneKey.currentState.validate();
        addressKey.currentState.validate();
        provincialKey.currentState.validate();
        districtKey.currentState.validate();
        salaryCDKey.currentState.validate();
        // classDescriptionKey.currentState.validate();
        // salaryCDKey.currentState.validate();
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
      // ignore: deprecated_member_use
      errorKieuGS = selectedKieuGS.isNull ? true : false;
      errorGender = selectedGender.isNull ? true : false;
      errorSubject = selectedSubject.isNull ? true : false;
      errorTopicSubject = selectedTopicSubject.isNull ? true : false;
      errorClass = selectedSubject.isNull ? true : false;
      errorTimeTeaching = selectedTimeTeaching.isNull ? true : false;
      errorDayTeaching = selectedDayTeaching.isNull ? true : false;
      errorMethodTeach = selectMethodTeach.isNull ? true : false;
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
        updatePost(idPost);
      } else {
        titleKey.currentState.validate();
        numberStudentKey.currentState.validate();
        contentTitleKey.currentState.validate();
        phoneKey.currentState.validate();
        addressKey.currentState.validate();
        provincialKey.currentState.validate();
        districtKey.currentState.validate();
        // classDescriptionKey.currentState.validate();
        // salaryCDKey.currentState.validate();
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
        Utils.showToast(resultListDistrict.data.message);
      } else {
        // Utils.showToast(resultListDistrict.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> updatePost(int id) async {
    print('updatePost');
    setDataLichDay();
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await postRepositories.updatePost(
          token,
          id,
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
          idKieuGs,
          lichdayToJson(lichDay));
      ResultCreatePost resultCreatePost = resultCreatePostFromJson(res.data);
      if (resultCreatePost.data != null) {
        Utils.showToast(resultCreatePost.data.message);
        print(111111);
        Get.off(ListPostCreatedScreen(
          back: () {
            homeAfterParentController.homeAfterParent(1, 10);
          },
        ));
      } else {
        Utils.showToast(resultCreatePost.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  void setDataLichDay() {
    resultGetInfoPost.data.data.lichday.st2 = listbuoiday[0].sang;
    resultGetInfoPost.data.data.lichday.ct2 = listbuoiday[0].chieu;
    resultGetInfoPost.data.data.lichday.tt2 = listbuoiday[0].toi;
    resultGetInfoPost.data.data.lichday.st3 = listbuoiday[1].sang;
    resultGetInfoPost.data.data.lichday.ct3 = listbuoiday[1].chieu;
    resultGetInfoPost.data.data.lichday.tt3 = listbuoiday[1].toi;
    resultGetInfoPost.data.data.lichday.st4 = listbuoiday[2].sang;
    resultGetInfoPost.data.data.lichday.ct4 = listbuoiday[2].chieu;
    resultGetInfoPost.data.data.lichday.tt4 = listbuoiday[2].toi;
    resultGetInfoPost.data.data.lichday.st5 = listbuoiday[3].sang;
    resultGetInfoPost.data.data.lichday.ct5 = listbuoiday[3].chieu;
    resultGetInfoPost.data.data.lichday.tt5 = listbuoiday[3].toi;
    resultGetInfoPost.data.data.lichday.st6 = listbuoiday[4].sang;
    resultGetInfoPost.data.data.lichday.ct6 = listbuoiday[4].chieu;
    resultGetInfoPost.data.data.lichday.tt6 = listbuoiday[4].toi;
    resultGetInfoPost.data.data.lichday.st7 = listbuoiday[5].sang;
    resultGetInfoPost.data.data.lichday.ct7 = listbuoiday[5].chieu;
    resultGetInfoPost.data.data.lichday.tt7 = listbuoiday[5].toi;
    resultGetInfoPost.data.data.lichday.scn = listbuoiday[6].sang;
    resultGetInfoPost.data.data.lichday.ccn = listbuoiday[6].chieu;
    resultGetInfoPost.data.data.lichday.tcn = listbuoiday[6].toi;
    update();
  }

  ResultGetInfoPost resultGetInfoPost = ResultGetInfoPost();
  int idPost;
  LichDay lichDay = LichDay();

  Future<void> getDetailClass(int idInfoClass) async {
    Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.detailClass(token, idInfoClass);
      resultGetInfoPost = resultGetInfoPostFromJson(res.data);
      if (resultGetInfoPost.data != null) {
        Get.back();
        getListTopicUpdate(resultGetInfoPost.data.data.dataInfo.asId);
        print(resultGetInfoPost.data.data.dataInfo.ctId);

        idPost = int.parse(resultGetInfoPost.data.data.dataInfo.pftId);
        title.text = resultGetInfoPost.data.data.dataInfo.pftSummary;
        contentTitle.text = resultGetInfoPost.data.data.dataInfo.pftDetail;
        selectedKieuGS = resultGetInfoPost.data.data.dataInfo.nametype;
        selectedGender = resultGetInfoPost.data.data.dataInfo.pftGender == '' ? 'Khác' : resultGetInfoPost.data.data.dataInfo.pftGender;
        selectedSubject = resultGetInfoPost.data.data.dataInfo.asName;
        selectedTopicSubject = resultGetInfoPost.data.data.dataInfo.asDetailName;
        selectedClass = resultGetInfoPost.data.data.dataInfo.ctName;
        numberStudent.text = resultGetInfoPost.data.data.dataInfo.pftNbStudent;
        selectedTimeTeaching = resultGetInfoPost.data.data.dataInfo.pftTime == '1'
            ? '1h'
            : resultGetInfoPost.data.data.dataInfo.pftTime == '2'
                ? '1.5h'
                : resultGetInfoPost.data.data.dataInfo.pftTime == '3'
                    ? '2h'
                    : '3h';
        selectedDayTeaching = resultGetInfoPost.data.data.dataInfo.pftNbLesson;
        selectMethodTeach = resultGetInfoPost.data.data.dataInfo.pftForm;
        if (resultGetInfoPost.data.data.dataInfo.pftPrice.contains('-')) {
          valueButtonLuong = false;
          salaryUL1.text = resultGetInfoPost.data.data.dataInfo.pftPrice.split('-').first.replaceAll(' ', '').replaceAll(',', '');
          salaryUL2.text = resultGetInfoPost.data.data.dataInfo.pftPrice.split('-').last.replaceAll(' ', '').replaceAll(',', '');
        } else {
          salaryCD.text = resultGetInfoPost.data.data.dataInfo.pftPrice.replaceAll(' ', '').replaceAll(',', '');
          valueButtonLuong = true;
        }

        selectedStatusFee = resultGetInfoPost.data.data.dataInfo.pftMonth;
        phone.text = resultGetInfoPost.data.data.dataInfo.pftPhone;
        provincial.text = resultGetInfoPost.data.data.dataInfo.cityName;
        district.text = resultGetInfoPost.data.data.dataInfo.ctyDetailName;
        address.text = resultGetInfoPost.data.data.dataInfo.pftAddress;
        listbuoiday[0].sang = resultGetInfoPost.data.data.lichday.st2;
        listbuoiday[0].chieu = resultGetInfoPost.data.data.lichday.ct2;
        listbuoiday[0].toi = resultGetInfoPost.data.data.lichday.tt2;
        listbuoiday[1].sang = resultGetInfoPost.data.data.lichday.st3;
        listbuoiday[1].chieu = resultGetInfoPost.data.data.lichday.ct3;
        listbuoiday[1].toi = resultGetInfoPost.data.data.lichday.tt3;
        listbuoiday[2].sang = resultGetInfoPost.data.data.lichday.st4;
        listbuoiday[2].chieu = resultGetInfoPost.data.data.lichday.ct4;
        listbuoiday[2].toi = resultGetInfoPost.data.data.lichday.tt4;
        listbuoiday[3].sang = resultGetInfoPost.data.data.lichday.st5;
        listbuoiday[3].chieu = resultGetInfoPost.data.data.lichday.ct5;
        listbuoiday[3].toi = resultGetInfoPost.data.data.lichday.tt5;
        listbuoiday[4].sang = resultGetInfoPost.data.data.lichday.st6;
        listbuoiday[4].chieu = resultGetInfoPost.data.data.lichday.ct6;
        listbuoiday[4].toi = resultGetInfoPost.data.data.lichday.tt6;
        listbuoiday[5].sang = resultGetInfoPost.data.data.lichday.st7;
        listbuoiday[5].chieu = resultGetInfoPost.data.data.lichday.ct7;
        listbuoiday[5].toi = resultGetInfoPost.data.data.lichday.tt7;
        listbuoiday[6].sang = resultGetInfoPost.data.data.lichday.scn;
        listbuoiday[6].chieu = resultGetInfoPost.data.data.lichday.ccn;
        listbuoiday[6].toi = resultGetInfoPost.data.data.lichday.tcn;
        lichDay = resultGetInfoPost.data.data.lichday;
        idFormTeaching =
            resultGetInfoPost.data.data.dataInfo.pftForm == "Gặp mặt" ? 1 : 2;
        idTime = resultGetInfoPost.data.data.dataInfo.pftTime == '1,5'
            ? 1
            : resultGetInfoPost.data.data.dataInfo.pftTime == '2'
                ? 2
                : resultGetInfoPost.data.data.dataInfo.pftTime == '2,5'
                    ? 3
                    : 4;
        idGender = resultGetInfoPost.data.data.dataInfo.pftGender == "Nam" ? 1 : 2;
        idSubject = int.parse(resultGetInfoPost.data.data.dataInfo.asId);
        idClass = int.parse(resultGetInfoPost.data.data.dataInfo.ctId);
        idTopicSubject = int.parse(resultGetInfoPost.data.data.dataInfo.asDetail);
        idProvincial = int.parse(resultGetInfoPost.data.data.dataInfo.cityId);
        idDistrict = int.parse(resultGetInfoPost.data.data.dataInfo.cityDetail);
        onSelectedKieuGs(resultGetInfoPost.data.data.dataInfo.nametype);
        // idKieuGs = resultGetInfoPost.data.data.dataInfo.nametype == 'Sinh viên'
        //     ? 1
        //     : resultGetInfoPost.data.data.dataInfo.nametype == 'Người đi làm'
        //         ? 2
        //         : 3;

        await Get.to(UpdatePostScreen());
      } else {
        Get.back();
      }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }

    update();
  }
}
