import 'package:get/get.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_controller.dart';

class HomeAfterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeAfterController());
  }

}