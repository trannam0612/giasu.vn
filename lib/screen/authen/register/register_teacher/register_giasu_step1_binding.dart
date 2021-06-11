import 'package:get/get.dart';

import 'register_giasu_controller.dart';

class RegisterGiaSuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterGiaSuController());
  }
}