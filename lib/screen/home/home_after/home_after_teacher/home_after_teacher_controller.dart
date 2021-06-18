import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_after_teacher.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

class HomeAfterTeacherController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultHomeAfterTeacher resultHomeAfterTeacher = ResultHomeAfterTeacher();
  bool checkSave =true;
  String userType = '1';
  List<DataDslh> listLHGD = [];
  List<DataDslh> listLHPB = [];
  String timeAgo(int timestamp) {
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000 * 1000);
    var now = new DateTime.now();
    var format = new DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    var time = DateTime.parse(format.format(date));
    var diff = now.difference(time)
    ;
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
    print('homeAfterTeacher');
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.homeAfter(token, currentPage, limit);
    resultHomeAfterTeacher = resultHomeAfterTeacherFromJson(res.data);
    if (resultHomeAfterTeacher.data != null) {
      listLHGD = resultHomeAfterTeacher.data.dataClassGd.dataDslhgd;
      listLHPB = resultHomeAfterTeacher.data.dataClassPb.dataDslhpb;
    }
    update();
  }

}