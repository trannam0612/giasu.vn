import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_tutor_teaching.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListTutorTeachingController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultTutorTeaching resultTutorTeaching = ResultTutorTeaching();
  List<ListGsdd> listGSDD = [];
  Future<void> tutorTeaching(int loadMore, int limit) async {
    print('tutorFromFilterPoint');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.tutorTeaching(token, loadMore, limit);
    resultTutorTeaching = resultTutorTeachingFromJson(res.data);
    if (resultTutorTeaching.data != null) {
      // Get.back();
      if (resultTutorTeaching.data.listGsdd.isNotEmpty) {
        for (int i = 0; i < resultTutorTeaching.data.listGsdd.length; i++) {
          listGSDD.add(resultTutorTeaching.data.listGsdd[i]);
        }
      } else {
        Utils.showToast('Hết');
      }
    } else {
      Get.back();
      Utils.showToast(resultTutorTeaching.error.message);
    }
    update();
  }
}