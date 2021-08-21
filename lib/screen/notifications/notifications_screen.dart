import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/navigation/navigation_controller.dart';
import 'package:giasu_vn/screen/notifications/notification_controller.dart';
import 'package:giasu_vn/widgets/card_notification.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  NotificationController notificationController = Get.find();
  NavigationController navigationController = Get.find();

  @override
  void initState() {
    notificationController.notification();
    // TODO: implement initState
    super.initState();
  }

  String timeAgo(int timestamp) {
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000000);
    var now = new DateTime.now();
    var format = new DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    var time = DateTime.parse(format.format(date));
    var diff = now.difference(time);
    if (diff.inDays > 365) return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "năm" : "năm"} trước";
    if (diff.inDays > 30) return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "tháng" : "tháng"} trước";
    if (diff.inDays > 7) return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "tuần" : "tuần"} trước";
    if (diff.inDays > 0) return "${diff.inDays} ${diff.inDays == 1 ? "ngày" : "ngày"} trước";
    if (diff.inHours > 0) return "${diff.inHours} ${diff.inHours == 1 ? "giờ" : "giờ"} trước";
    if (diff.inMinutes > 0) return "${diff.inMinutes} ${diff.inMinutes == 1 ? "phút" : "phút"} trước";
    return "vừa xong";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyf6f6f6,
      appBar: AppBar(
        title: Text('Thông báo'),
        backgroundColor: AppColors.primary4C5BD4,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            Images.ic_arrow_left_iphone,
            color: AppColors.whiteFFFFFF,
          ),
          onPressed: () {
            navigationController.changePage(0);
          },
        ),
      ),
      body: GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: AppDimens.space4),
            decoration: BoxDecoration(
                color: AppColors.whiteFFFFFF,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                )),
            child: controller.resultNotification.data != null
                ? controller.resultNotification.data.dataNoti.isNotEmpty
                    ? ListView.separated(
                        shrinkWrap: true,
                        itemCount: controller.resultNotification.data.dataNoti.length,
                        itemBuilder: (context, index) => CardNotification(
                          buttonAgree: () {
                            controller.resultNotification.data.dataNoti[index].type == 1
                                ? controller.acceptInviteTeach(int.parse(controller.resultNotification.data.dataNoti[index].idClass))
                                : controller.acceptOffer(int.parse(controller.resultNotification.data.dataNoti[index].ugsGs), int.parse(controller.resultNotification.data.dataNoti[index].idClass));
                            controller.notification();
                          },
                          buttonRefuse: () {
                            controller.resultNotification.data.dataNoti[index].type == 1
                                ? controller.refuseInviteTeach(int.parse(controller.resultNotification.data.dataNoti[index].idClass))
                                : controller.refuseOffer(int.parse(controller.resultNotification.data.dataNoti[index].ugsGs), int.parse(controller.resultNotification.data.dataNoti[index].idClass));
                            controller.notification();
                          },
                          checkButton: controller.resultNotification.data.dataNoti[index].type,
                          title: controller.resultNotification.data.dataNoti[index].ugsName,
                          content: controller.resultNotification.data.dataNoti[index].content,
                          image: controller.resultNotification.data.dataNoti[index].ugsAvatar,
                          time: timeAgo(int.parse(controller.resultNotification.data.dataNoti[index].notiDate)),
                        ),
                        separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Divider(
                            thickness: 0.25,
                            color: AppColors.greyAAAAAA,
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          'Bạn không có thông báo nào!',
                          style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                        ),
                      )
                : Container(
                    width: AppDimens.width,
                    height: AppDimens.height,
                    alignment: Alignment.center,
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: AppColors.whiteFFFFFF,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
