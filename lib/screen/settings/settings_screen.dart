import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/settings/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (controller) =>  Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          backgroundColor: AppColors.primary4C5BD4,
          title: Text(
            'Cài đặt',
            style: AppTextStyles.regularW500(context,
                size: AppDimens.textSize24,
                lineHeight: AppDimens.textSize28,
                color: AppColors.whiteFFFFFF),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.space16, vertical: AppDimens.space20),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.space20, vertical: AppDimens.space30),
                decoration: BoxDecoration(
                    color: AppColors.whiteFFFFFF,
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://nghesiviet.vn/storage/files/7/phuongly/phuong-ly.jpg',
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nguyễn Văn Tuấn Anh',
                          style: AppTextStyles.regularW500(context,
                              size: AppDimens.textSize22),
                        ),
                        SizedBox(
                          height: AppDimens.space4,
                        ),
                        Text(
                          'giasu.vn@gmail.com',
                          style: AppTextStyles.regularW400(context,
                              size: AppDimens.textSize14,
                              color: AppColors.grey747474),
                        ),
                        SizedBox(
                          height: AppDimens.space10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimens.space16,
                              vertical: AppDimens.space2),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.5,
                              color: AppColors.grey747474,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'Chỉnh sửa thông tin',
                            style: AppTextStyles.regularW400(context,
                                size: AppDimens.textSize14,
                                color: AppColors.secondaryF8971C),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: AppDimens.space10,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: AppDimens.space10),
                decoration: BoxDecoration(
                    color: AppColors.whiteFFFFFF,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Text(
                      'Cài đặt',
                      style: AppTextStyles.regularW700(
                        context,
                        size: AppDimens.textSize18,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Cài đặt thông báo',
                        style: AppTextStyles.regularW400(context,
                            size: AppDimens.textSize16),
                      ),
                      subtitle: Text(
                        ' Âm thanh thông báo',
                        style: AppTextStyles.regularW400(context,
                            size: AppDimens.textSize16,
                            color: AppColors.greyAAAAAA),
                      ),
                      trailing: Switch(
                        value: controller.isSwitched,
                        onChanged: (value) {
                          controller.onChanged();
                        },
                        activeTrackColor: AppColors.grey747474,
                        activeColor: AppColors.green5DC22D,
                      ),

                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
