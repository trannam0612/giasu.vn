import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_district.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/search_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';

class SearchController extends GetxController {
  List<ListDistrict> listDistrict = [];
  AuthenticationRepositories authenticationRepositories = AuthenticationRepositories();
  ResultListDistrict resultListDistrict = ResultListDistrict();
  SearchRepositories searchRepositories = SearchRepositories();
  bool isValueSearch = true;
  TextEditingController provincial = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController methodTeach = TextEditingController();
  Position locationDefault = Position(latitude: 0, longitude: 0);
  int idProvincial;
  int idDistrict;
  int idSubject;
  int idForm;
  bool errorProvincial = false;
  bool valueCheckBox = false;
  bool errorDistrict = false;
  bool errorSubject = false;
  bool errorMethodTeach = false;
  String userType = '2';

  List<String> listMethodTeach = ['Online', 'Gặp mặt'];

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
    if (errorDistrict && district.text.isEmpty) {
      return 'Trường bắt buộc!';
    }
    return null;
  }

  void displayCurrentLocation() async {
    final location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    locationDefault = location;
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

  Future<void> searchParent() async {
    ResultData res = await searchRepositories.searchParent(idProvincial, idDistrict, idSubject, idForm, 1, 10);
    update();
  }
}
