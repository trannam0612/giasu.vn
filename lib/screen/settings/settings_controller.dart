import 'package:get/get.dart';

class SettingsController extends GetxController {
  bool isSwitched = false;


  void onChanged() {
    isSwitched =!isSwitched;
    update();
}
}