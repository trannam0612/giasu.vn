import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_class_offered.dart';
import 'package:giasu_vn/common/shared/data/models/result_delete_class_offered.dart';
import 'package:giasu_vn/common/shared/data/models/result_offer_teach.dart';
import 'package:giasu_vn/common/shared/data/models/result_offered_teach.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListClassSuggestController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultClassOffered resultClassOffered = ResultClassOffered();
  ResultDeleteClassOffered resultDeleteClassOffered = ResultDeleteClassOffered();
  List<ListLddn> listLDDN = [];

  Future<void> classOffered(int currentPage, int limit) async {
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.classOffered(token, currentPage, limit);
    resultClassOffered = resultClassOfferedFromJson(res.data);
    if (resultClassOffered.data != null) {
      for (int i = 0; i < resultClassOffered.data.listLddn.length; i++) {
        listLDDN.add(resultClassOffered.data.listLddn[i]);
      }
    } else {
      Utils.showToast(resultClassOffered.error.message);
    }
    update();
  }

  Future<void> deleteClassOffered(int idClass) async {
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.deleteClassOffered(token, idClass);
    resultDeleteClassOffered = resultDeleteClassOfferedFromJson(res.data);
    if (resultDeleteClassOffered.data != null) {
      Utils.showToast('Đã xoá');
    } else {
      Utils.showToast(resultDeleteClassOffered.error.message);
    }
    update();
  }
}
