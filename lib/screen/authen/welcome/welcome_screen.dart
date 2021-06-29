import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/authen/welcome/welcome_controller.dart';

import '../../../common/images.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.greyf6f6f6,
          body: Container(
            // decoration: BoxDecoration(color: AppColors.whiteFFFFFF, borderRadius: BorderRadius.only(topLeft: Radius.circular(AppDimens.space32), topRight: Radius.circular(AppDimens.space32))),
            child: Center(
              child: Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: AppDimens.width * 0.8, height: AppDimens.height * 0.5, child: Image.asset(controller.value.value == 0 ? Images.img_intro_1 : Images.img_intro_2)),
                    controller.value.value == 0
                        ? Column(
                            children: [
                              Text(
                                'Bạn đang tìm lớp học?',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Hay',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'Bạn là một gia sư tài năng cần tìm lớp để dạy???',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              Text(
                                'Hãy đến với chúng tôi.',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                'GIASU.VN sẽ giúp bạn tìm được điều bạn muốn!!!',
                                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: AppDimens.height * 0.1,
                    ),
                    InkWell(
                      onTap: () => controller.changeValue(),
                      child: SvgPicture.asset(
                        Images.ic_drop_right_1,
                        height: AppDimens.height * 0.08,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
