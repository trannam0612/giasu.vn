import 'package:get/get.dart';

import 'update_post_controller.dart';

class UpdatePostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdatePostController());
  }
}