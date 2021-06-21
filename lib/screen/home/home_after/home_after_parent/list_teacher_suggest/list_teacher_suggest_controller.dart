import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_tutor_invited.dart';
import 'package:giasu_vn/common/shared/data/models/result_tutor_offered_teach.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class  ListTeacherSuggestController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  List<ListGsdd> listGSDD = [];
  ResultTutorOfferedTeach resultTutorOfferedTeach = ResultTutorOfferedTeach();
  Future<void> tutorOfferedTeach(int currentPage, int limit) async {
    print('invitedTutor');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.tutorOfferedTeach(token, currentPage, limit);
    resultTutorOfferedTeach = resultTutorOfferedTeachFromJson(res.data);
    if (resultTutorOfferedTeach.data != null) {
      // Get.back();
      if(resultTutorOfferedTeach.data.listGsdd.isNotEmpty) {
        for (int i = 0; i < resultTutorOfferedTeach.data.listGsdd.length; i++) {
          listGSDD.add(resultTutorOfferedTeach.data.listGsdd[i]);
        }
      }
      else {
        Utils.showToast('Hết');
      }
    } else {
      // Get.back();
      Utils.showToast(resultTutorOfferedTeach.error.message);
    }
    update();
  }
}