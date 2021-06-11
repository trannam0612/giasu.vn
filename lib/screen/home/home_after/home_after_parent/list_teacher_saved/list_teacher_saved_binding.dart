import 'package:get/get.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_saved/list_teacher_saved_controller.dart';

class ListTeacherSavedBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ListTeacherSavedController());
  }

}