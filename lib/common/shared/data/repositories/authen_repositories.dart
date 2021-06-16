import 'dart:io';

// import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import 'package:giasu_vn/common/shared/data/http/address.dart';
import 'package:giasu_vn/common/shared/data/http/api.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';

import 'package:http_parser/http_parser.dart';

//
class AuthenticationRepositories {
  Future<ResultData> login(String email, String pass) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'email': email,
      'password': pass,
    };

    ResultData rest = await httpManager.netFetch(Address.LOGIN, body, header, Options(method: 'post'));

    return rest;
  }
}
