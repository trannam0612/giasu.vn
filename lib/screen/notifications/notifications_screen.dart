import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/widgets/card_notification.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyf6f6f6,
      appBar: AppBar(
        title: Text('Thông báo'),
        backgroundColor: AppColors.primary4C5BD4,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppDimens.space4),
          decoration: BoxDecoration(
              color: AppColors.whiteFFFFFF,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              )),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder:  (context, index) => CardNotification(
              title: 'Nguyễn Thu Thủy',
              content: 'đã mời bạn dạy lớp học của cô ấy.',
              image: 'https://media.phunutoday.vn/files/content/2019/08/18/686401319426645827537293498059191086481408n-1148.jpg',
              time: '16 giờ trước',
            ),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Divider(
                thickness: 0.25,
                color: AppColors.greyAAAAAA,
              ),
            ),
            ),

          ),
      ),
      );
  }
}
