import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_parent_saved.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListParentSavedController extends GetxController {
 HomeRepositories homeRepositories = HomeRepositories();
 ResultParentSaved resultParentSaved = ResultParentSaved();
 List<ListPhdl> listPHDL = [];

 Future<void> parentSaved(int loadMore, int limit) async {
   print('parentSaved');
   // await Future.delayed(Duration(milliseconds: 1));
   // Get.dialog(DialogLoading());
   String token = SpUtil.getString(ConstString.token);
   ResultData res = await homeRepositories.parentSaved(token, loadMore, limit);
   resultParentSaved = resultParentSavedFromJson(res.data);
   if (resultParentSaved.data != null) {
     // Get.back();
     for (int i = 0; i < resultParentSaved.data.listPhdl.length; i++) {
       listPHDL.add(resultParentSaved.data.listPhdl[i]);
     }
   } else {
     Get.back();
     Utils.showToast(resultParentSaved.error.message);
   }
   update();
 }
}