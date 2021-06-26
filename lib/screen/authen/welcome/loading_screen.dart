import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/screen/authen/welcome/welcome_controller.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.whiteFFFFFF,
          body: Container(
            padding: EdgeInsets.all(AppDimens.space32),
            // decoration: BoxDecoration(color: AppColors.whiteFFFFFF, borderRadius: BorderRadius.only(topLeft: Radius.circular(AppDimens.space32), topRight: Radius.circular(AppDimens.space32))),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Images.img_logo_splash,
                    color: AppColors.primary4C5BD4,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Image.asset(Images.gif_loading, width: AppDimens.width * 0.15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
