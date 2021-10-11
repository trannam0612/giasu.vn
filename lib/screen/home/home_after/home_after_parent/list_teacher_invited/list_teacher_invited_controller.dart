import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_tutor_invited.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListTeacherInvitedController extends GetxController {

  HomeRepositories homeRepositories = HomeRepositories();
  List<ListGsmd> listGSMD = [];
  ResultTutorInvited resultTutorInvited = ResultTutorInvited();
  Future<void> invitedTutor(int currentPage, int limit) async {
    print('invitedTutor');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    try{
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.invitedTutor(token, currentPage, limit);
    resultTutorInvited = resultTutorInvitedFromJson(res.data);
    if (resultTutorInvited.data != null) {
      // Get.back();
      if(resultTutorInvited.data.listGsmd.isNotEmpty) {
        for (int i = 0; i < resultTutorInvited.data.listGsmd.length; i++) {
          listGSMD.add(resultTutorInvited.data.listGsmd[i]);
        }
      }
      else {
        Utils.showToast('Hết');
      }
    } else {
      // Get.back();
      Utils.showToast(resultTutorInvited.error.message);
    }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
}