import 'package:dio/dio.dart';
import 'package:giasu_vn/common/shared/data/http/address.dart';
import 'package:giasu_vn/common/shared/data/http/api.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';

class PostRepositories {
  Future<ResultData> createPost(
    String token,
    String summary,
    int form,
    int time,
    int nbStudent,
    int nbLesson,
    int gender,
    String phone,
    String address,
    String price,
    String month,
    String detail,
    int asId,
    int ctId,
    int asDetail,
    int cityId,
    int cityDetail,
    int tutorStyle,
    String lichday,
  ) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'token': token,
      'pft_summary': summary,
      'pft_form': form,
      'pft_time': time,
      'pft_nb_student': nbStudent,
      'pft_nb_lesson': nbLesson,
      'pft_gender': gender,
      'pft_phone': phone,
      'pft_address': address,
      'pft_price': price,
      'pft_month': month,
      'pft_detail': detail,
      'as_id': asId,
      'ct_id': ctId,
      'as_detail': asDetail,
      'city_id': cityId,
      'city_detail': cityDetail,
      'tutor_style': tutorStyle,
      'lichday': lichday,
    };

    ResultData rest = await httpManager.netFetch(Address.created_class_post, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> updatePost(
    String token,
    int id,
    String summary,
    int form,
    int time,
    int nbStudent,
    int nbLesson,
    int gender,
    String phone,
    String address,
    String price,
    String month,
    String detail,
    int asId,
    int ctId,
    int asDetail,
    int cityId,
    int cityDetail,
    int tutorStyle,
    String lichday,
  ) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'token': token,
      'pft_id': id,
      'pft_summary': summary,
      'pft_form': form,
      'pft_time': time,
      'pft_nb_student': nbStudent,
      'pft_nb_lesson': nbLesson,
      'pft_gender': gender,
      'pft_phone': phone,
      'pft_address': address,
      'pft_price': price,
      'pft_month': month,
      'pft_detail': detail,
      'as_id': asId,
      'ct_id': ctId,
      'as_detail': asDetail,
      'city_id': cityId,
      'city_detail': cityDetail,
      // 'tutor_style': tutorStyle,
      'lichday': lichday,
    };

    ResultData rest = await httpManager.netFetch(Address.update_class_post, body, header, Options(method: 'post'));

    return rest;
  }

  // Future<ResultData> getDetailPost(int idClass) async {
  //   ResultData rest = await httpManager.netFetch(Address.detailClass(idClass), null, null, Options(method: 'get'));
  //   return rest;
  // }
}
