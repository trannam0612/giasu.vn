import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_accept_offer.dart';
import 'package:giasu_vn/common/shared/data/models/result_refuse_offer.dart';
import 'package:giasu_vn/common/shared/data/models/result_tutor_delete_offer.dart';
import 'package:giasu_vn/common/shared/data/models/result_tutor_invited.dart';
import 'package:giasu_vn/common/shared/data/models/result_tutor_offered_teach.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:sp_util/sp_util.dart';

class ListTeacherSuggestController extends GetxController {
  HomeRepositories homeRepositories = HomeRepositories();
  List<ListGsdd> listGSDD = [];
  ResultTutorOfferedTeach resultTutorOfferedTeach = ResultTutorOfferedTeach();
  ResultRefuseOffer resultRefuseOffer = ResultRefuseOffer();
  ResultAcceptOffer resultAcceptOffer = ResultAcceptOffer();
  ResultTutorDeleteOffer resultTutorDeleteOffer = ResultTutorDeleteOffer();

  Future<void> tutorOfferedTeach(int currentPage, int limit) async {
    print('invitedTutor');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.tutorOfferedTeach(token, currentPage, limit);
      resultTutorOfferedTeach = resultTutorOfferedTeachFromJson(res.data);
      if (resultTutorOfferedTeach.data != null) {
        // Get.back();
        if (resultTutorOfferedTeach.data.listGsdd.isNotEmpty) {
          for (int i = 0; i < resultTutorOfferedTeach.data.listGsdd.length; i++) {
            listGSDD.add(resultTutorOfferedTeach.data.listGsdd[i]);
          }
        } else {
          Utils.showToast('Hết');
        }
      } else {
        // Get.back();
        Utils.showToast(resultTutorOfferedTeach.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> refuseOffer(int idGS, int idLop) async {
    print('refuseOffer');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.refuseOffer(token, idGS, idLop);
      resultRefuseOffer = resultRefuseOfferFromJson(res.data);
      if (resultRefuseOffer.data != null) {
        // Get.back();
        Utils.showToast('Đã từ chối');
      } else {
        // Get.back();
        Utils.showToast(resultRefuseOffer.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> acceptOffer(int idGS, int idLop) async {
    print('acceptOffer');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.acceptOffer(token, idGS, idLop);
      resultAcceptOffer = resultAcceptOfferFromJson(res.data);
      if (resultAcceptOffer.data != null) {
        // Get.back();
        Utils.showToast('Đã đồng ý');
      } else {
        // Get.back();
        Utils.showToast(resultAcceptOffer.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }

  Future<void> tutorDeleteOffer(int idGS, int idLop) async {
    print('tutorDeleteOffer');
    // await Future.delayed(Duration(milliseconds: 1));
    // Get.dialog(DialogLoading());
    try {
      String token = SpUtil.getString(ConstString.token);
      ResultData res = await homeRepositories.tutorDeleteOffer(token, idGS, idLop);
      resultTutorDeleteOffer = resultTutorDeleteOfferFromJson(res.data);
      if (resultTutorDeleteOffer.data != null) {
        // Get.back();
        Utils.showToast('Đã Xoá');
      } else {
        // Get.back();
        Utils.showToast(resultTutorDeleteOffer.error.message);
      }
    } catch (e) {
      print(e);
      Utils.showToast('Xảy ra lỗi. Vui lòng thử lại!');
    }
    update();
  }
}
