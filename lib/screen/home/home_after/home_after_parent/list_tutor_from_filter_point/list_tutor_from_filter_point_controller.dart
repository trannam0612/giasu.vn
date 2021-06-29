import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_delete_tutor_point_free.dart';
import 'package:giasu_vn/common/shared/data/models/result_tutor_from_filter_point.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListTutorFromFilterPointController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultTutorFromFilterPoint resultTutorFromFilterPoint = ResultTutorFromFilterPoint();
  ResultDeleteTutorPointFree resultDeleteTutorPointFree = ResultDeleteTutorPointFree();
  List<ListGstdl> listGSTDL = [];

  Future<void> tutorFromFilterPoint(int loadMore, int limit) async {
    print('tutorFromFilterPoint');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.tutorFromFilterPoint(token, loadMore, limit);
    resultTutorFromFilterPoint = resultTutorFromFilterPointFromJson(res.data);
    if (resultTutorFromFilterPoint.data != null) {
      // Get.back();
      if (resultTutorFromFilterPoint.data.listGstdl.isNotEmpty) {
        for (int i = 0; i < resultTutorFromFilterPoint.data.listGstdl.length; i++) {
          listGSTDL.add(resultTutorFromFilterPoint.data.listGstdl[i]);
        }
      } else {
        Utils.showToast('Hết');
      }
    } else {
      Get.back();
      Utils.showToast(resultTutorFromFilterPoint.error.message);
    }
    update();
  }Future<void> deleteTutorPointFree(int idGS) async {
    print('deleteTutorPointFree');
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.deleteTutorPointFree(token,idGS);
    resultDeleteTutorPointFree = resultDeleteTutorPointFreeFromJson(res.data);
    if (resultDeleteTutorPointFree.data != null) {
      Utils.showToast(resultDeleteTutorPointFree.data.message);
    } else {
      Get.back();
      Utils.showToast(resultDeleteTutorPointFree.error.message);
    }
    update();
  }
}
