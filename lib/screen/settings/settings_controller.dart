import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:sp_util/sp_util.dart';

class SettingsController extends GetxController {
  bool isSwitchedNotification = false;
  bool isSwitchedMessage = false;
  bool isSwitchedVibrate = false;
  String user;

  @override
  void onInit() {
    user = SpUtil.getString(ConstString.USER_TYPE);
    print(user);
    // TODO: implement onInit
    super.onInit();
  }

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
