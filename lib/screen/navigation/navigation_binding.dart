import 'package:get/get.dart';
import 'package:giasu_vn/screen/notifications/notification_controller.dart';
import 'package:giasu_vn/screen/settings/settings_controller.dart';

import 'navigation_controller.dart';

class NavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => NotificationController());
    // Get.lazyPut(() => SettingsController());
  }
}
