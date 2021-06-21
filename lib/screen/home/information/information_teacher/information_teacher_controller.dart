import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_invite_teach.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_class_post.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:sp_util/sp_util.dart';

class InformationTeacherController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultListClassPosted resultListClassPosted = ResultListClassPosted();
  ResultInviteTeach resultInviteTeach = ResultInviteTeach();
  List<ListClass> listPostCreated = [];
  List<buoiday> listbuoiday = [
    buoiday('Thứ 2', '1', "0", "0"),
    buoiday('Thứ 3', "0", "0", "0"),
    buoiday('Thứ 4', "0", "0", "0"),
    buoiday('Thứ 5', "0", "0", "0"),
    buoiday('Thứ 6', "0", "0", "0"),
    buoiday('Thứ 7', "0", "0", "0"),
    buoiday('CN', "0", "0", "0"),
  ];
  bool isShowed = false;
  String idClass;

  Future<void> classPosted(int currentPage, int limit) async {
    print('classPosted');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.listClassPost(token, currentPage, limit);
    resultListClassPosted = resultListClassPostedFromJson(res.data);
    if (resultListClassPosted.data != null) {
      // Get.back();
      if (resultListClassPosted.data.listClass.isNotEmpty) {
        for (int i = 0; i < resultListClassPosted.data.listClass.length; i++) {
          listPostCreated.add(resultListClassPosted.data.listClass[i]);
        }
      } else {
        Utils.showToast('Hết');
      }
    } else {
      // Get.back();
      Utils.showToast(resultListClassPosted.error.message);
    }
    update();
  }
  Future<void> inviteTeach(int idLop, int idGS) async {
    print('refuseOffer');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.inviteTeach(token, idLop, idGS);
    resultInviteTeach = resultInviteTeachFromJson(res.data);
    if (resultInviteTeach.data != null) {
      Get.back();
      Utils.showToast(resultInviteTeach.data.message);
    } else {
      Get.back();
      Utils.showToast(resultInviteTeach.error.message);
    }
    update();
  }
}