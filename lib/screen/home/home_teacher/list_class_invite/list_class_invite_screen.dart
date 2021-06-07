import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../common/images.dart';
import '../../../../common/theme/app_colors.dart';
import '../../../../common/theme/app_colors.dart';

class ListClassInviteScreen extends StatelessWidget {
  const ListClassInviteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyf6f6f6,
      appBar: AppBar(
        title: Text('Lớp mời bạn dạy'),
        backgroundColor: AppColors.primary4C5BD4,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            Images.ic_arrow_left_iphone,
            color: AppColors.whiteFFFFFF,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
