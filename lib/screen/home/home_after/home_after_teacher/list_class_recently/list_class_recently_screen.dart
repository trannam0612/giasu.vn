import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/authen/login/login_controller.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_class_recently/list_class_recently_controller.dart';
import 'package:giasu_vn/screen/home/information/information_class/information_class_controller.dart';
import 'package:intl/intl.dart';

class ListClassRecentlyScreen extends StatefulWidget {
  final String title;
  final String fee;
  final String subject;
  final String address;
  final String classId;
  final String methodTeach;
  final String date;

  const ListClassRecentlyScreen({
    Key key,
    this.title = 'Tìm gia sư có kinh nghiệm trên 3 năm dạy môn hoá học lớp 10',
    this.fee = '300.000 vnđ/giờ',
    this.subject = 'Hóa học lớp 10',
    this.address = 'Thanh Xuân, Hà Nội',
    this.classId = '01234',
    this.methodTeach = 'Gặp mặt',
    this.date = '05/07/2019',
  }) : super(key: key);

  @override
  _ListClassRecentlyScreenState createState() => _ListClassRecentlyScreenState();
}

class _ListClassRecentlyScreenState extends State<ListClassRecentlyScreen> {
  String timeAgo(int timestamp) {
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000 * 1000);
    var now = new DateTime.now();
    var format = new DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    var time = DateTime.parse(format.format(date));
    var diff = now.difference(time)
    ;
    if (diff.inDays > 365) return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "năm" : "năm"} trước";
    if (diff.inDays > 30) return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "tháng" : "tháng"} trước";
    if (diff.inDays > 7) return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "tuần" : "tuần"} trước";
    if (diff.inDays > 0) return "${diff.inDays} ${diff.inDays == 1 ? "ngày" : "ngày"} trước";
    if (diff.inHours > 0) return "${diff.inHours} ${diff.inHours == 1 ? "giờ" : "giờ"} trước";
    if (diff.inMinutes > 0) return "${diff.inMinutes} ${diff.inMinutes == 1 ? "phút" : "phút"} trước";
    return "vừa xong";
  }
  String convertDate(int timestamp) {
    final df = new DateFormat('dd-MM-yyyy');
    return df.format(new DateTime.fromMillisecondsSinceEpoch(timestamp*1000));

  }
  ScrollController _controller = ScrollController();
  LoginController loginController = Get.put(LoginController());
  ListClassRecentlyController listClassRecentlyController = Get.put(ListClassRecentlyController());
  InformationClassController informationClassController = Get.put(InformationClassController());
  int i = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listClassRecentlyController.recentlyClass(1, 10);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // homeAfterController.homeParent();
        i++;
        print(i);
        listClassRecentlyController.recentlyClass(i, 10);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListClassRecentlyController>(
      init: ListClassRecentlyController(),
      builder:(controller) =>  Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Lớp học mới nhất',
            style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
          ),
          backgroundColor: AppColors.primary4C5BD4,
          elevation: 0,
          titleSpacing: 0,
          centerTitle: false,
          leading: IconButton(
            icon: SvgPicture.asset(
              Images.ic_arrow_left_iphone,
              color: AppColors.whiteFFFFFF,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.space6, vertical: AppDimens.space6),
          width: AppDimens.width,
          child: controller.listLHGDMore.isNotEmpty ? ListView.builder(
            physics: BouncingScrollPhysics(),
              controller: _controller,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => InkWell(
                onTap: () => informationClassController.detailClass(int.parse(controller.listLHGDMore[index].pftId), 0),
                child: Container(
                      margin: EdgeInsets.only(bottom: 10, right: 1),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary4C5BD4, width: 0.5),
                        borderRadius: BorderRadius.circular(AppDimens.space14),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(AppDimens.padding12),
                        width: AppDimens.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppDimens.space14),
                          color: AppColors.whiteFFFFFF,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    controller.listLHGDMore[index].pftSummary,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyles.regularW500(context, size: AppDimens.textSize18, color: AppColors.primary4C5BD4),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppDimens.space10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 7,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            Images.ic_money,
                                            width: 14,
                                            height: 14,
                                          ),
                                          SizedBox(
                                            width: AppDimens.space8,
                                          ),
                                          Text(
                                            '${controller.listLHGDMore[index].pftPrice} vnđ/${controller.listLHGDMore[index].pftMonth}',
                                            style: AppTextStyles.regular(
                                              context,
                                              size: AppDimens.textSize14,
                                            ),
                                            overflow: TextOverflow.fade,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: AppDimens.space6,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            Images.ic_book,
                                            width: 14,
                                            height: 14,
                                          ),
                                          SizedBox(
                                            width: AppDimens.space8,
                                          ),
                                          Text(
                                            controller.listLHGDMore[index].asDetailName,
                                            style: AppTextStyles.regular(
                                              context,
                                              size: AppDimens.textSize14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: AppDimens.space6,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            Images.ic_location,
                                            width: 14,
                                            height: 14,
                                          ),
                                          SizedBox(
                                            width: AppDimens.space8,
                                          ),
                                          Expanded(
                                            child: Text(
                                              '${controller.listLHGDMore[index].ctyDetail}, ${controller.listLHGDMore[index].citName}',
                                              style: AppTextStyles.regular(
                                                context,
                                                size: AppDimens.textSize14,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Ngày đăng:',
                                            style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.grey747474),
                                          ),
                                          SizedBox(
                                            width: AppDimens.space4,
                                          ),
                                          Expanded(
                                            child: Text(
                                              convertDate(int.parse(controller.listLHGDMore[index].dayPost)),
                                              style: AppTextStyles.regular(
                                                context,
                                                size: AppDimens.textSize14,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: AppDimens.space6,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Mã lớp:',
                                            style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.grey747474),
                                          ),
                                          SizedBox(
                                            width: AppDimens.space6,
                                          ),
                                          Text(
                                            controller.listLHGDMore[index].pftId,
                                            style: AppTextStyles.regular(context, size: AppDimens.textSize14),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: AppDimens.space6,
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hình thức:',
                                            style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.grey747474),
                                          ),
                                          SizedBox(
                                            width: AppDimens.space8,
                                          ),
                                          Text(
                                            controller.listLHGDMore[index].pftForm,
                                            style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.primary4C5BD4),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
              itemCount: controller.listLHGDMore.length) : Center(
            child: Text('Danh sách trống', style: AppTextStyles.regularW500(context, size: AppDimens.textSize20, color: AppColors.grey747474),),
          ),
        ),
      ),
    );
  }
}
