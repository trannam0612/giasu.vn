import 'package:get/get.dart';

import 'update_info_parent_controller.dart';


class UpdateInformationParentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateInformationParentController());
  }
}