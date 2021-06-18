import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_class_accepted.dart';
import 'package:giasu_vn/common/shared/data/models/result_delete_class_accepted.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListClassTeachingController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultClassAccepted resultClassAccepted = ResultClassAccepted();
  ResultDeleteClassAccept resultDeleteClassAccept = ResultDeleteClassAccept();
  List<ListPhdnd> listPHDND = [];

  Future<void> classAccepted(int currentPage, int limit) async {
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.classAccepted(token, currentPage, limit);
    resultClassAccepted = resultClassAcceptedFromJson(res.data);
    if (resultClassAccepted.data != null) {
      for (int i = 0; i < resultClassAccepted.data.listPhdnd.length; i++) {
        listPHDND.add(resultClassAccepted.data.listPhdnd[i]);
      }
    } else {
      Utils.showToast(resultClassAccepted.error.message);
    }
    update();
  }

  Future<void> deleteClassAccepted(int idLop) async {
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.deleteClassAccepted(token, idLop);
    resultDeleteClassAccept = resultDeleteClassAcceptFromJson(res.data);
    if (resultDeleteClassAccept.data != null) {
      Utils.showToast(resultDeleteClassAccept.data.message);
    } else {
      Utils.showToast(resultDeleteClassAccept.error.message);
    }
    update();
  }
}
