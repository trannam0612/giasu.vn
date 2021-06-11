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
            decoration: BoxDecoration(
                color: AppColors.whiteFFFFFF,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(AppDimens.space32), topRight: Radius.circular(AppDimens.space32))),
          ),
        ),
      ),
    );
  }
}
