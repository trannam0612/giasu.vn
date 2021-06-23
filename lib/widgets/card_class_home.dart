import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/images.dart';
import '../common/theme/app_colors.dart';
import '../common/theme/app_dimens.dart';
import '../common/theme/app_text_style.dart';

class CardClassHome extends StatelessWidget {
  final String title;
  final String time;
  final String subject;
  final String address;
  const CardClassHome({Key key, this.title, this.time, this.subject, this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.width * 0.5,
      margin: EdgeInsets.only(
          left: 0, top: 15, right: 0, bottom: 20),
      padding: EdgeInsets.all(AppDimens.space14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.whiteFFFFFF,
          border: Border.all(
              color: AppColors.primary4C5BD4, width: 0.25),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset:
              Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.regularW500(context,
                size: AppDimens.textSize16,
                color: AppColors.primary4C5BD4),
          ),
          SizedBox(height: AppDimens.space6,),
          Text(
            time,
            style: AppTextStyles.regular(context,
                size: AppDimens.textSize14,
                color: AppColors.greyAAAAAA),
          ),
          SizedBox(height: AppDimens.space8,),
          Row(
            children: [
              SvgPicture.asset(Images.ic_book, width: 10, height: 10,),
              SizedBox(width: AppDimens.space6,),
              Text(subject, style: AppTextStyles.regular(context, size: AppDimens.textSize14,),),
            ],
          ),
          SizedBox(height: AppDimens.space8,),
          Row(
            children: [
              SvgPicture.asset(Images.ic_location, width: 10, height: 10,),
              SizedBox(width: AppDimens.space6,),
              Text(address, style: AppTextStyles.regular(context, size: AppDimens.textSize14,),),
            ],
          ),
        ],
      ),
    );
  }
}
