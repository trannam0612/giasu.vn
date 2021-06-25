import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/shared/data/http/result_data.dart';
import 'package:giasu_vn/common/shared/data/models/result_accept_invite_teach.dart';
import 'package:giasu_vn/common/shared/data/models/result_create_post.dart';
import 'package:giasu_vn/common/shared/data/models/result_get_info_post.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_district.dart';
import 'package:giasu_vn/common/shared/data/models/result_list_topic.dart';
import 'package:giasu_vn/common/shared/data/models/result_notification.dart';
import 'package:giasu_vn/common/shared/data/models/result_refuse_invite_teach.dart';
import 'package:giasu_vn/common/shared/data/repositories/authen_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/home_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/notification_repositories.dart';
import 'package:giasu_vn/common/shared/data/repositories/post_repositories.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/buoi_day.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/routes/app_pages.dart';
import 'package:giasu_vn/screen/post/update_post/updatr_post_screen.dart';
import 'package:giasu_vn/widgets/dialog_error.dart';
import 'package:giasu_vn/widgets/dialog_loading.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:sp_util/sp_util.dart';

class NotificationController extends GetxController {
  NotificationRepositories notificationRepositories = NotificationRepositories();
  ResultNotification resultNotification = ResultNotification();
  HomeRepositories homeRepositories = HomeRepositories();
  ResultAcceptInviteTeach resultAcceptInviteTeach = ResultAcceptInviteTeach();
  ResultRefuseInviteTeach resultRefuseInviteTeach = ResultRefuseInviteTeach();

  Future<void> notification() async {
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await notificationRepositories.notification(token);
    resultNotification = resultNotificationFromJson(res.data);
    if (resultNotification.data != null) {
      Utils.showToast(resultNotification.data.message);
    } else {
      Utils.showToast(resultNotification.error.message);
    }
    update();
  }

  Future<void> acceptInviteTeach(int idLop) async {
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.acceptInviteTeach(token, idLop);
    resultAcceptInviteTeach = resultAcceptInviteTeachFromJson(res.data);
    if (resultAcceptInviteTeach.data != null) {
      Utils.showToast(resultAcceptInviteTeach.data.message);
    } else {
      Utils.showToast(resultAcceptInviteTeach.error.message);
    }
    update();
  }

  Future<void> refuseInviteTeach(int idLop) async {
    String token = SpUtil.getString(ConstString.token);
    ResultData res = await homeRepositories.refuseInviteTeach(token, idLop);
    resultRefuseInviteTeach = resultRefuseInviteTeachFromJson(res.data);
    if (resultRefuseInviteTeach.data != null) {
      Utils.showToast(resultRefuseInviteTeach.data.message);
    } else {
      Utils.showToast(resultRefuseInviteTeach.error.message);
    }
    update();
  }
}
