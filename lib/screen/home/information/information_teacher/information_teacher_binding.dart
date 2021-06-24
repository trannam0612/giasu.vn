import 'package:get/get.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/information_teacher_controller.dart';

class InformationTeacherBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => InformationTeacherController());
  }

}