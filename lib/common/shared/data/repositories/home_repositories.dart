import 'package:dio/dio.dart';
import 'package:giasu_vn/common/shared/data/http/address.dart';
import 'package:giasu_vn/common/shared/data/http/api.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';

class HomeRepositories {
  Future<ResultData> homeAfter(String token, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'token': token != null ? token : '',
      'current_page': currentPage,
      'limit' : limit
    };

    ResultData rest = await httpManager.netFetch(Address.HOME, body, header, Options(method: 'post'));

    return rest;
  }
  Future<ResultData> invitedTutor(String token, int currentpPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'current_page': currentpPage, 'limit': limit};

    ResultData rest = await httpManager.netFetch(Address.TUTOR_INVITED, body, header, Options(method: 'post'));

    return rest;
  }
  Future<ResultData> tutorOfferedTeach(String token, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'current_page': currentPage, 'limit': limit};

    ResultData rest = await httpManager.netFetch(Address.TUTOR_OFFERED_TEACH, body, header, Options(method: 'post'));

    return rest;
  }
  Future<ResultData> listClassPost(String token, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'current_page': currentPage, 'limit': limit};

    ResultData rest = await httpManager.netFetch(Address.LIST_CLASS_POST, body, header, Options(method: 'post'));

    return rest;
  }
  Future<ResultData> tutorSaved(String token, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'current_page': currentPage, 'limit': limit};

    ResultData rest = await httpManager.netFetch(Address.TUTOR_SAVED, body, header, Options(method: 'post'));

    return rest;
  }

}