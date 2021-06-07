import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class CustomTextFieldBox extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController textEditingController;
  final VoidCallback onPressed;
  final bool isPassword;
  final bool isShowIcon;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final Color colorBorder;
  final String iconSuffix;
  final String error;
  final Color colorIcon;
  final bool obligatory;

  const CustomTextFieldBox(
      {Key key,
      this.title,
      this.isPassword = false,
      this.keyboardType,
      this.colorBorder = AppColors.black12,
      this.iconSuffix,
      this.onChanged,
      this.textEditingController,
      this.hintText,
      this.onPressed,
      this.colorIcon = AppColors.black12,
      this.isShowIcon = false,
      this.obligatory = false,
      this.error});

  @override
  _CustomTextFieldBoxState createState() => _CustomTextFieldBoxState();
}

class _CustomTextFieldBoxState extends State<CustomTextFieldBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: widget.title,
              style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18),
              children: <TextSpan>[
                TextSpan(
                  text: widget.obligatory ? ' *' : '',
                  style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.redEB5757),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppDimens.space4,
          ),
          TextFormField(
              autofocus: false,
              maxLines: 5,
              obscureText: widget.isPassword,
              onChanged: (value) {
                if (widget.onChanged != null) widget.onChanged(value);
              },
              keyboardType: widget.keyboardType,
              controller: widget.textEditingController,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.black),
              decoration: InputDecoration(
                errorText: widget.error,
                hintText: widget.hintText,
                hintStyle: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: widget.colorBorder,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: widget.colorBorder,
                  ),
                ),
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    width: 1,
                    color: widget.colorBorder,
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                isDense: true,
                suffixIcon: widget.isShowIcon
                    ? IconButton(
                        icon: SvgPicture.asset(
                          widget.iconSuffix,
                          color: widget.colorIcon,
                        ),
                        onPressed: widget.onPressed,
                      )
                    : null,
              )),
        ],
      ),
    );
  }
}
