import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class ListTeacherInvitedScreen extends StatelessWidget {
  final bool saved;

  const ListTeacherInvitedScreen({Key key, this.saved = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.greyf6f6f6,
      appBar: AppBar(
        title: Text(
          'Gia sư đã mời dạy',
          style: AppTextStyles.regularW500(context,
              size: AppDimens.textSize24,
              lineHeight: AppDimens.textSize28,
              color: AppColors.whiteFFFFFF),
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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.symmetric(
              horizontal: AppDimens.space6, vertical: AppDimens.space6),
          child: SizedBox(
            height: height * 0.14,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Positioned.fill(
                  left: 30,
                  child: Container(
                    padding: EdgeInsets.only(
                        left: AppDimens.space48,
                        top: AppDimens.space16,
                        right: AppDimens.space16,
                        bottom: AppDimens.space16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.whiteFFFFFF,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.black.withOpacity(0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nguyễn Văn Tuấn Anh',
                                  style: AppTextStyles.regularW500(context,
                                      size: AppDimens.textSize14),
                                ),
                                SizedBox(
                                  height: AppDimens.space6,
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  itemSize: 12,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  ignoreGestures: true,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => SvgPicture.asset(
                                    Images.ic_star,
                                    color: Colors.amber,
                                  ),
                                  unratedColor: AppColors.greyAAAAAA,
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ],
                            ),
                            saved
                                ? SvgPicture.asset(Images.ic_saved)
                                : SvgPicture.asset(Images.ic_save)
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.space6,
                        ),
                        Row(
                          children: [
                            Text(
                              'Ngày mời:',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize14,
                                  color: AppColors.greyAAAAAA),
                            ),
                            Text(
                              '10/05/2020',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize14,),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppDimens.space6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  Images.ic_book,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: AppDimens.space6,
                                ),
                                Text(
                                  'Hóa học lớp 10',
                                  style: AppTextStyles.regular(
                                    context,
                                    size: AppDimens.textSize14,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  Images.ic_money,
                                  color: AppColors.secondaryF8971C,
                                  width: 16,
                                  height: 16,
                                ),
                                SizedBox(
                                  width: AppDimens.space6,
                                ),
                                Text(
                                  '300.000 vnđ/giờ',
                                  style: AppTextStyles.regular(
                                    context,
                                    size: AppDimens.textSize14,
                                    color: AppColors.secondaryF8971C
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 3,
                        offset:
                        Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://nghesiviet.vn/storage/files/7/phuongly/phuong-ly.jpg',
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
