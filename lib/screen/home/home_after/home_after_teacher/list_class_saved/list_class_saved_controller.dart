import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_class_saved.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListClassSavedController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultClassSaved resultClassSaved = ResultClassSaved();
  List<ListLdl> listLDL = [];

  Future<void> classSaved(int currentPage, int limit) async {
    print('recentlyClass');
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.classSaved(token, currentPage, limit);
    resultClassSaved = resultClassSavedFromJson(res.data);
    if (resultClassSaved.data != null) {
      for (int i = 0; i < resultClassSaved.data.listLdl.length; i++) {
        listLDL.add(resultClassSaved.data.listLdl[i]);
      }
    } else {
      Utils.showToast('Trống!');
    }
    update();
  }
}
