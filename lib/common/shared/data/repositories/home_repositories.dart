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
    Map<String, dynamic> body = {'token': token != null ? token : '', 'current_page': currentPage, 'limit': limit};

    ResultData rest = await httpManager.netFetch(Address.HOME, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> invitedTutor(String token, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'current_page': currentPage, 'limit': limit};

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

  Future<ResultData> parentInvited(String token, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'current_page': currentPage, 'limit': limit};

    ResultData rest = await httpManager.netFetch(Address.PARENT_INVITED, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> parentSaved(String token, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'current_page': currentPage, 'limit': limit};

    ResultData rest = await httpManager.netFetch(Address.PARENT_SAVED, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> acceptInviteTeach(String token, int idLop) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_lop': idLop};

    ResultData rest = await httpManager.netFetch(Address.ACCEPT_INVITE_TEACH, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> refuseInviteTeach(String token, int idLop) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_lop': idLop};

    ResultData rest = await httpManager.netFetch(Address.REFUSE_INVITE_TEACH, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> classOffered(String token, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'current_page': currentPage, 'limit': limit};

    ResultData rest = await httpManager.netFetch(Address.CLASS_OFFERED, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> deleteClassOffered(String token, int idLop) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_lop': idLop};

    ResultData rest = await httpManager.netFetch(Address.DELETE_CLASS_OFFERED, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> classAccepted(String token, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'current_page': currentPage, 'limit': limit};

    ResultData rest = await httpManager.netFetch(Address.CLASS_ACCEPTED, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> deleteClassAccepted(String token, int idLop) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_lop': idLop};

    ResultData rest = await httpManager.netFetch(Address.DELETE_CLASS_ACCEPTED, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> classSaved(String token, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'current_page': currentPage, 'limit': limit};

    ResultData rest = await httpManager.netFetch(Address.CLASS_SAVED, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> tutorFromFilterPoint(String token, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'current_page': currentPage, 'limit': limit};

    ResultData rest = await httpManager.netFetch(Address.TUTOR_FROM_FILTER_POINT, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> tutorTeaching(String token, int currentPage, int limit) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'current_page': currentPage, 'limit': limit};

    ResultData rest = await httpManager.netFetch(Address.TUTOR_TEACHING, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> saveClass(String token, int idClass) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_class': idClass};

    ResultData rest = await httpManager.netFetch(Address.SAVE_CLASS, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> deleteClassSaved(String token, int idClass) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_lop': idClass};

    ResultData rest = await httpManager.netFetch(Address.DELETE_CLASS_SAVED, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> offerTeach(String token, int idClass) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_lop': idClass};

    ResultData rest = await httpManager.netFetch(Address.OFFER_TEACH, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> saveTutor(String token, int idGS) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_gs': idGS};

    ResultData rest = await httpManager.netFetch(Address.SAVE_TUTOR, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> deleteTutorSaved(String token, int idGS) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_gs': idGS};

    ResultData rest = await httpManager.netFetch(Address.DELETE_TUTOR_SAVED, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> refuseOffer(String token, int idGS, int idLop) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_gs': idGS, 'id_lop': idLop};

    ResultData rest = await httpManager.netFetch(Address.REFUSE_OFFER, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> acceptOffer(String token, int idGS, int idLop) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_gs': idGS, 'id_lop': idLop};

    ResultData rest = await httpManager.netFetch(Address.ACCEPT_OFFER, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> tutorDeleteOffer(String token, int idGS, int idLop) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_gs': idGS, 'id_lop': idLop};

    ResultData rest = await httpManager.netFetch(Address.TUTOR_DELETE_OFFER, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> inviteTeach(String token, int idLop, int idGS) async {
    Map<String, dynamic> header = {
      'accept': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    Map<String, dynamic> body = {'token': token, 'id_lop': idLop, 'id_gs': idGS};

    ResultData rest = await httpManager.netFetch(Address.INVITE_TEACH, body, header, Options(method: 'post'));

    return rest;
  }

  Future<ResultData> detailClass(int idClass) async {
    ResultData rest = await httpManager.netFetch(Address.detailClass(idClass), null, null, Options(method: 'get'));
    return rest;
  }

  Future<ResultData> detailTutor(String token, int idGS) async {
    ResultData rest = await httpManager.netFetch(Address.detailTutor(token, idGS), null, null, Options(method: 'get'));
    return rest;
  }
}
