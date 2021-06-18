import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_after_parent.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_screen.dart';
import 'package:sp_util/sp_util.dart';

class HomeAfterParentController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultHomeAfterParent resultHomeAfterParent = ResultHomeAfterParent();
  bool checkSave;

  @override
  void onInit() {
    super.onInit();

    void changeValueSave() {
      checkSave = !checkSave;
      update();
    }
  }
}
