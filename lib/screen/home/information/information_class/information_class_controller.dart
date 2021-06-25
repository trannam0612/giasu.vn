import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_detail_class.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_controller.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_screen.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:sp_util/sp_util.dart';

class InformationClassController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  HomeAfterTeacherController homeAfterTeacherController = Get.put(HomeAfterTeacherController());
  ResultDetailClass resultDetailClass = ResultDetailClass();
  bool accepted = false;

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
    // TODO: implement onInit
    super.onInit();
    
  }

  Future<void> detailClass(int idClass, int type) async {
    await Future.delayed(Duration(milliseconds: 1));
    Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.detailClass(token,idClass);
    resultDetailClass = resultDetailClassFromJson(res.data);
    if (resultDetailClass.data != null) {
      listbuoiday[0].sang = resultDetailClass.data.data.lichday.st2;
      listbuoiday[0].chieu = resultDetailClass.data.data.lichday.ct2;
      listbuoiday[0].toi = resultDetailClass.data.data.lichday.tt2;
      listbuoiday[1].sang = resultDetailClass.data.data.lichday.st3;
      listbuoiday[1].chieu = resultDetailClass.data.data.lichday.ct3;
      listbuoiday[1].toi = resultDetailClass.data.data.lichday.tt3;
      listbuoiday[2].sang = resultDetailClass.data.data.lichday.st4;
      listbuoiday[2].chieu = resultDetailClass.data.data.lichday.ct4;
      listbuoiday[2].toi = resultDetailClass.data.data.lichday.tt4;
      listbuoiday[3].sang = resultDetailClass.data.data.lichday.st5;
      listbuoiday[3].chieu = resultDetailClass.data.data.lichday.ct5;
      listbuoiday[3].toi = resultDetailClass.data.data.lichday.tt5;
      listbuoiday[4].sang = resultDetailClass.data.data.lichday.st6;
      listbuoiday[4].chieu = resultDetailClass.data.data.lichday.ct6;
      listbuoiday[4].toi = resultDetailClass.data.data.lichday.tt6;
      listbuoiday[5].sang = resultDetailClass.data.data.lichday.st7;
      listbuoiday[5].chieu = resultDetailClass.data.data.lichday.ct7;
      listbuoiday[5].toi = resultDetailClass.data.data.lichday.tt7;
      listbuoiday[6].sang = resultDetailClass.data.data.lichday.scn;
      listbuoiday[6].chieu = resultDetailClass.data.data.lichday.ccn;
      listbuoiday[6].toi = resultDetailClass.data.data.lichday.tcn;
      Get.back();
      Get.to(InformationClassScreen(
        type: type,
      ));
    }
    update();
  }


}