import 'package:get/get.dart';

class SettingsController extends GetxController {
  bool isSwitchedNotification = false;
  bool isSwitchedMessage = false;
  bool isSwitchedVibrate = false;

  void onChangedNotification() {
    isSwitchedNotification = !isSwitchedNotification;
    update();
  }

  void onChangedMessage() {
    isSwitchedMessage = !isSwitchedMessage;
    update();
  }

  void onChangedVibrate() {
    isSwitchedVibrate = !isSwitchedVibrate;
    update();
  }
}
