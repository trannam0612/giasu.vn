import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_home_after_teacher.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListClassRecentlyController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  ResultHomeAfterTeacher resultHomeAfterTeacher = ResultHomeAfterTeacher();
  List<DataDslh> listLHGDMore = [];

  Future<void> recentlyClass(int currentPage, int limit) async {
    print('recentlyClass');
    String token = SpUtil.getString(ConstString.token);
    try {
      ResultData res = await homeRepositories.homeAfter(token, currentPage, limit);
      resultHomeAfterTeacher = resultHomeAfterTeacherFromJson(res.data);
      if (resultHomeAfterTeacher.data != null) {
        if (resultHomeAfterTeacher.data.dataDslhpb.isNotEmpty) {
          for (int i = 0; i < resultHomeAfterTeacher.data.dataDslhgd.length; i++) {
            listLHGDMore.add(resultHomeAfterTeacher.data.dataDslhgd[i]);
          }
        } else {
          Utils.showToast('Đã hết!');
        }
      } else {}
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
}
