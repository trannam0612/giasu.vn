import 'package:get/get.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_before.dart';

import '../../../common/shared/data/http/result_data.dart';
import '../../../common/shared/data/repositories/home_repositories.dart';
import '../../../common/shared/data/repositories/home_repositories.dart';
import '../../../common/shared/data/repositories/home_repositories.dart';
import '../../../widgets/dialog_loading.dart';
import 'home_before_screen.dart';

class HomeBeforeController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultHomeBefore resultHomeBefore = ResultHomeBefore();
  List<DataG> listGSGD = [];
  List<DataDslh> listLHPB = [];

  Future<void> homeBefore() async {
    await Future.delayed(Duration(milliseconds: 1));
    Get.dialog(DialogLoading());
    ResultData res = await homeRepositories.homeBefore();
    resultHomeBefore = resultHomeBeforeFromJson(res.data);
    if (resultHomeBefore.data != null) {
      listGSGD = resultHomeBefore.data.dataGs;
      listLHPB = resultHomeBefore.data.dataDslh;
      Get.back();
      Get.to(HomeBeforeScreen());
    }
    update();
  }
}
