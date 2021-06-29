import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_parent.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_teaacher.dart';
import 'package:giasu_vn/common/shared/data/repositories/user_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/screen/navigation/navigation_controller.dart';
import 'package:giasu_vn/screen/settings/settings_screen.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:sp_util/sp_util.dart';

class SettingsController extends GetxController {
  UserRepositories userRepositories = UserRepositories();
  ResultGetInfoTeacher resultGetInfoTeacher = ResultGetInfoTeacher();
  ResultGetInfoParent resultGetInfoParent = ResultGetInfoParent();
  bool isSwitchedNotification = false;
  bool isSwitchedMessage = false;
  bool isSwitchedVibrate = false;
  String user;

  @override
  void onInit() {
    user = SpUtil.getString(ConstString.USER_TYPE);
    print(user);
    user == '1' ? getInfoParent() : getInfoTeacher();
    // TODO: implement onInit
    super.onInit();
  }

  void onChangedNotification() {
    isSwitchedNotification = !isSwitchedNotification;
    update();
  }

  void onChangedMessage() {
    isSwitchedMessage = !isSwitchedMessage;
    update();
  }

  void onChangedVibrate() {
    isSwitchedVibrate = !isSwitchedVibrate;
    update();
  }

  Future<void> getInfoParent() async {
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await userRepositories.getInfoParent(token);
    resultGetInfoParent = resultGetInfoParentFromJson(res.data);
    if (resultGetInfoParent.data != null) {
      // Get.back();
      Utils.showToast(resultGetInfoParent.data.message);
    } else {
      // Get.back();
      Utils.showToast(resultGetInfoParent.error.message);
    }
    update();
  }

  Future<void> getInfoTeacher() async {
    // Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await userRepositories.getInfoTeacher(token);
    resultGetInfoTeacher = resultGetInfoTeacherFromJson(res.data);
    if (resultGetInfoTeacher.data != null) {
      // Get.back();
      Utils.showToast(resultGetInfoTeacher.data.message);
    } else {
      // Get.back();
      Utils.showToast(resultGetInfoTeacher.error.message);
    }
    update();
  }
}
