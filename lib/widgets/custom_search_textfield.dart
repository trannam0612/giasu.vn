import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

import '../common/theme/app_dimens.dart';
class CustomSearchTextField extends StatelessWidget {
  final controller;
  final ValueChanged<String> onChanged;
  final TextEditingController textEditingController;
  final VoidCallback onPressed;

  const CustomSearchTextField({Key key, this.controller, this.onChanged, this.textEditingController, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      // margin: EdgeInsets.only(top:8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.whiteFFFFFF,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary1574D0.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {
          if (onChanged != null) onChanged(value);
        },
        controller: textEditingController,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: AppDimens.padding16, right: AppDimens.padding16),
            filled: true,
            hintText: ('Tìm kiếm'),
            hintStyle: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.textSize16, color: AppColors.greyAAAAAA),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.whiteFFFFFF, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.whiteFFFFFF, width: 1.0),
            ),
            prefixIcon: GestureDetector(
              onTap: onPressed,
              child: Container(
                padding: EdgeInsets.all(8),
                child: SvgPicture.asset(
                  Images.ic_search,
                  color: AppColors.greyAAAAAA,
                  height: 14,
                  width: 14,
                ),
              ),
            ),
          suffixIcon:GestureDetector(
            onTap: onPressed,
            child: Container(
              padding: EdgeInsets.all(8),
              child: SvgPicture.asset(
                Images.ic_menu,
                color: AppColors.black,
                height: 14,
                width: 14,
              ),
            ),
          )
        ),
      ),
    );
  }
}
