import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class CardTeacherHome extends StatelessWidget {
  final String name;
  final String image;
  final int rate;
  final content;

  const CardTeacherHome(
      {Key key, this.name, this.image, this.rate, this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.5,
      padding: EdgeInsets.symmetric(
          horizontal: AppDimens.space8, vertical: AppDimens.space12),
      margin: EdgeInsets.only(left: 0, top: 15, right: 0, bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.whiteFFFFFF,
          border: Border.all(color: AppColors.primary4C5BD4, width: 0.25),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: CachedNetworkImage(
                  imageUrl: image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: AppDimens.space6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.regularW500(context,
                        size: AppDimens.textSize14),
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
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
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
              )
            ],
          ),
          SizedBox(
            height: AppDimens.space10,
          ),
          Text(
            content,
            textAlign: TextAlign.left,
            style: AppTextStyles.regularW400(context,
                size: AppDimens.textSize14, color: AppColors.grey747474),
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
