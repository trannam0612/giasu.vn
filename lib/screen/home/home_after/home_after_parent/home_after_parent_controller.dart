import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_delete_tutor_saved.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_after_parent.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_after_teacher.dart';
import 'package:giasu_vn/common/shared/data/models/result_save_tutor.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/home_after_parent_screen.dart';
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
        // Get.to(HomeAfterParentScreen());
        Get.toNamed(Routes.navigation);
      }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('X???y ra l???i. Vui l??ng th??? l???i!');
    }
    update();
  }

  Future<void> saveTutor(int idGS) async {
    print('homeAfterParent');
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.saveTutor(token, idGS);
      resultSaveTutor = resultSaveTutorFromJson(res.data);
      if (resultSaveTutor.data != null) {
        Utils.showToast('???? l??u');
      } else {
        Utils.showToast(resultSaveTutor.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('X???y ra l???i. Vui l??ng th??? l???i!');
    }
    update();
  }

  Future<void> deleteTutorSaved(int idGS) async {
    print('homeAfterParent');
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.deleteTutorSaved(token, idGS);
      resultDeleteTutorSaved = resultDeleteTutorSavedFromJson(res.data);
      if (resultDeleteTutorSaved.data != null) {
        Utils.showToast('???? b??? l??u');
      } else {
        Utils.showToast(resultSaveTutor.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('X???y ra l???i. Vui l??ng th??? l???i!');
    }
    update();
  }
}
