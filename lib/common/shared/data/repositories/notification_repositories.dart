import 'package:dio/dio.dart';
import 'package:giasu_vn/common/shared/data/http/address.dart';
import 'package:giasu_vn/common/shared/data/http/api.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';

class NotificationRepositories {
  // ignore: missing_return
  Future<ResultData> notification(String token) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'token': token,
    };
    ResultData rest = await httpManager.netFetch(Address.notification, body, header, Options(method: 'post'));
    return rest;
  }

  Future<ResultData> deleteNotification(String token, int idNoti) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {
      'token': token,
      'id_noti': idNoti,
    };
    ResultData rest = await httpManager.netFetch(Address.delete_notification, body, header, Options(method: 'post'));
    return rest;
  }
}
