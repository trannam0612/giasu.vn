import 'dart:io';

import 'package:dio/dio.dart';
import 'package:giasu_vn/common/shared/data/http/address.dart';
import 'package:giasu_vn/common/shared/data/http/api.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:http_parser/http_parser.dart';

class UserRepositories {
  Future<ResultData> updateInfoParent(String token, String name, int gender, String birth, int city, String address) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'token': token,
      'ugs_name': name,
      'ugs_gender': gender,
      'ugs_birthday': birth,
      'ugs_city': city,
      'ugs_address': address,
    };

    ResultData rest = await httpManager.netFetch(Address.update_info_parent, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> updateInfoTeacher(
      String token,
      String phone,
      // File avatar,
      String name,
      int gender,
      String birthDay,
      int marriage,
      int tutorStyle,
      int classTeach,
      String school,
      String graduationYear,
      String specialized,
      int cityGs,
      int countyGs,
      String address,
      String workplace,
      String aboutUs,
      String achievements,
      // String experence,
      int experienceYear,
      String title,
      String yearStart,
      String yearEnd,
      String jobDescription,
      String asId,
      String asDetail,
      int formality,
      String unitPrice,
      int time,
      String salaryStart,
      String salaryEnd,
      int city,
      String county,
      String lichday) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    // String fileName = avatar.path.split('/').last;
    Map<String, dynamic> body = {
      'token': token,
      'ugs_phone': phone,
      'ugs_name': name,
      // 'ugs_email': email,
      // 'ugs_password': newPass,
      // 'ugs_retype_password': retypePassword,
      'ugs_gender': gender,
      'ugs_birthday': birthDay,
      'ugs_marriage': marriage,
      'ugs_tutor_style': tutorStyle,
      'ugs_class_teach': classTeach,
      'ugs_school': school,
      'ugs_graduation_year': graduationYear,
      'ugs_specialized': specialized,
      'ugs_city_gs': cityGs,
      'ugs_county_gs': countyGs,
      'ugs_address': address,
      'ugs_workplace': workplace,
      'ugs_about_us': aboutUs,
      'ugs_achievements': achievements,
      'ugs_experence': experienceYear,
      // 'ugs_experience_year': experienceYear,
      'ugs_title': title,
      'ugs_year_start': yearStart,
      'ugs_year_end': yearEnd,
      'ugs_job_description': jobDescription,
      'as_id': asId,
      'as_detail': asDetail,
      'ugs_formality': formality,
      'ugs_unit_price': unitPrice,
      'ugs_time': time,
      'ugs_salary_start': salaryStart,
      'ugs_salary_end': salaryEnd,
      'ugs_city': city,
      'ugs_county': county,
      'lichday': lichday,
    };

    ResultData rest = await httpManager.netFetch(Address.update_info_tutor, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> getInfoParent(String token) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'token': token,
    };

    ResultData rest = await httpManager.netFetch(Address.get_info_parent, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> updateAvatar(String token, File avatar) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    String fileName = avatar.path.split('/').last;
    Map<String, dynamic> body = {
      'token': token,
      'ugs_avatar': await MultipartFile.fromFile(
        avatar.path,
        filename: fileName,
        contentType: new MediaType("image", "jpeg"),
      ),
    };

    ResultData rest = await httpManager.netFetch(Address.update_avatar, body, null, Options(method: 'post'), isFormData: true);

    return rest;
  }

  Future<ResultData> getInfoTeacher(String token) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'token': token,
    };

    ResultData rest = await httpManager.netFetch(Address.get_info_teacher, body, header, Options(method: 'post'));

    return rest;
  }
}
