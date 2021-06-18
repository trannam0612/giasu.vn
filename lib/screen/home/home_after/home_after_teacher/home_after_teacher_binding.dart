import 'package:get/get.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_controller.dart';

class HomeAfterTeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeAfterTeacherController());
  }

}