import 'package:get/get.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_controller.dart';

import 'home_before_controller.dart';

class HomeBeforeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeBeforeController());
  }

}