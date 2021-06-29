import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_create_post.dart';
import 'package:giasu_vn/common/shared/data/models/result_detail_class.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_post.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_district.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_topic.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/post_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_post_created/list_post_created_screen.dart';
import 'package:giasu_vn/screen/navigation/navigation_screen.dart';
import 'package:giasu_vn/screen/post/update_post/updatr_post_screen.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

class UpdatePostController extends GetxController {
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  HomeRepositories homeRepositories = HomeRepositories();
  HomeAfterParentController homeAfterParentController = Get.put(HomeAfterParentController());
  PostRepositories postRepositories = PostRepositories();
  ResultListTopic resultListTopic = ResultListTopic();
  List<ListDistrict> listDistrict = [];
  ResultListDistrict resultListDistrict = ResultListDistrict();
  int idProvincial;
  int idDistrict;
  int idFormTeaching;
  int idExp;
  List<String> listDay = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14'];
  List<String> listTime = ['1,5', '2', '2,5', '3'];
  List<String> listKieuGS = ['Sinh viên', 'Người đi làm', 'Giáo viên'];
  List<String> listMarriage = ['Chọn tình trạng', 'Đã kết hôn', 'Cô đơn'];
  List<ListSubjectTag> listTopic = [];
  List<String> listStringTopic = [];
  List<String> listFormTeaching = ['Gặp mặt', 'Online'];
  List<String> listSubject = ['Chọn hình thức dạy', 'Online', 'Tại nhà'];
  List<String> listQH = ['Quận Hai Bà Trưng', 'Quận Hoàng Mai', 'Quận Hoàn Kiếm', 'Huyện Mỹ Hào', 'Quận Thanh Xuân', 'Quận Nam Từ Niêm', 'Quận Tây Hồ'];
  List<String> listFee = ['Chọn hình thức học phí', 'Cố định', 'Ước Lượng'];
  List<String> listGender = ['Nam', 'Nữ'];
  List<String> listLuong = ['Giờ', 'Tháng'];

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
    listTopic = [];
    ResultData res = await authenticationRepositories.listDetailSubject(idTopic);
    resultListTopic = resultListTopicFromJson(res.data);
    if (resultListTopic.data != null) {
      listTopic = resultListTopic.data.listSubjectTag;
      selectedTopicSubject = listTopic[0].nameSubject;
      idTopicSubject = int.parse(listTopic[0].idSubject);
      Utils.showToast(resultListTopic.data.message);
    } else {
      Utils.showToast(resultListTopic.error.message);
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
  String selectedStatusFee = 'Giờ';
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
    idGender = value == "Nam" ? 1 : 2;
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
    idTime = value == '1,5'
        ? 1
        : value == '2'
            ? 2
            : value == '2,5'
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
    selectMethodTeach = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachHinhThucGiangDay.length; i++) {
    //   if (value == loginController.resultListData.data.danhSachHinhThucGiangDay[i].methodName) {
    //     idMethodTeach = loginController.resultListData.data.danhSachHinhThucGiangDay[i].methodId;
    //   }
    // }
    idFormTeaching = selectedFormTeaching == 'Gặp mặt' ? 1 : 2;
    errorMethodTeach = false;
    print(idMethodTeach);
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

  String checkTitle() {
    if (errorTitle && title.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkContentTitle() {
    if (errorContentTitle && contentTitle.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkPhone() {
    print('checkPassword');
    String pattern = r'^((09[0-9])|(03[0-9])|(07[0-9])|(08[0-9])|(05[0-9]))\d{7}$';
    RegExp regExp = new RegExp(pattern);
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

  String checkNumberStudent() {
    if (errorNumberStudent && numberStudent.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorNumberStudent && numberStudent.text == '0') {
      return 'Số học sinh không hợp lệ!';
    }
    return null;
  }

  String checkProvincial() {
    if (errorProvincial && provincial.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkAddress() {
    if (errorAddress && address.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String checkDistrict() {
    if (errorDistrict && provincial.text.isEmpty) {
      return 'Tỉnh thành chưa xác định!';
    } else if (errorDistrict && district.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    update();
    return null;
  }

  String checkClassDescription() {
    if (errorClassDescription && classDescription.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    update();
    return null;
  }

  void checkButton() {
    print('checkButton');
    String pattern = r'^((09[0-9])|(03[0-9])|(07[0-9])|(08[0-9])|(05[0-9]))\d{7}$';
    RegExp regExp = new RegExp(pattern);
    errorTitle = true;
    errorNumberStudent = true;
    errorContentTitle = true;
    errorPhone = true;
    errorProvincial = true;
    errorDistrict = true;
    errorAddress = true;
    errorClassDescription = true;
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
    if (contentTitle.text.isNotEmpty &&
        title.text.isNotEmpty &&
        errorKieuGS == false &&
        regExp.hasMatch(phone.text) &&
        errorGender == false &&
        errorSubject == false &&
        // errorTopicSubject == false &&
        errorClass == false &&
        numberStudent.text.isNotEmpty &&
        numberStudent.text != '0' &&
        salaryCD.text.isNotEmpty &&
        salaryCD.text != '0' &&
        errorTimeTeaching == false &&
        errorDayTeaching == false &&
        errorMethodTeach == false &&
        provincial.text.isNotEmpty &&
        district.text.isNotEmpty &&
        address.text.isNotEmpty &&
        data != null) {
      updatePost(idPost);
    } else {
      Get.dialog(DialogError(
        title: 'Tất cả các thông tin trên là bắt buộc để đăng tin.',
        onTap: () => Get.back(),
        textButton: 'Ok',
        richText: false,
      ));
    }
    update();
  }

  Future<void> getListDistrict(int idCity) async {
    listDistrict = [];
    ResultData res = await authenticationRepositories.listDistrict(idCity);
    resultListDistrict = resultListDistrictFromJson(res.data);
    if (resultListDistrict.data != null) {
      listDistrict = resultListDistrict.data.listCity;
      Utils.showToast(resultListDistrict.data.message);
    } else {
      Utils.showToast(resultListDistrict.error.message);
    }
    update();
  }

  Future<void> updatePost(int id) async {
    print('updatePost');
    setDataLichDay();
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
        salaryCD.text,
        valueStatusFee,
        contentTitle.text,
        idSubject,
        idClass,
        idTopicSubject,
        idProvincial,
        idDistrict,
        idExp,
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
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.detailClass(token, idInfoClass);
    resultGetInfoPost = resultGetInfoPostFromJson(res.data);
    if (resultGetInfoPost.data != null) {
      Get.back();
      getListTopic(resultGetInfoPost.data.data.dataInfo.asId);
      print('resultGetInfoPost.data.data.dataInfo.ctId');
      print(resultGetInfoPost.data.data.dataInfo.ctId);

      idPost = int.parse(resultGetInfoPost.data.data.dataInfo.pftId);
      title.text = resultGetInfoPost.data.data.dataInfo.pftSummary;
      contentTitle.text = resultGetInfoPost.data.data.dataInfo.pftDetail;
      selectedKieuGS = resultGetInfoPost.data.data.dataInfo.nametype;
      selectedGender = resultGetInfoPost.data.data.dataInfo.pftGender;
      selectedSubject = resultGetInfoPost.data.data.dataInfo.asName;
      selectedTopicSubject = resultGetInfoPost.data.data.dataInfo.asDetailName;
      selectedClass = resultGetInfoPost.data.data.dataInfo.ctName;
      numberStudent.text = resultGetInfoPost.data.data.dataInfo.pftNbStudent;
      selectedTimeTeaching = resultGetInfoPost.data.data.dataInfo.pftTime == '1'
          ? '1,5'
          : resultGetInfoPost.data.data.dataInfo.pftTime == '2'
              ? '2'
              : resultGetInfoPost.data.data.dataInfo.pftTime == '3'
                  ? '2,5'
                  : '3';
      selectedDayTeaching = resultGetInfoPost.data.data.dataInfo.pftNbLesson;
      selectMethodTeach = resultGetInfoPost.data.data.dataInfo.pftForm;
      salaryCD.text = resultGetInfoPost.data.data.dataInfo.pftPrice;
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
      idFormTeaching = resultGetInfoPost.data.data.dataInfo.pftForm == "Gặp mặt" ? 1 : 2;
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
      idExp = resultGetInfoPost.data.data.dataInfo.nametype == 'Sinh viên'
          ? 1
          : resultGetInfoPost.data.data.dataInfo.nametype == 'Người đi làm'
              ? 2
              : 3;

      await Get.to(UpdatePostScreen());
    } else {
      Get.back();
    }
    update();
  }
}
