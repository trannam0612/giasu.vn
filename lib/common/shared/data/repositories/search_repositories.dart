import 'package:dio/dio.dart';
import 'package:giasu_vn/common/shared/data/http/address.dart';
import 'package:giasu_vn/common/shared/data/http/api.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';

class SearchRepositories {
  // ignore: missing_return
  Future<ResultData> searchParent(String token,int tt, int idSubject, int idClass, int idProvincial, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'token': token,
      'tt': tt,
      'checkbox_as': idSubject,
      'checkbox_ct': idClass,
      'checkbox_city': idProvincial,
      'current_page': currentPage,
      'limit': limit,
    };
    ResultData rest = await httpManager.netFetch(Address.search_list_teacher, body, header, Options(method: 'post'));
    return rest;
  }

  Future<ResultData> searchClass(int tt, int idSubject, int idClass, int idProvincial, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'tt': tt,
      'checkbox_as': idSubject,
      'checkbox_ct': idClass,
      'checkbox_city': idProvincial,
      'current_page': currentPage,
      'limit': limit,
    };
    ResultData rest = await httpManager.netFetch(Address.search_list_class, body, header, Options(method: 'post'));
    return rest;
  }
}
