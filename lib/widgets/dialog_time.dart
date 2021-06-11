import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';

class DialogTime extends StatelessWidget {
  final void Function(DateTime) onChanged;

  const DialogTime({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(10.0),
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        color: AppColors.whiteFFFFFF,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: AppDimens.height * 0.2,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: onChanged,
                use24hFormat: false,
                minuteInterval: 1,
              ),
            ),
            SizedBox(
              height: AppDimens.padding16,
            ),
            CustomButton2(
              onPressed: () {
                // controller.checkButtonStep1();
                Get.back();
              },
              title: 'Lưu',
              textColor: AppColors.whiteFFFFFF,
              color: AppColors.primary4C5BD4,
            ),
            SizedBox(
              height: AppDimens.padding16,
            ),
          ],
        ),
      ),
    );
  }
}
