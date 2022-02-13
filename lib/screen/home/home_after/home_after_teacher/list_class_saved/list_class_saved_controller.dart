import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_class_saved.dart';
import 'package:giasu_vn/common/shared/data/models/result_offer_teach.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

import '../../../../../common/utils.dart';

class ListClassSavedController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultClassSaved resultClassSaved = ResultClassSaved();
  ResultOfferTeach resultOfferTeach = ResultOfferTeach();

  List<ListLdl> listLDL = [];

  Future<void> classSaved(int currentPage, int limit) async {
    print('recentlyClass');
    String token = SpUtil.getString(ConstString.token);
    try {
      ResultData res = await homeRepositories.classSaved(token, currentPage, limit);
      resultClassSaved = resultClassSavedFromJson(res.data);
      if (resultClassSaved.data != null) {
        if (resultClassSaved.data.listLdl.isNotEmpty) {
          for (int i = 0; i < resultClassSaved.data.listLdl.length; i++) {
            listLDL.add(resultClassSaved.data.listLdl[i]);
          }
        } else {
          Utils.showToast("Đã hết");
        }
      } else {
        Utils.showToast('Trống!');
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> offerTeach(int idClass, {bool type = false}) async {
    String token = SpUtil.getString(ConstString.token);
    try {
      ResultData res = await homeRepositories.offerTeach(token, idClass);
      resultOfferTeach = resultOfferTeachFromJson(res.data);
      if (resultOfferTeach.data != null) {
        print('type:${type}');

        if (type == true) {
          print('type:${type}');
          listLDL[listLDL.indexWhere((element) => element.pftId == idClass.toString())].checkOffer = true;
        }
        else {
          print('type:${type}');

          print('');
        }
        Utils.showToast('Đã đề nghị');
      } else {
        Utils.showToast(resultOfferTeach.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
}
