import 'package:get/get.dart';

import 'register_phuhuynh_controller.dart';


class RegisterPhuHuynhBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterPhuHuynhController());
  }
}