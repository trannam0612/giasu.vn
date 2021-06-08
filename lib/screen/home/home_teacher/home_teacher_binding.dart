import 'package:get/get.dart';
import 'package:giasu_vn/screen/home/home_teacher/home_teacher_controller.dart';

class HomeTeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeTeacherController());
  }

}