import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  bool isValueSearch = true;
  TextEditingController provincial = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController methodTeach = TextEditingController();
  Position locationDefault = Position(latitude: 0, longitude: 0);

  bool errorProvincial = false;
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
}