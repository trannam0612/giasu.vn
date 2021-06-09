import 'package:get/get.dart';
import 'package:giasu_vn/screen/settings/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }

}