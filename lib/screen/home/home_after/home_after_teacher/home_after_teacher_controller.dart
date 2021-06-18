import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_detail_class.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_after_teacher.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_screen.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

class HomeAfterTeacherController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultHomeAfterTeacher resultHomeAfterTeacher = ResultHomeAfterTeacher();
  ResultDetailClass resultDetailClass = ResultDetailClass();
  bool checkSave = true;
  String userType = '1';
  List<DataDslh> listLHGD = [];
  List<DataDslh> listLHPB = [];

  String timeAgo(int timestamp) {
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000 * 1000);
    var now = new DateTime.now();
    var format = new DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    var time = DateTime.parse(format.format(date));
    var diff = now.difference(time);
    if (diff.inDays > 365) return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "năm" : "năm"} trước";
    if (diff.inDays > 30) return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "tháng" : "tháng"} trước";
    if (diff.inDays > 7) return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "tuần" : "tuần"} trước";
    if (diff.inDays > 0) return "${diff.inDays} ${diff.inDays == 1 ? "ngày" : "ngày"} trước";
    if (diff.inHours > 0) return "${diff.inHours} ${diff.inHours == 1 ? "giờ" : "giờ"} trước";
    if (diff.inMinutes > 0) return "${diff.inMinutes} ${diff.inMinutes == 1 ? "phút" : "phút"} trước";
    return "vừa xong";
  }

  void changeValueSave() {
    checkSave = !checkSave;
    print(checkSave);
    update();
  }

  Future<void> homeAfterTeacher(int currentPage, int limit) async {
    await Future.delayed(Duration(milliseconds: 1));
    Get.dialog(DialogLoading());
    print('homeAfterTeacher');
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.homeAfter(token, currentPage, limit);
    resultHomeAfterTeacher = resultHomeAfterTeacherFromJson(res.data);
    if (resultHomeAfterTeacher.data != null) {
      listLHGD = resultHomeAfterTeacher.data.dataClassGd.dataDslhgd;
      listLHPB = resultHomeAfterTeacher.data.dataClassPb.dataDslhpb;
      Get.back();
    } else {
      Utils.showToast('Danh sách trống!');
    }
    update();
  }

  Future<void> detailClass(int idClass) async {
    await Future.delayed(Duration(milliseconds: 1));
    Get.dialog(DialogLoading());
    ResultData res = await homeRepositories.detailClass(idClass);
    resultDetailClass = resultDetailClassFromJson(res.data);
    if(resultDetailClass.data != null) {
      Get.back();
      Get.to(InformationClassScreen());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    homeAfterTeacher(1, 10);
    update();
  }
}
