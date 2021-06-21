import 'package:dio/dio.dart';
import 'package:giasu_vn/common/shared/data/http/address.dart';
import 'package:giasu_vn/common/shared/data/http/api.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';

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
}
