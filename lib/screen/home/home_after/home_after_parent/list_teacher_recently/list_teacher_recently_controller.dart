import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_after_parent.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_before.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListTeacherRecentlyController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultHomeAfterParent resultHomeAfterParent = ResultHomeAfterParent();
  ResultHomeBefore resultHomeBefore = ResultHomeBefore();
  List<DataDsgs> listGSGDMore = [];
  List<DataG> listGSGDBefore = [];

  Future<void> listTeacherRecently(int currentPage, int limit) async {
    String token = SpUtil.getString(ConstString.token);
    try {
      ResultData res = await homeRepositories.homeAfter(token, currentPage, limit);
      resultHomeAfterParent = resultHomeAfterParentFromJson(res.data);
      if (resultHomeAfterParent.data != null) {
        print('resultHomeAfterParent:${resultHomeAfterParent.data.dataDsgsgd.map((e) => e.asIdName)}');
        if (resultHomeAfterParent.data.dataDsgsgd.length > 0) {
          for (int i = 0; i < resultHomeAfterParent.data.dataDsgsgd.length; i++) {
            listGSGDMore.add(resultHomeAfterParent.data.dataDsgsgd[i]);
          }
        } else {
          Utils.showToast('Đã hết');
        }
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> listTeacherRecentlyBefore() async {
    try {
      ResultData res = await homeRepositories.homeBefore();
      resultHomeBefore = resultHomeBeforeFromJson(res.data);
      if (resultHomeBefore.data != null) {
        if (resultHomeBefore.data.dataGs.length > 0) {
          for (int i = 0; i < resultHomeBefore.data.dataGs.length; i++) {
            listGSGDBefore.add(resultHomeBefore.data.dataGs[i]);
          }
        } else {
          Utils.showToast('Đã hết');
        }
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
}
