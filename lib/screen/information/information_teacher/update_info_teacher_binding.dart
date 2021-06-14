import 'package:get/get.dart';

import 'update_info_teacher_controller.dart';

class UpdateInfoTeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateInfoTeacherController());
  }
}