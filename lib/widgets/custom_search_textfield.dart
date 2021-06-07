import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
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
      margin: EdgeInsets.only(top:8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.whiteFFFFFF,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary2169A8.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(4, 0), // changes position of shadow
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
            hintText: ('Nhập từ khóa tìm kiếm'),
            hintStyle: AppTextStyles.regularW400(context, size: AppDimens.textSize12, color: AppColors.grey8C686F7A),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.whiteFFFFFF, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.whiteFFFFFF, width: 1.0),
            ),
            suffixIcon: GestureDetector(
              onTap: onPressed,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 13),
                child: SvgPicture.asset(
                  Images.ic_search,
                  color: AppColors.grey686F7A,
                  height: 16,
                  width: 16,
                ),
              ),
            )),
      ),
    );
  }
}
