import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_parent.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_teaacher.dart';
import 'package:giasu_vn/common/shared/data/repositories/user_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
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
  List<buoiday> listbuoiday = [
    buoiday('Thứ 2', '1', "0", "0"),
    buoiday('Thứ 3', "0", "0", "0"),
    buoiday('Thứ 4', "0", "0", "0"),
    buoiday('Thứ 5', "0", "0", "0"),
    buoiday('Thứ 6', "0", "0", "0"),
    buoiday('Thứ 7', "0", "0", "0"),
    buoiday('CN', "0", "0", "0"),
  ];

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
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await userRepositories.getInfoParent(token);
      resultGetInfoParent = resultGetInfoParentFromJson(res.data);
      if (resultGetInfoParent.data != null) {
        // Get.back();
        // Utils.showToast(resultGetInfoParent.data.message);
      } else {
        // Get.back();
        Utils.showToast(resultGetInfoParent.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> getInfoTeacher() async {
    // Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await userRepositories.getInfoTeacher(token);
      resultGetInfoTeacher = resultGetInfoTeacherFromJson(res.data);
      if (resultGetInfoTeacher.data != null) {
        // Get.back();
        // Utils.showToast(resultGetInfoTeacher.data.message);
        listbuoiday[0].sang = resultGetInfoTeacher.data.lichday.st2;
        listbuoiday[0].chieu = resultGetInfoTeacher.data.lichday.ct2;
        listbuoiday[0].toi = resultGetInfoTeacher.data.lichday.tt2;
        listbuoiday[1].sang = resultGetInfoTeacher.data.lichday.st3;
        listbuoiday[1].chieu = resultGetInfoTeacher.data.lichday.ct3;
        listbuoiday[1].toi = resultGetInfoTeacher.data.lichday.tt3;
        listbuoiday[2].sang = resultGetInfoTeacher.data.lichday.st4;
        listbuoiday[2].chieu = resultGetInfoTeacher.data.lichday.ct4;
        listbuoiday[2].toi = resultGetInfoTeacher.data.lichday.tt4;
        listbuoiday[3].sang = resultGetInfoTeacher.data.lichday.st5;
        listbuoiday[3].chieu = resultGetInfoTeacher.data.lichday.ct5;
        listbuoiday[3].toi = resultGetInfoTeacher.data.lichday.tt5;
        listbuoiday[4].sang = resultGetInfoTeacher.data.lichday.st6;
        listbuoiday[4].chieu = resultGetInfoTeacher.data.lichday.ct6;
        listbuoiday[4].toi = resultGetInfoTeacher.data.lichday.tt6;
        listbuoiday[5].sang = resultGetInfoTeacher.data.lichday.st7;
        listbuoiday[5].chieu = resultGetInfoTeacher.data.lichday.ct7;
        listbuoiday[5].toi = resultGetInfoTeacher.data.lichday.tt7;
        listbuoiday[6].sang = resultGetInfoTeacher.data.lichday.scn;
        listbuoiday[6].chieu = resultGetInfoTeacher.data.lichday.ccn;
        listbuoiday[6].toi = resultGetInfoTeacher.data.lichday.tcn;
      } else {
        // Get.back();
        Utils.showToast(resultGetInfoTeacher.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
}
