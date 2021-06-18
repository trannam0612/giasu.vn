import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class CardTeacherHome2 extends StatelessWidget {
  final String name;
  final String image;
  final int rate;
  final String subject;
  final String address;
  final String saved;
  const CardTeacherHome2({Key key, this.name, this.image, this.rate, this.subject, this.address, this.saved = '0'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimens.space6,
          vertical: AppDimens.space6),
      child: SizedBox(
        height: height*0.115,
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
                    borderRadius:
                    BorderRadius.circular(10),
                    color: AppColors.whiteFFFFFF,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black
                            .withOpacity(0.25),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0,
                            3), // changes position of shadow
                      ),
                    ]),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: AppTextStyles
                                  .regularW500(context,
                                  size: AppDimens
                                      .textSize14),
                            ),
                            SizedBox(
                              height: AppDimens.space6,
                            ),
                            RatingBar(
                              initialRating: rate.toDouble(),
                              itemSize: 12,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              ignoreGestures: true,
                              itemPadding:
                              EdgeInsets.symmetric(horizontal: 2.0),
                              ratingWidget: RatingWidget(
                                full: SvgPicture.asset(Images.ic_star),
                                empty: SvgPicture.asset(Images.ic_star_border),
                              ),
                              unratedColor: AppColors.greyAAAAAA,
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                        saved =='1' ? SvgPicture.asset(Images.ic_saved) : SvgPicture.asset(Images.ic_save)
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
                              subject,
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
                              Images.ic_location,
                              width: 16,
                              height: 16,
                            ),
                            SizedBox(
                              width: AppDimens.space6,
                            ),
                            Text(
                              address,
                              style: AppTextStyles.regular(
                                context,
                                size: AppDimens.textSize14,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: CachedNetworkImage(
                imageUrl:
                image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
