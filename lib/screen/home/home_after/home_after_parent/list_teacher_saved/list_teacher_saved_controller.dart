import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_tutor_saved.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListTeacherSavedController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultTutorSaved resultTutorSaved = ResultTutorSaved();
  List<ListGsdl> listGSDL = [];
  Future<void> tutorSaved(int loadMore, int limit) async {
    print('tutorSaved');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.tutorSaved(token, loadMore, limit);
    resultTutorSaved = resultTutorSavedFromJson(res.data);
    if (resultTutorSaved.data != null) {
      // Get.back();
      for (int i = 0; i < resultTutorSaved.data.listGsdl.length; i++) {
        listGSDL.add(resultTutorSaved.data.listGsdl[i]);
      }
    } else {
      Get.back();
      Utils.showToast(resultTutorSaved.error.message);
    }
    update();
  }
}