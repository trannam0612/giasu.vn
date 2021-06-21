import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_after_parent.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListTeacherRecentlyController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultHomeAfterParent resultHomeAfterParent = ResultHomeAfterParent();
  List<DataDsgs> listGSGDMore = [];
  Future<void> listTeacherRecently(int currentPage, int limit) async {
    print('homeAfterParent');
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.homeAfter(token, currentPage, limit);
    resultHomeAfterParent = resultHomeAfterParentFromJson(res.data);
    if (resultHomeAfterParent.data != null) {
      if(resultHomeAfterParent.data.dataTutorGd.dataDsgsgd.isNotEmpty) {
        for (int i = 0; i < resultHomeAfterParent.data.dataTutorGd.dataDsgsgd.length; i++) {
          listGSGDMore.add(resultHomeAfterParent.data.dataTutorGd.dataDsgsgd[i]);
        }
      }
      else {
        Utils.showToast('Đã hết');
      }

    }
    update();
  }
}