import 'package:get/get.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_detail_class.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/home_after_teacher_controller.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_screen.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';

class InformationClassController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  HomeAfterTeacherController homeAfterTeacherController = Get.put(HomeAfterTeacherController());

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
    listbuoiday[0].sang = homeAfterTeacherController.resultDetailClass.data.data.lichday.st2;
    listbuoiday[0].chieu = homeAfterTeacherController.resultDetailClass.data.data.lichday.ct2;
    listbuoiday[0].toi = homeAfterTeacherController.resultDetailClass.data.data.lichday.tt2;
    listbuoiday[1].sang = homeAfterTeacherController.resultDetailClass.data.data.lichday.st3;
    listbuoiday[1].chieu = homeAfterTeacherController.resultDetailClass.data.data.lichday.ct3;
    listbuoiday[1].toi = homeAfterTeacherController.resultDetailClass.data.data.lichday.tt3;
    listbuoiday[2].sang = homeAfterTeacherController.resultDetailClass.data.data.lichday.st4;
    listbuoiday[2].chieu = homeAfterTeacherController.resultDetailClass.data.data.lichday.ct4;
    listbuoiday[2].toi = homeAfterTeacherController.resultDetailClass.data.data.lichday.tt4;
    listbuoiday[3].sang = homeAfterTeacherController.resultDetailClass.data.data.lichday.st5;
    listbuoiday[3].chieu = homeAfterTeacherController.resultDetailClass.data.data.lichday.ct5;
    listbuoiday[3].toi = homeAfterTeacherController.resultDetailClass.data.data.lichday.tt5;
    listbuoiday[4].sang = homeAfterTeacherController.resultDetailClass.data.data.lichday.st6;
    listbuoiday[4].chieu = homeAfterTeacherController.resultDetailClass.data.data.lichday.ct6;
    listbuoiday[4].toi = homeAfterTeacherController.resultDetailClass.data.data.lichday.tt6;
    listbuoiday[5].sang = homeAfterTeacherController.resultDetailClass.data.data.lichday.st7;
    listbuoiday[5].chieu = homeAfterTeacherController.resultDetailClass.data.data.lichday.ct7;
    listbuoiday[5].toi = homeAfterTeacherController.resultDetailClass.data.data.lichday.tt7;
    listbuoiday[6].sang = homeAfterTeacherController.resultDetailClass.data.data.lichday.scn;
    listbuoiday[6].chieu = homeAfterTeacherController.resultDetailClass.data.data.lichday.ccn;
    listbuoiday[6].toi = homeAfterTeacherController.resultDetailClass.data.data.lichday.tcn;
  }


}