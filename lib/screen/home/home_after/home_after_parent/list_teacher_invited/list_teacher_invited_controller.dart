import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:sp_util/sp_util.dart';

class ListTeacherInvitedController extends GetxController {

  HomeRepositories homeRepositories = HomeRepositories();
  // Future<void> invitedGiaSu(int loadMore, int limit) async {
  //   print('invitedGiaSu');
  //   // await Future.delayed(Duration(milliseconds: 1));
  //   // Get.dialog(DialogLoading());
  //   String token = SpUtil.getString(ConstString.token);
  //   ResultData res = await homeRepositories.invitedTutor(token, loadMore, limit);
  //   resultGiaSuInvited = resultGiaSuInvitedFromJson(res.data);
  //   if (resultGiaSuInvited.data != null) {
  //     Get.back();
  //     for (int i = 0; i < resultGiaSuInvited.data.listTeacherInvited.length; i++) {
  //       listGiaSuInvited.add(resultGiaSuInvited.data.listTeacherInvited[i]);
  //     }
  //   } else {
  //     Get.back();
  //     Utils.showToast(resultGiaSuInvited.error.message);
  //   }
  //   update();
  // }
}