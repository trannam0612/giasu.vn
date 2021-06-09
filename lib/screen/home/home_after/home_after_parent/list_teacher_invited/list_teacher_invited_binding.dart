import 'package:get/get.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_invited/list_teacher_invited_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_teacher_invited/list_teacher_invited_screen.dart';

class ListTeacherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ListTeacherInvitedController());
  }

}