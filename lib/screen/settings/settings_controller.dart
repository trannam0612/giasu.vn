import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_parent.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_teaacher.dart';
import 'package:giasu_vn/common/shared/data/repositories/user_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:sp_util/sp_util.dart';

class SettingsController extends GetxController {
  UserRepositories userRepositories = UserRepositories();

  bool isSwitchedNotification = false;
  bool isSwitchedMessage = false;
  bool isSwitchedVibrate = false;
  String user;

  @override
  void onInit() {
    user = SpUtil.getString(ConstString.USER_TYPE);
    print(user);
    getInfoParent();
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
    // Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await userRepositories.getInfoParent(token);
    ResultGetInfoParent resultGetInfoParent = resultGetInfoParentFromJson(res.data);
    if (resultGetInfoParent.data != null) {
      // Get.back();
      Utils.showToast(resultGetInfoParent.data.message);
      // urlAvatar = resultGetInfoParent.data.data.ugsAvatar;
      // fullName.text = resultGetInfoParent.data.data.ugsName;
      // phone.text = resultGetInfoParent.data.data.ugsPhone;
      // gender = resultGetInfoParent.data.data.ugsGender;
      // dateTime.text = resultGetInfoParent.data.data.ugsBrithday;
      // provincial.text = resultGetInfoParent.data.data.citName;
      // address.text = resultGetInfoParent.data.data.ugsAddress;
    } else {
      // Get.back();
      Utils.showToast(resultGetInfoParent.error.message);
    }
    update();
  }

  Future<void> getInfoTeacher() async {
    Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await userRepositories.getInfoTeacher(token);
    ResultGetInfoTeacher resultGetInfoTeacher = resultGetInfoTeacherFromJson(res.data);
    if (resultGetInfoTeacher.data != null) {
      Get.back();
      Utils.showToast(resultGetInfoTeacher.data.message);
      // urlAvatar = resultGetInfoTeacher.data.infoTutor.ugsAvatar;
      // print(resultGetInfoTeacher.data.infoTutor.ugsBrithday);
      // fullName.text = resultGetInfoTeacher.data.infoTutor.ugsName;
      // phone.text = resultGetInfoTeacher.data.infoTutor.ugsPhone;
      // selectedGender = resultGetInfoTeacher.data.infoTutor.ugsGender;
      // dateTime.text = resultGetInfoTeacher.data.infoTutor.ugsBrithday;
      // selectedMarriage = resultGetInfoTeacher.data.infoTutor.ugsMarriage;
      // provincial.text = resultGetInfoTeacher.data.infoTutor.citNameGs;
      // address.text = resultGetInfoTeacher.data.infoTutor.ugsAddress;
      // numberYearExp.text = resultGetInfoTeacher.data.infoTutor.ugsExperence;
      // titleExp.text = resultGetInfoTeacher.data.infoTutor.ugsTitle;
      // timeExpStart.text = resultGetInfoTeacher.data.infoTutor.ugsYearStart;
      // timeExpEnd.text = resultGetInfoTeacher.data.infoTutor.ugsYearEnd;
      // informationExp.text = resultGetInfoTeacher.data.infoTutor.ugsJobDescription;
      // school.text = resultGetInfoTeacher.data.infoTutor.ugsSchool;
      // prize.text = resultGetInfoTeacher.data.infoTutor.ugsAchievements;
      // company.text = resultGetInfoTeacher.data.infoTutor.ugsWorkplace;
      // information.text = resultGetInfoTeacher.data.infoTutor.ugsAboutUs;
      // selectedKieuGS = resultGetInfoTeacher.data.infoTutor.nametype;
      // listSubjectSelect = resultGetInfoTeacher.data.infoTutor.asDetail;
      // listSubjectSelectTopic = resultGetInfoTeacher.data.infoTutor.asDetail;
      // selectedClass = resultGetInfoTeacher.data.infoTutor.ctName;
      // selectedFormTeaching = resultGetInfoTeacher.data.infoTutor.ctName;
      // areaTeaching.text = resultGetInfoTeacher.data.infoTutor.citName;
      // listDistrictSelect = resultGetInfoTeacher.data.infoTutor.citDetail;
      //
      // listbuoiday[0].sang = resultGetInfoTeacher.data.lichday.st2;
      // listbuoiday[0].chieu = resultGetInfoTeacher.data.lichday.ct2;
      // listbuoiday[0].toi = resultGetInfoTeacher.data.lichday.tt2;
      // listbuoiday[1].sang = resultGetInfoTeacher.data.lichday.st3;
      // listbuoiday[1].chieu = resultGetInfoTeacher.data.lichday.ct3;
      // listbuoiday[1].toi = resultGetInfoTeacher.data.lichday.tt3;
      // listbuoiday[2].sang = resultGetInfoTeacher.data.lichday.st4;
      // listbuoiday[2].chieu = resultGetInfoTeacher.data.lichday.ct4;
      // listbuoiday[2].toi = resultGetInfoTeacher.data.lichday.tt4;
      // listbuoiday[3].sang = resultGetInfoTeacher.data.lichday.st5;
      // listbuoiday[3].chieu = resultGetInfoTeacher.data.lichday.ct5;
      // listbuoiday[3].toi = resultGetInfoTeacher.data.lichday.tt5;
      // listbuoiday[4].sang = resultGetInfoTeacher.data.lichday.st6;
      // listbuoiday[4].chieu = resultGetInfoTeacher.data.lichday.ct6;
      // listbuoiday[4].toi = resultGetInfoTeacher.data.lichday.tt6;
      // listbuoiday[5].sang = resultGetInfoTeacher.data.lichday.st7;
      // listbuoiday[5].chieu = resultGetInfoTeacher.data.lichday.ct7;
      // listbuoiday[5].toi = resultGetInfoTeacher.data.lichday.tt7;
      // listbuoiday[6].sang = resultGetInfoTeacher.data.lichday.scn;
      // listbuoiday[6].chieu = resultGetInfoTeacher.data.lichday.ccn;
      // listbuoiday[6].toi = resultGetInfoTeacher.data.lichday.tcn;
      // // provincial.text = resultGetInfoTeacher.data.data.citName;
      // // address.text = resultGetInfoTeacher.data.data.ugsAddress;
      // Get.to(UpdateInfoTeacherStep1Screen());
    } else {
      Get.back();
      Utils.showToast(resultGetInfoTeacher.error.message);
    }
    update();
  }
}
