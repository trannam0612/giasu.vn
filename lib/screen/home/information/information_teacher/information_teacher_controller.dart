import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_detail_teacher.dart';
import 'package:giasu_vn/common/shared/data/models/result_invite_teach.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_class_post.dart';
import 'package:giasu_vn/common/shared/data/models/result_minus_point.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/information_teacher_screen.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:sp_util/sp_util.dart';

import '../../../../common/utils.dart';
import '../../../../common/utils.dart';
import '../../../../common/utils.dart';

class InformationTeacherController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultListClassPosted resultListClassPosted = ResultListClassPosted();
  ResultInviteTeach resultInviteTeach = ResultInviteTeach();
  ResultDetailTeacher resultDetailTeacher = ResultDetailTeacher();
  ResultMinusPoint resultMinusPoint = ResultMinusPoint();
  List<ListClass> listPostCreated = [];
  List<buoiday> listbuoiday = [
    buoiday('Thứ 2', '1', "0", "0"),
    buoiday('Thứ 3', "0", "0", "0"),
    buoiday('Thứ 4', "0", "0", "0"),
    buoiday('Thứ 5', "0", "0", "0"),
    buoiday('Thứ 6', "0", "0", "0"),
    buoiday('Thứ 7', "0", "0", "0"),
    buoiday('CN', "0", "0", "0"),
  ];
  bool isShowed = false;
  String idClass;
  List<String> listIdClass = [];
  bool acepted = false;
  String token;
  String numberPost;

  @override
  void onInit() {
    token = SpUtil.getString(ConstString.token);
    numberPost = SpUtil.getString(ConstString.NUMBER_POST);

    // TODO: implement onInit
    super.onInit();
  }

  Future<void> classPosted(int currentPage, int limit) async {
    print('classPosted');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.listClassPost(token, currentPage, limit);
      resultListClassPosted = resultListClassPostedFromJson(res.data);
      if (resultListClassPosted.data != null) {
        // Get.back();
        if (resultListClassPosted.data.listClass.isNotEmpty) {
          for (int i = 0; i < resultListClassPosted.data.listClass.length; i++) {
            listPostCreated.add(resultListClassPosted.data.listClass[i]);
          }
        } else {
          Utils.showToast('Hết');
        }
      } else {
        // Get.back();
        Utils.showToast(resultListClassPosted.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> inviteTeach(String idLop, int idGS) async {
    print('refuseOffer');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.inviteTeach(token, idLop, idGS);
      resultInviteTeach = resultInviteTeachFromJson(res.data);
      if (resultInviteTeach.data != null) {
        Get.back();
        Utils.showToast(resultInviteTeach.data.message);
      } else {
        Get.back();
        Utils.showToast(resultInviteTeach.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  bool show = false;

  Future<void> minusPoint(int idGS) async {
    print('minusPoint');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.minusPoint(token, idGS);
      resultMinusPoint = resultMinusPointFromJson(res.data);
      if (resultMinusPoint.data != null) {
        resultDetailTeacher.data.data.dataInfo.checkMinusPoint = true;
        Utils.showToast(resultMinusPoint.data.message);
      } else {
        Utils.showToast(resultMinusPoint.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> detailTeacher(int idGS, int type) async {
    await Future.delayed(Duration(milliseconds: 1));
    Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.detailTutor(token, idGS);
      resultDetailTeacher = resultDetailTeacherFromJson(res.data);
      if (resultDetailTeacher.data != null) {
        listbuoiday[0].sang = resultDetailTeacher.data.data.lichday.st2;
        listbuoiday[0].chieu = resultDetailTeacher.data.data.lichday.ct2;
        listbuoiday[0].toi = resultDetailTeacher.data.data.lichday.tt2;
        listbuoiday[1].sang = resultDetailTeacher.data.data.lichday.st3;
        listbuoiday[1].chieu = resultDetailTeacher.data.data.lichday.ct3;
        listbuoiday[1].toi = resultDetailTeacher.data.data.lichday.tt3;
        listbuoiday[2].sang = resultDetailTeacher.data.data.lichday.st4;
        listbuoiday[2].chieu = resultDetailTeacher.data.data.lichday.ct4;
        listbuoiday[2].toi = resultDetailTeacher.data.data.lichday.tt4;
        listbuoiday[3].sang = resultDetailTeacher.data.data.lichday.st5;
        listbuoiday[3].chieu = resultDetailTeacher.data.data.lichday.ct5;
        listbuoiday[3].toi = resultDetailTeacher.data.data.lichday.tt5;
        listbuoiday[4].sang = resultDetailTeacher.data.data.lichday.st6;
        listbuoiday[4].chieu = resultDetailTeacher.data.data.lichday.ct6;
        listbuoiday[4].toi = resultDetailTeacher.data.data.lichday.tt6;
        listbuoiday[5].sang = resultDetailTeacher.data.data.lichday.st7;
        listbuoiday[5].chieu = resultDetailTeacher.data.data.lichday.ct7;
        listbuoiday[5].toi = resultDetailTeacher.data.data.lichday.tt7;
        listbuoiday[6].sang = resultDetailTeacher.data.data.lichday.scn;
        listbuoiday[6].chieu = resultDetailTeacher.data.data.lichday.ccn;
        listbuoiday[6].toi = resultDetailTeacher.data.data.lichday.tcn;
        print('resultDetailTeacher.data.data.dataInfo.ugsGender');
        print(resultDetailTeacher.data.data.dataInfo.ugsGender);
        Get.back();
        Get.to(InformationTeacherScreen(
          type: type,
        ));
      } else {
        Utils.showToast(resultDetailTeacher.error.message);
      }
    } catch (e) {
      print(e);
      Get.back();
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
}
