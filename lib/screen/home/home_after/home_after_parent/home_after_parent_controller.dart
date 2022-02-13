import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_delete_tutor_saved.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_after_parent.dart';
import 'package:giasu_vn/common/shared/data/models/result_save_tutor.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:sp_util/sp_util.dart';

class HomeAfterParentController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultHomeAfterParent resultHomeAfterParent = ResultHomeAfterParent();
  ResultSaveTutor resultSaveTutor = ResultSaveTutor();

  ResultDeleteTutorSaved resultDeleteTutorSaved = ResultDeleteTutorSaved();
  bool checkSave;
  List<DataDsgs> listGSGD = [];
  List<DataDsgs> listGSPB = [];

  @override
  void onInit() {
    super.onInit();
  }

  void changeValueSave() {
    checkSave = !checkSave;
    update();
  }

  Future<void> homeAfterParent(int currentPage, int limit) async {
    print('homeAfterParent');
    await Future.delayed(Duration(milliseconds: 1));
    Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.homeAfter(token, currentPage, limit);
      resultHomeAfterParent = resultHomeAfterParentFromJson(res.data);
      if (resultHomeAfterParent.data != null) {
        print('resultHomeAfterParent.data.tindang');
        print(resultHomeAfterParent.data.tindang);
        await SpUtil.putString(ConstString.NUMBER_POST, resultHomeAfterParent.data.tindang);

        Get.back();
        listGSGD = resultHomeAfterParent.data.dataDsgsgd;
        listGSPB = resultHomeAfterParent.data.dataDsgspb;
        Get.toNamed(Routes.navigation);
      }
    } catch (e) {
      print(e);
      print("e22222: ${e.toString()}");
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<bool> saveTutor(int idGS) async {
    print('saveTutor');
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.saveTutor(token, idGS);
      resultSaveTutor = resultSaveTutorFromJson(res.data);
      if (resultSaveTutor.data != null) {
        Utils.showToast('Đã lưu');
        return true;
      } else {
        Utils.showToast(resultSaveTutor.error.message);
        return false;
      }
    } catch (e) {
      print(e);
      return false;

      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<bool> deleteTutorSaved(int idGS) async {
    print('deleteTutorSaved');
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.deleteTutorSaved(token, idGS);
      resultDeleteTutorSaved = resultDeleteTutorSavedFromJson(res.data);
      if (resultDeleteTutorSaved.data != null) {
        Utils.showToast('Đã bỏ lưu');

        return true;
      } else {
        Utils.showToast(resultSaveTutor.error.message);

        return false;
      }
    } catch (e) {
      return false;

      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
}
