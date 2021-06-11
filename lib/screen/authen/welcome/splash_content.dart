import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/screen/authen/welcome/welcome_controller.dart';
import '../../../common/images.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/app_colors.dart';

class SplashContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.whiteFFFFFF,
          body: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
