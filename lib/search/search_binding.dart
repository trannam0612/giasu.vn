import 'package:get/get.dart';
import 'package:giasu_vn/screen/settings/settings_controller.dart';
import 'package:giasu_vn/search/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }

}