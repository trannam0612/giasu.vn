import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_accept_invite_teach.dart';
import 'package:giasu_vn/common/shared/data/models/result_parent_invited.dart';
import 'package:giasu_vn/common/shared/data/models/result_refuse_invite_teach.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListClassInvitedController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultParentInvited resultParentInvited = ResultParentInvited();
  ResultAcceptInviteTeach resultAcceptInviteTeach = ResultAcceptInviteTeach();
  ResultRefuseInviteTeach resultRefuseInviteTeach = ResultRefuseInviteTeach();
  List<ListPhmd> listPHMD = [];

  Future<void> parentInvited(int currentPage, int limit) async {
    String token = SpUtil.getString(ConstString.token);
    try {
      ResultData res = await homeRepositories.parentInvited(token, currentPage, limit);
      resultParentInvited = resultParentInvitedFromJson(res.data);
      if (resultParentInvited.data != null) {
        for (int i = 0; i < resultParentInvited.data.listPhmd.length; i++) {
          listPHMD.add(resultParentInvited.data.listPhmd[i]);
        }
      } else {
        Utils.showToast(resultParentInvited.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> acceptInviteTeach(int idLop) async {
    String token = SpUtil.getString(ConstString.token);
    try {
      ResultData res = await homeRepositories.acceptInviteTeach(token, idLop);
      resultAcceptInviteTeach = resultAcceptInviteTeachFromJson(res.data);
      if (resultAcceptInviteTeach.data != null) {
        Utils.showToast(resultAcceptInviteTeach.data.message);
      } else {
        Utils.showToast(resultAcceptInviteTeach.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> refuseInviteTeach(int idLop) async {
    String token = SpUtil.getString(ConstString.token);
    try {
      ResultData res = await homeRepositories.refuseInviteTeach(token, idLop);
      resultRefuseInviteTeach = resultRefuseInviteTeachFromJson(res.data);
      if (resultRefuseInviteTeach.data != null) {
        Utils.showToast(resultRefuseInviteTeach.data.message);
      } else {
        Utils.showToast(resultRefuseInviteTeach.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
}
