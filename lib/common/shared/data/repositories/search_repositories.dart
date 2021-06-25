import 'package:dio/dio.dart';
import 'package:giasu_vn/common/shared/data/http/address.dart';
import 'package:giasu_vn/common/shared/data/http/api.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';

class SearchRepositories {
  // ignore: missing_return
  Future<ResultData> searchParent(int idCity, int idDistrict, int idSubject, int idForm, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'city': idCity,
      'country': idDistrict,
      'subject': idSubject,
      'form': idForm,
      'current_page': currentPage,
      'limit': limit,
    };
    ResultData rest = await httpManager.netFetch(Address.searchParent(idCity, idDistrict, idSubject, idForm, currentPage, limit), body, header, Options(method: 'post'));
    return rest;
  }
}
