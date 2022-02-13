import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_change_status_post.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_class_post.dart';
import 'package:giasu_vn/common/shared/data/models/result_refuse_offer.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/post_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:sp_util/sp_util.dart';

class ListPostCreatedController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  PostRepositories postRepositories = PostRepositories();
  List<ListClass> listClassPosted = [];
  ResultListClassPosted resultListClassPosted = ResultListClassPosted();
  ResultChangeStatusPost resultChangeStatusPost = ResultChangeStatusPost();
  String statusPost;

  void changeStatusPostLocal(int index) {
    listClassPosted[index].trangthaiLop = listClassPosted[index].trangthaiLop == '1' ? '0' : '1';
    update();
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
            listClassPosted.add(resultListClassPosted.data.listClass[i]);
          }
        } else {
          Utils.showToast('Hết');
        }
        print(resultListClassPosted.data.listClass.map((e) => e.trangthaiLop));
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

  Future<void> changeStatusPost(int id, int status) async {
    print('changeStatusPost');
    Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await postRepositories.changeStatusPost(token, id, status);
      resultChangeStatusPost = resultChangeStatusPostFromJson(res.data);
      if (resultChangeStatusPost.data != null) {
        listClassPosted.where((element) => element.pftId ==id.toString()).first.trangthaiLop = status.toString();
        Get.back();
        Utils.showToast(resultChangeStatusPost.data.message);
      } else {
        Get.back();
        Utils.showToast(resultChangeStatusPost.error.message);
      }
    } catch (e) {
      Get.back();
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
}
