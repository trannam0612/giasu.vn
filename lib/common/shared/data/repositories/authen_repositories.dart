import 'dart:io';

// import'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:giasu_vn/common/shared/data/http/address.dart';
import 'package:giasu_vn/common/shared/data/http/api.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';

import 'package:http_parser/http_parser.dart';

//
class AuthenticationRepositories {
  Future<ResultData> checkMailGS(String email) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'email': email,
    };

    ResultData rest = await httpManager.netFetch(Address.check_mail_gs, body, header, Options(method: 'post'));

    return rest;
  }Future<ResultData> checkMailPH(String email) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'email': email,
    };

    ResultData rest = await httpManager.netFetch(Address.check_mail_ph, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> checkToken(String token) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'token': token,
    };

    ResultData rest = await httpManager.netFetch(Address.check_token, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> loginParent(String email, String pass) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'email': email,
      'password': pass,
    };

    ResultData rest = await httpManager.netFetch(Address.LOGIN_PARENT, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> loginTeacher(String email, String pass) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'email': email,
      'password': pass,
    };

    ResultData rest = await httpManager.netFetch(Address.LOGIN_TEACHER, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> listCitySubject() async {
    ResultData rest = await httpManager.netFetch(Address.list_city_subject, null, null, Options(method: 'get'));

    return rest;
  }

  Future<ResultData> listDistrict(int idCity) async {
    ResultData rest = await httpManager.netFetch(Address.detail_city(idCity), null, null, Options(method: 'get'));
    return rest;
  }

  Future<ResultData> listDetailSubject(String idSubject) async {
    ResultData rest = await httpManager.netFetch(Address.detail_subject(idSubject), null, null, Options(method: 'get'));
    return rest;
  }

  Future<ResultData> registerParent(String email, String newPass, String retypePassword, File avatar, String name, String phone, int gender,
      String birthDay, int city, int county, String address, String aboutUs) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    String fileName = avatar.path.split('/').last;

    Map<String, dynamic> body = {
      'ugs_email': email,
      'ugs_password': newPass,
      'ugs_retype_password': retypePassword,
      'ugs_avatar': await MultipartFile.fromFile(
        avatar.path,
        filename: fileName,
        contentType: new MediaType("image", "jpeg"),
      ),
      'ugs_name': name,
      'ugs_phone': phone,
      'ugs_gender': gender,
      'ugs_birthday': birthDay,
      'ugs_city': city,
      'ugs_county': county,
      'ugs_address': address,
      'ugs_about_us': aboutUs,
    };

    ResultData rest = await httpManager.netFetch(Address.REGISTER_PARENT, body, null, Options(method: 'post'), isFormData: true);

    return rest;
  }

  Future<ResultData> verifyRegister(String token, String otp) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {"token": token, "otp_user": otp};
    ResultData rest = await httpManager.netFetch(Address.verify_register, body, header, Options(method: 'post'));
    return rest;
  }

  Future<ResultData> newPasswordForgot(
    String token,
    String password,
    String retypePassword,
  ) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      "token": token,
      "password": password,
      "retype_password": retypePassword,
    };
    ResultData rest = await httpManager.netFetch(Address.forgot_password, body, header, Options(method: 'post'));
    return rest;
  }

  Future<ResultData> changePassword(
    String token,
    String oldPassword,
    String newPassword,
    String renewPassword,
  ) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      "token": token,
      "old_password": oldPassword,
      "new_password": newPassword,
      "renew_password": renewPassword,
    };
    ResultData rest = await httpManager.netFetch(Address.change_password, body, header, Options(method: 'post'));
    return rest;
  }

  Future<ResultData> verifyForgotPassword(String token, String otp) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {"token": token, "otp_user": otp};
    ResultData rest = await httpManager.netFetch(Address.verify_password, body, header, Options(method: 'post'));
    return rest;
  }

  Future<ResultData> reSendOTPRegister(String email) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {"email": email};
    ResultData rest = await httpManager.netFetch(Address.send_back_otp, body, header, Options(method: 'post'));
    return rest;
  }

  Future<ResultData> mailForgotPassword(String email) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {"email": email};
    ResultData rest = await httpManager.netFetch(Address.mail_forgot_password, body, header, Options(method: 'post'));
    return rest;
  }

  Future<ResultData> registerTeacher(
      String phone,
      String email,
      String newPass,
      String retypePassword,
      File avatar,
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
    String fileName = avatar.path.split('/').last;
    Map<String, dynamic> body = {
      'ugs_phone': phone,
      'ugs_email': email,
      'ugs_password': newPass,
      'ugs_retype_password': retypePassword,
      'ugs_avatar': await MultipartFile.fromFile(
        avatar.path,
        filename: fileName,
        contentType: new MediaType("image", "jpeg"),
      ),
      'ugs_name': name,
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
      'ugs_experience_year': experienceYear,
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

    ResultData rest = await httpManager.netFetch(Address.REGISTER_TEACHER, body, null, Options(method: 'post'), isFormData: true);

    return rest;
  }
}
