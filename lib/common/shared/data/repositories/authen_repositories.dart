import 'dart:io';

// import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:giasu_vn/common/shared/data/http/address.dart';
import 'package:giasu_vn/common/shared/data/http/api.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';

import 'package:http_parser/http_parser.dart';

//
class AuthenticationRepositories {
//   Future<ResultData> getListCityCarerLanguage() async {
//     ResultData rest = await httpManager.netFetch(Address.LIST_CITY_CAREER_LANGUAGE, null, null, Options(method:'get'));
//
//     return rest;
//   }
//
// //
//   Future<ResultData> login(String email, String password) async {
//     Map<String, dynamic> header = {
//      'accept':'application/json',
//      'Content-Type':'application/x-www-form-urlencoded',
//     };
//
//     Map<String, dynamic> body = {
//      'use_email': email,
//      'password': password,
//     };
//
//     ResultData rest = await httpManager.netFetch(Address.LOGIN, body, header, Options(method:'post'));
//
//     return rest;
//   }

//


  // Future<ResultData> registerTeacher(
  //   String name,
  //   String email,
  //   String password,
  //   String repass,
  //   File avatar,
  //   String phone,
  //   String birth,
  //   int sex,
  //   int cityId,
  //     String districtId,
  //   String address,
  //   int teachExpNumber,
  //   String teachSchool,
  //   String teachBranch,
  //   String teachGraduate,
  //   String teachWorkPlace,
  //   String teachInfo,
  //   String teachDescribe,
  //   String teachAchivement,
  //   String gsSubjectId,
  //   int levelClassId,
  //   String topicId,
  //   int methodTeach,
  //   int area,
  //   String luong_co_dinh,
  //   String luong_uoc_luong_start,
  //   String luong_uoc_luong_end,
  //   int monMorning,
  //   int monAfternoon,
  //   int monEverning,
  //   int tuesdayMorning,
  //   int tuesdayAfternoon,
  //   int tuesdayEverning,
  //   int wednesdayMorning,
  //   int wednesdayAfternoon,
  //   int wednesdayEverning,
  //   int thursdayMorning,
  //   int thursdayAfternoon,
  //   int thursdayEverning,
  //   int fridayMorning,
  //   int fridayAfternoon,
  //   int fridayEverning,
  //   int saturdayMorning,
  //   int saturdayAfternoon,
  //   int saturdayEverning,
  //   int sundayMorning,
  //   int sundayfternoon,
  //   int sundayEverning,
  // ) async {
  //   String fileName = avatar.path.split('/').last;
  //
  //   Map<String, dynamic> body = {
  //     'name': name,
  //     'email': email,
  //     'password': password,
  //     'repass': repass,
  //     'avatar': await MultipartFile.fromFile(
  //       avatar.path,
  //       filename: fileName,
  //       contentType: new MediaType("image", "jpeg"),
  //     ),
  //     'phone': phone,
  //     'birth': birth,
  //     'sex': sex,
  //     'cit_id': cityId,
  //     'district_id': districtId,
  //     'address': address,
  //     'teach_exp_number': teachExpNumber,
  //     'teach_school': teachSchool,
  //     'teach_branch': teachBranch,
  //     'teach_graduate': teachGraduate,
  //     'teach_work_place': teachWorkPlace,
  //     'teach_info': teachInfo,
  //     'teach_describe': teachDescribe,
  //     'teach_achivement': teachAchivement,
  //     'gs_subject_id': gsSubjectId,
  //     'level_class_id': levelClassId,
  //     'topic_id': topicId,
  //     'method_teach': methodTeach,
  //     'area': area,
  //     'luong_co_dinh': luong_co_dinh,
  //     'luong_uoc_luong_start': luong_uoc_luong_start,
  //     'luong_uoc_luong_end': luong_uoc_luong_end,
  //     'monday_morning': monMorning,
  //     'monday_afternoon': monAfternoon,
  //     'monday_everning': monEverning,
  //     'tuesday_morning': tuesdayMorning,
  //     'tuesday_afternoon': tuesdayAfternoon,
  //     'tuesday_everning': tuesdayEverning,
  //     'wednesday_morning': wednesdayMorning,
  //     'wednesday_afternoon': wednesdayAfternoon,
  //     'wednesday_everning': wednesdayEverning,
  //     'thursday_morning': thursdayMorning,
  //     'thursday_afternoon': thursdayAfternoon,
  //     'thursday_everning': thursdayEverning,
  //     'friday_morning': fridayMorning,
  //     'friday_afternoon': fridayAfternoon,
  //     'friday_everning': fridayEverning,
  //     'saturday_morning': saturdayMorning,
  //     'saturday_afternoon': saturdayAfternoon,
  //     'saturday_everning': saturdayEverning,
  //     'sunday_morning': sundayMorning,
  //     'sunday_afternoon': sundayfternoon,
  //     'sunday_everning': sundayEverning,
  //   };
  //   ResultData res = await httpManager.netFetch(Address.REGISTER_TEACHER, body, null, Options(method: 'post'),
  //       isFormData: true
  //   );
  //   return res;
  // }
}
