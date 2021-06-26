import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_delete_tutor_saved.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_district.dart';
import 'package:giasu_vn/common/shared/data/models/result_save_tutor.dart';
import 'package:giasu_vn/common/shared/data/models/result_search_list_class.dart';
import 'package:giasu_vn/common/shared/data/models/result_search_list_teacher.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/search_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/search/list_result_search_screen.dart';
import 'package:sp_util/sp_util.dart';

class SearchController extends GetxController {
  List<ListDistrict> listDistrict = [];
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  ResultListDistrict resultListDistrict = ResultListDistrict();
  SearchRepositories searchRepositories = SearchRepositories();
  ResultSearchListTeacher resultSearchListTeacher = ResultSearchListTeacher();
  ResultSearchClassTeacher resultSearchClassTeacher = ResultSearchClassTeacher();
  ResultSaveTutor resultSaveTutor = ResultSaveTutor();

  HomeRepositories homeRepositories = HomeRepositories();
  bool isValueSearch = true;
  TextEditingController provincial = TextEditingController();
  TextEditingController className = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController methodTeach = TextEditingController();
  Position locationDefault = Position(latitude: 0, longitude: 0);
  int idProvincial;
  int idClass;
  int idSubject;
  int idForm;
  bool errorProvincial = false;
  bool valueCheckBox = false;
  bool errorDistrict = false;
  bool errorSubject = false;
  bool errorMethodTeach = false;
  String userType;

  List<String> listMethodTeach = ['Online', 'Gặp mặt'];

  @override
  void onInit() {
    userType = SpUtil.getString(ConstString.USER_TYPE);
    // TODO: implement onInit
    super.onInit();
  }

  String checkProvincial() {
    print('checkProvincial');
    if (errorProvincial && provincial.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  String selectedSubject;

  void onSelectedSubject(String value) {
    selectedSubject = value;
    for (int i = 0; i < listDataSubject.length; i++) {
      if (value == listDataSubject[i].asName) {
        idSubject = int.parse(listDataSubject[i].asId);
      }
    }

    update();
  }

  void changeValueCheckBox() {
    valueCheckBox = !valueCheckBox;
    idForm = valueCheckBox ? 1 : 2;
    update();
  }

  String checkDistrict() {
    print('checkProvincial');
    if (errorDistrict && className.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  void displayCurrentLocation() async {
    final location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    locationDefault = location;
    print('locationDefault');
    print(locationDefault);
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

  List<DataG> listDataTeacher = [];

  Future<void> searchParent() async {
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await searchRepositories.searchParent(token, 1, idSubject, idClass, idProvincial, 1, 10);
    resultSearchListTeacher = resultSearchListTeacherFromJson(res.data);
    if (resultSearchListTeacher.data != null) {
      listDataTeacher = listDataTeacher + resultSearchListTeacher.data.data.dataGs;
      Get.to(ListResultSearchScreen());
    } else {
      print(resultSearchListTeacher.error.message);
    }
    update();
  }

  ResultDeleteTutorSaved resultDeleteTutorSaved = ResultDeleteTutorSaved();

  Future<void> deleteTutorSaved(int idGS) async {
    print('homeAfterParent');
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.deleteTutorSaved(token, idGS);
    resultDeleteTutorSaved = resultDeleteTutorSavedFromJson(res.data);
    if (resultDeleteTutorSaved.data != null) {
      Utils.showToast('Đã bỏ lưu');
    } else {
      Utils.showToast(resultSaveTutor.error.message);
    }
    update();
  }

  Future<void> searchTeacher() async {
    ResultData res = await searchRepositories.searchClass(1, idSubject, idClass, idProvincial, 1, 10);
    resultSearchClassTeacher = resultSearchClassTeacherFromJson(res.data);
    if (resultSearchClassTeacher.data != null) {
      print(resultSearchClassTeacher.data.message);
      Get.to(ListResultSearchScreen());
    } else {
      print(resultSearchClassTeacher.error.message);
    }
    update();
  }

  Future<void> saveTutor(int idGS) async {
    print('homeAfterParent');
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.saveTutor(token, idGS);
    resultSaveTutor = resultSaveTutorFromJson(res.data);
    if (resultSaveTutor.data != null) {
      Utils.showToast('Đã lưu');
    } else {
      Utils.showToast(resultSaveTutor.error.message);
    }
    update();
  }
}
