import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class CardNotification extends StatelessWidget {
  final String title;
  final String content;
  final String image;
  final String time;
  const CardNotification({Key key, this.title, this.content, this.image, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppDimens.space6, horizontal: AppDimens.space4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl:
                image,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            width: AppDimens.space30,
          ),
          Flexible(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                        text: title,
                        style: AppTextStyles.regularW500(context,
                            size: AppDimens.textSize14),
                        children: [
                          TextSpan(
                              text: ' ${content}',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize14))
                        ])),
                SizedBox(height: AppDimens.space8,),
                Text(time, style: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
