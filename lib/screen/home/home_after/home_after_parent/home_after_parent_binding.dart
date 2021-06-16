import 'package:get/get.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_controller.dart';

class HomeAfterParentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeAfterParentController());
    // TODO: implement dependencies
  }

}