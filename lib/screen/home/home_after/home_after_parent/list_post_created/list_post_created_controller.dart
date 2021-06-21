import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_class_post.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListPostCreatedController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  List<ListClass> listClassPosted = [];
  ResultListClassPosted resultListClassPosted = ResultListClassPosted();
  Future<void> classPosted(int currentPage, int limit) async {
    print('classPosted');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.listClassPost(token, currentPage, limit);
    resultListClassPosted = resultListClassPostedFromJson(res.data);
    if (resultListClassPosted.data != null) {
      // Get.back();
      if(resultListClassPosted.data.listClass.isNotEmpty) {
        for (int i = 0; i < resultListClassPosted.data.listClass.length; i++) {
          listClassPosted.add(resultListClassPosted.data.listClass[i]);
        }
      }
      else {
        Utils.showToast('Hết');
      }
    } else {
      // Get.back();
      Utils.showToast(resultListClassPosted.error.message);
    }
    update();
  }
}