import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/images.dart';
import '../common/theme/app_colors.dart';
import '../common/theme/app_colors.dart';
import '../common/theme/app_colors.dart';
import '../common/theme/app_colors.dart';
import '../common/theme/app_colors.dart';
import '../common/theme/app_colors.dart';
import '../common/theme/app_dimens.dart';
import '../common/theme/app_dimens.dart';
import '../common/theme/app_text_style.dart';
import 'custom_button2.dart';
import 'custom_button_1.dart';
import 'custom_button_1.dart';

class CardClassHome2 extends StatelessWidget {
  final String title;
  final String time;
  final String fee;
  final String subject;
  final String address;
  final String classId;
  final String methodTeach;
  final String numberSuggest;
  final bool save;
  final bool hasButton;
  final bool hasButtonSave;
  final VoidCallback onTap;

  const CardClassHome2(
      {Key key, this.title, this.time, this.fee, this.subject, this.address, this.classId, this.methodTeach, this.numberSuggest, this.save, this.hasButton, this.hasButtonSave = true, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.padding12),
      width: AppDimens.width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppDimens.space16), color: AppColors.whiteFFFFFF, boxShadow: [
        BoxShadow(
          color: AppColors.black.withOpacity(0.25),
          spreadRadius: 0,
          blurRadius: 4,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regularW500(context, size: AppDimens.textSize18, color: AppColors.primary4C5BD4),
                ),
              ),
              hasButtonSave
                  ? InkWell(
                onTap: onTap,
                      child: save
                          ? SvgPicture.asset(
                              Images.ic_saved,
                              width: 20,
                              height: 20,
                            )
                          : SvgPicture.asset(
                              Images.ic_save,
                              width: 20,
                              height: 20,
                            ),
                    )
                  : Container(),
            ],
          ),
          SizedBox(
            height: AppDimens.space6,
          ),
          Text(
            time,
            style: AppTextStyles.regular(context, size: AppDimens.textSize16, color: AppColors.greyAAAAAA),
          ),
          SizedBox(
            height: AppDimens.space6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        Images.ic_money,
                        width: 16,
                        height: 16,
                      ),
                      SizedBox(
                        width: AppDimens.space8,
                      ),
                      Text(
                        fee,
                        style: AppTextStyles.regular(context, size: AppDimens.textSize16, color: AppColors.secondaryF8971C),
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
                        width: 16,
                        height: 16,
                      ),
                      SizedBox(
                        width: AppDimens.space8,
                      ),
                      Text(
                        subject,
                        style: AppTextStyles.regular(
                          context,
                          size: AppDimens.textSize16,
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
                        width: 16,
                        height: 16,
                      ),
                      SizedBox(
                        width: AppDimens.space8,
                      ),
                      Text(
                        address,
                        style: AppTextStyles.regular(
                          context,
                          size: AppDimens.textSize16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Mã lớp:',
                        style: AppTextStyles.regular(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                      ),
                      SizedBox(
                        width: AppDimens.space4,
                      ),
                      Text(
                        classId,
                        style: AppTextStyles.regular(
                          context,
                          size: AppDimens.textSize16,
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
                        'Hình thức dạy:',
                        style: AppTextStyles.regular(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                      ),
                      SizedBox(
                        width: AppDimens.space6,
                      ),
                      Text(
                        methodTeach,
                        style: AppTextStyles.regular(context, size: AppDimens.textSize16, color: AppColors.green5DC22D),
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
                        'Đề nghị dạy:',
                        style: AppTextStyles.regular(context, size: AppDimens.textSize16, color: AppColors.grey747474),
                      ),
                      SizedBox(
                        width: AppDimens.space8,
                      ),
                      Text(
                        numberSuggest,
                        style: AppTextStyles.regular(
                          context,
                          size: AppDimens.textSize16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          hasButton
              ? Column(
                  children: [
                    SizedBox(
                      height: AppDimens.space16,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        CustomButton2(
                          title: 'Đồng ý',
                          color: AppColors.primary4C5BD4,
                          onPressed: () {},
                          textColor: AppColors.whiteFFFFFF,
                        ),
                        SizedBox(
                          width: AppDimens.space20,
                        ),
                        CustomButton1(
                          textColor: AppColors.black,
                          onPressed: () {},
                          color: AppColors.grey747474,
                          title: 'Từ chối',
                          backColor: AppColors.whiteFFFFFF,
                        )
                      ],
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
