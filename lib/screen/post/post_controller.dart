import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

class PostController extends GetxController {
  int idProvincial;
  int idDistrict;
  int idFormTeaching;

  List<String> listDay = ['1', '2', '3', '4', '5', '6', '7'];
  List<String> listTime = ['1,5', '2', '2,5', '3'];
  List<String> listKieuGS = ['Chọn hình thức dạy', 'Online', 'Tại nhà'];
  List<String> listMarriage = ['Chọn tình trạng', 'Đã kết hôn', 'Cô đơn'];
  List<String> listSubjectTopic = ['Toán cấp 1', 'Toán Cấp 2', 'Văn cấp 1', 'Lý cấp 2', 'Hóa cấp 2'];
  List<String> listFormTeaching = ['Chọn hình thức dạy', 'Online', 'Tại nhà'];
  List<String> listClass = ['Lớp 1', 'Lớp 2', 'Lớp 3'];
  List<String> listSubject = ['Chọn hình thức dạy', 'Online', 'Tại nhà'];
  List<String> listQH = ['Quận Hai Bà Trưng', 'Quận Hoàng Mai', 'Quận Hoàn Kiếm', 'Huyện Mỹ Hào', 'Quận Thanh Xuân', 'Quận Nam Từ Niêm', 'Quận Tây Hồ'];
  List<String> listFee = ['Chọn hình thức học phí', 'Cố định', 'Ước Lượng'];
  List<String> listGender = ['Nam', 'Nữ', 'Khác'];
  List<String> listLuong = ['Giờ', 'Ngày', 'Tháng'];

  List<buoiday> listbuoiday = [
    buoiday('Thứ 2', '1', "0", "0"),
    buoiday('Thứ 3', "0", "0", "0"),
    buoiday('Thứ 4', "0", "0", "0"),
    buoiday('Thứ 5', "0", "0", "0"),
    buoiday('Thứ 6', "0", "0", "0"),
    buoiday('Thứ 7', "0", "0", "0"),
    buoiday('CN', "0", "0", "0"),
  ];

  // Future<void> getDataQH(int id) async {
  //   print('getDataQH');
  //
  //   ResultData res = await authenticationRepositories.getListDataQH(id);
  //   resultListDataQh = resultListDataQhFromJson(res.data);
  //   if (resultListDataQh.data != null) {
  //     resultListDataQh.data.danhSachQuanHuyenTheoTinhThanh.forEach((element) {
  //       if (element.districtId.toString() == resultDetailClass.data.districtId) {
  //         districtEditingController.text = element.districtName;
  //       }
  //     });
  //     // districtEditingController.text = resultListDataQh.data.danhSachQuanHuyenTheoTinhThanh[0].districtName;
  //     print(200);
  //   } else {
  //     print('error');
  //   }
  //   update();
  // }

  // void getData() {
  //   loginController.resultListData.data.danhSachThanhPho.forEach((element) async {
  //     if (element.citName == resultDetailClass.data.citName) {
  //       idProvincial = element.citId;
  //       getDataQH(idProvincial);
  //     }
  //   });
  //
  //   titleEditingController.text = resultDetailClass.data.className;
  //   selectedRequestGS = resultDetailClass.data.nametype;
  //   selectedGender = resultDetailClass.data.userName;
  //   selectedSubject = resultDetailClass.data.subject;
  //
  //   for (int i = 0; i < loginController.resultListData.data.danhSachMonHoc.length; i++) {
  //     if (selectedSubject == loginController.resultListData.data.danhSachMonHoc[i].subject) {
  //       idSubject = loginController.resultListData.data.danhSachMonHoc[i].idSubject;
  //     }
  //   }
  //   listDataTopicSubject(idSubject.toString());
  //   selectedTopicSubject = resultDetailClass.data.nameTopic;
  //
  //   loginController.resultListData.data.danhSachLopHocSeDay.forEach((element) {
  //     if (element.levelClassId.toString() == resultDetailClass.data.levelClassId) {
  //       selectedClassTeaching = element.levelClassName;
  //     }
  //   });
  //
  //   numberStudentEditingController.text = resultDetailClass.data.studentNumber;
  //
  //   resultDetailClass.data.studyForDay == '1'
  //       ? selectedTimeTeaching = listTime[0]
  //       : resultDetailClass.data.studyForDay == '2'
  //       ? selectedTimeTeaching = listTime[1]
  //       : resultDetailClass.data.studyForDay == '3'
  //       ? selectedTimeTeaching = listTime[2]
  //       : selectedTimeTeaching = listTime[3];
  //
  //   listDay.forEach((element) {
  //     if (element == resultDetailClass.data.studyForWeek) {
  //       print('element');
  //       print(element);
  //       selectedDayTeaching = element;
  //     }
  //   });
  //   print('resultDetailClass.data.methodTeach');
  //   print(resultDetailClass.data.methodTeach);
  //   print(selectMethodTeach);
  //   selectMethodTeach = resultDetailClass.data.methodTeach;
  //   feeEditingController.text = resultDetailClass.data.fee;
  //   phoneEditingController.text = resultDetailClass.data.phoneContact;
  //   provincialEditingController.text = resultDetailClass.data.citName;
  //
  //   addressEditingController.text = resultDetailClass.data.address;
  //   listbuoiday[0].sang = resultDetailClass.data.mondayMorning;
  //   listbuoiday[0].chieu = resultDetailClass.data.mondayAfternoon;
  //   listbuoiday[0].toi = resultDetailClass.data.mondayEverning;
  //   listbuoiday[1].sang = resultDetailClass.data.tuesdayMorning;
  //   listbuoiday[1].chieu = resultDetailClass.data.tuesdayAfternoon;
  //   listbuoiday[1].toi = resultDetailClass.data.tuesdayEverning;
  //   listbuoiday[2].sang = resultDetailClass.data.wednesdayMorning;
  //   listbuoiday[2].chieu = resultDetailClass.data.wednesdayAfternoon;
  //   listbuoiday[2].toi = resultDetailClass.data.wednesdayEverning;
  //   listbuoiday[3].sang = resultDetailClass.data.thursdayMorning;
  //   listbuoiday[3].chieu = resultDetailClass.data.thursdayAfternoon;
  //   listbuoiday[3].toi = resultDetailClass.data.thursdayEverning;
  //   listbuoiday[4].sang = resultDetailClass.data.fridayMorning;
  //   listbuoiday[4].chieu = resultDetailClass.data.fridayAfternoon;
  //   listbuoiday[4].toi = resultDetailClass.data.fridayEverning;
  //   listbuoiday[5].sang = resultDetailClass.data.saturdayMorning;
  //   listbuoiday[5].chieu = resultDetailClass.data.saturdayAfternoon;
  //   listbuoiday[5].toi = resultDetailClass.data.saturdayEverning;
  //   listbuoiday[6].sang = resultDetailClass.data.sundayMorning;
  //   listbuoiday[6].chieu = resultDetailClass.data.sundayAfternoon;
  //   listbuoiday[6].toi = resultDetailClass.data.sundayEverning;
  //   classDescription.text = resultDetailClass.data.classDescribe;
  //
  //   loginController.resultListData.data.danhSachKieuGiaSu.forEach((element) {
  //     if (element.nameType == selectedRequestGS) {
  //       idFormTeaching = element.typeId;
  //     }
  //   });
  //   loginController.resultListData.data.danhSachGioiTinh.forEach((element) {
  //     if (element.sexName == selectedGender) {
  //       idGender = element.sexId;
  //     }
  //   });
  //   loginController.resultListData.data.danhSachKieuGiaSu.forEach((element) {
  //     if (element.nameType == selectedRequestGS) {
  //       idMethodTeach = element.typeId;
  //     }
  //   });
  //   idTime = int.parse(resultDetailClass.data.studyForDay);
  //   print('resultDetailClass.data.levelClassId');
  //   print(resultDetailClass.data.levelClassId);
  //   // idClass = resultDetailClass.data.levelClassId;
  //   classId = int.parse(resultDetailClass.data.classId);
  //   idDistrict = int.parse(resultDetailClass.data.districtId);
  // }

  int classId;

  // Future<void> getDetailClass(int idClass) async {
  //   Get.dialog(DialogLoading());
  //   print('detailClass()');
  //   String token = SpUtil.getString(ConstString.token);
  //   ResultData res = await homeRepositories.detailClass(token, idClass);
  //   resultDetailClass = resultDetailClassFromJson(res.data);
  //   if (resultDetailClass.data != null) {
  //     Get.back();
  //     Utils.showToast(resultDetailClass.data.message);
  //     getData();
  //     await Get.offAndToNamed(Routes.UPDATE_POST);
  //     // Get.off(UpdatePostScreen());
  //   } else {
  //     Get.back();
  //     Utils.showToast(resultDetailClass.error.message);
  //   }
  //   update();
  // }

  String selectedRequestGS;

  String selectedGender;

  String selectedSubject;

  String selectedTopicSubject;

  String selectedInforSubject;

  String selectedClassTeaching;

  String selectedTimeTeaching;

  String selectedDayTeaching;

  String selectMethodTeach;

  String selectedFormTeaching;

  String selectedProvincial;
  String selectedDistrict;
  TextEditingController title = TextEditingController();
  TextEditingController numberStudent = TextEditingController();
  TextEditingController contentTitle = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController provincial = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController classDescription = TextEditingController();
  TextEditingController salaryCD = TextEditingController();
  TextEditingController salaryUL1 = TextEditingController();
  TextEditingController salaryUL2 = TextEditingController();
  bool errorTitle = false;
  bool errorRequestGS = false;
  bool errorGender = false;
  bool errorSubject = false;
  bool errorTopicSubject = false;
  bool errorClassTeaching = false;
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
  bool errorBuoiDay = false;
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
    phoneEditingController.addListener(() {
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
    // getDataQH(idProvincial);
    super.onInit();
  }

  bool valueButtonLuong = false;

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

  void onSelectedStatusFee(String value) {
    selectedStatusFee = value;
    errorStatusFee = false;
    update();
  }

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

  void onSelectedGender(String value) {
    selectedGender = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachGioiTinh.length; i++) {
    //   if (value == loginController.resultListData.data.danhSachGioiTinh[i].sexName) {
    //     idGender = loginController.resultListData.data.danhSachGioiTinh[i].sexId;
    //   }
    // }
    errorGender = false;
    update();
  }

  void onSelectedSubject(String value) {
    selectedSubject = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachMonHoc.length; i++) {
    //   if (value == loginController.resultListData.data.danhSachMonHoc[i].subject) {
    //     idSubject = loginController.resultListData.data.danhSachMonHoc[i].idSubject;
    //   }
    // }
    // listDataTopicSubject(idSubject.toString());
    errorSubject = false;
    update();
  }

  void onSelectedTopicSubject(String value) {
    selectedTopicSubject = value;
    // for (int i = 0; i < resultDataTopic.data.danhSachMonHocChiTietTheoMonHoc.length; i++) {
    //   if (value == resultDataTopic.data.danhSachMonHocChiTietTheoMonHoc[i].nameTopic) {
    //     idTopicSubject = resultDataTopic.data.danhSachMonHocChiTietTheoMonHoc[i].topicId;
    //   }
    // }
    errorTopicSubject = false;
    update();
  }

  void onSelectedClassTeaching(String value) {
    selectedClassTeaching = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachLopHocSeDay.length; i++) {
    //   if (value == loginController.resultListData.data.danhSachLopHocSeDay[i].levelClassName)
    //     idClass = loginController.resultListData.data.danhSachLopHocSeDay[i].levelClassId;
    // }
    errorClassTeaching = false;
    print(idClass);
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
    errorMethodTeach = false;
    print(idMethodTeach);
    update();
  }

  void onSelectedKieuGS(String value) {
    selectedRequestGS = value;
    // for (int i = 0; i < loginController.resultListData.data.danhSachKieuGiaSu.length; i++) {
    //   if (loginController.resultListData.data.danhSachKieuGiaSu[i].nameType == value) {
    //     idFormTeaching = loginController.resultListData.data.danhSachKieuGiaSu[i].typeId;
    //   }
    // }
    errorRequestGS = false;
    update();
  }

  // Future<void> listDataTopicSubject(String id) async {
  //   listTopicSubject = [];
  //   print('listDataTopicSubject');
  //   ResultData res = await authenticationRepositories.listDataTopicSubject(id);
  //   resultDataTopic = resultDataTopicFromJson(res.data);
  //   if (res.data != null) {
  //     //Utils.showToast(resultDataTopic.data.message);
  //     listTopicSubject = resultDataTopic.data.danhSachMonHocChiTietTheoMonHoc.map((e) => e.nameTopic).toList();
  //     selectedTopicSubject = listTopicSubject[0];
  //     idTopicSubject = resultDataTopic.data.danhSachMonHocChiTietTheoMonHoc[0].topicId;
  //     print(200);
  //   } else {
  //     Utils.showToast(resultDataTopic.error.message);
  //     print('error');
  //   }
  //   update();
  // }
  //
  // Future<void> createPost() async {
  //   String token = SpUtil.getString(ConstString.token);
  //   ResultData res = await postRepositories.createPost(
  //       token,
  //       titleEditingController.text,
  //       idFormTeaching,
  //       idGender,
  //       idSubject,
  //       idTopicSubject,
  //       idClass,
  //       int.parse(numberStudentEditingController.text),
  //       idTime,
  //       int.parse(selectedDayTeaching),
  //       idMethodTeach,
  //       feeEditingController.text,
  //       //phone
  //       phoneEditingController.text,
  //       idProvincial,
  //       idDistrict,
  //       addressEditingController.text,
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
  //       classDescription.text);
  //   ResultDataCreatePost resultDataCreatePost = resultDataCreatePostFromJson(res.data);
  //   if (resultDataCreatePost.data != null) {
  //     Utils.showToast(resultDataCreatePost.data.message);
  //     Get.dialog(DialogSuccess(
  //         title: 'Tạo tin đăng thành công',
  //         titleButton: 'Xác nhân',
  //         subTitle: true,
  //         onTap: () {
  //           Get.offAllNamed(Routes.LIST_POST);
  //         }));
  //   } else {
  //     Utils.showToast(resultDataCreatePost.error.message);
  //   }
  // }
  //
  // Future<void> updatePost() async {
  //   String token = SpUtil.getString(ConstString.token);
  //   ResultData res = await postRepositories.updatePost(
  //       token,
  //       titleEditingController.text,
  //       classId,
  //       idFormTeaching,
  //       idGender,
  //       idSubject,
  //       idTopicSubject,
  //       idClass,
  //       int.parse(numberStudentEditingController.text),
  //       idTime,
  //       int.parse(selectedDayTeaching),
  //       idMethodTeach,
  //       feeEditingController.text,
  //       //phone
  //       phoneEditingController.text,
  //       idProvincial,
  //       idDistrict,
  //       addressEditingController.text,
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
  //       classDescription.text);
  //   ResultDataCreatePost resultDataCreatePost = resultDataCreatePostFromJson(res.data);
  //   if (resultDataCreatePost.data != null) {
  //     Utils.showToast(resultDataCreatePost.data.message);
  //     Get.dialog(DialogSuccess(
  //         title: 'Tạo tin đăng thành công',
  //         titleButton: 'Xác nhân',
  //         subTitle: true,
  //         onTap: () {
  //           Get.offAndToNamed(Routes.LIST_POST);
  //         }));
  //   } else {
  //     Utils.showToast(resultDataCreatePost.error.message);
  //   }
  // }

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
    if (errorPhone && phoneEditingController.text.isEmpty) {
      return 'Trường bắt buộc!';
    } else if (errorPhone && phoneEditingController.text.length < 10) {
      return 'Số điện thoại không hợp lệ!';
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
    errorRequestGS = selectedRequestGS.isNull ? true : false;
    errorGender = selectedGender.isNull ? true : false;
    errorSubject = selectedSubject.isNull ? true : false;
    errorTopicSubject = selectedTopicSubject.isNull ? true : false;
    errorClassTeaching = selectedTopicSubject.isNull ? true : false;
    errorTimeTeaching = selectedTimeTeaching.isNull ? true : false;
    errorDayTeaching = selectedDayTeaching.isNull ? true : false;
    errorMethodTeach = selectMethodTeach.isNull ? true : false;
    final data = listbuoiday.firstWhere((e) => e.sang == 1 || e.chieu == 1 || e.toi == 1, orElse: () => null);
    errorbuoiday = data == null ? true : false;
    if (contentTitle.text.isNotEmpty &&
        title.text.isNotEmpty &&
        errorRequestGS == false &&
        errorGender == false &&
        errorSubject == false &&
        errorTopicSubject == false &&
        errorClassTeaching == false &&
        numberStudent.text.isNotEmpty &&
        numberStudent.text != '0' &&
        errorTimeTeaching == false &&
        errorDayTeaching == false &&
        errorMethodTeach == false &&
        provincial.text.isNotEmpty &&
        district.text.isNotEmpty &&
        address.text.isNotEmpty &&
        data != null) {
      print('Đúng');
      // createPost();
    } else {
      print('Sai');
      Get.dialog(DialogError(
        title: 'Tất cả các thông tin trên là bắt buộc để đăng tin.',
        onTap: () => Get.back(),
        textButton: 'Ok',
        richText: false,
      ));
    }
    update();
  }
}
