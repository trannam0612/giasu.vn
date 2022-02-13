import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

import '../common/theme/app_dimens.dart';
import 'package:flutter_svg/svg.dart';

class CustomTxf extends StatefulWidget {
  final String title;
  final String hintText;
  final TextEditingController textEditingController;
  final VoidCallback onPressedIcon;
  final VoidCallback onTapTextField;
  final bool isPassword;
  final bool isTitle;
  final bool isShowIcon;
  final TextInputType keyboardType;
  final String Function(String) onChanged;
  final String Function(String) validator;
  final Color colorBorder;
  final Color colorEnabledBorder;
  final Color colorFocusedBorder;
  final Color colorTitle;
  final String iconSuffix;
  final String error;
  final Color colorIcon;
  final bool obligatory;
  final bool readOnly;
  final int maxLength;
  final int maxLine;
  final int minLine;
  final Key keyText;
  final FocusNode focus;
  final List<TextInputFormatter> inputFormatters;
  final TextInputAction textInputAction;

  const CustomTxf(
      { Key key,
        this.title,
        this.isPassword = false,
        this.keyboardType = TextInputType.multiline,
        this.colorBorder = AppColors.black,
        this.iconSuffix,
        this.onChanged,
        this.textEditingController,
        this.hintText,
        this.onPressedIcon,
        this.colorIcon = AppColors.black,
        this.isShowIcon = false,
        this.obligatory = false,
        this.error,
        this.isTitle = true,
        this.colorTitle = AppColors.black,
        this.focus,
        this.readOnly = false,
        this.onTapTextField,
        this.maxLength,
        this.maxLine ,
        this.inputFormatters,
        this.colorFocusedBorder = AppColors.black,
        this.colorEnabledBorder = AppColors.black,
        this.validator,
        this.keyText,
        this.textInputAction = TextInputAction.done,
        this.minLine = 1});

  @override
  _CustomTxfState createState() => _CustomTxfState();
}

class _CustomTxfState extends State<CustomTxf> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isTitle?
               RichText(
            text: TextSpan(
              text: widget.title,
              style: AppTextStyles.regularW500(context, size: AppDimens
                  .textSize16, lineHeight: AppDimens.space18, color: widget.colorTitle),
              children: <TextSpan>[
                TextSpan(
                  text: widget.obligatory ? ' *' : '',
                  style:
                  AppTextStyles.regularW500(context, size:
                  AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.redEB5757),
                ),
              ],
            ),
          )
              : Container(),
          SizedBox(
            height: AppDimens.space10,
          ),
          Form(
            key: widget.keyText,
            child: TextFormField(
                textInputAction: widget.textInputAction,

                minLines: widget.minLine,
                autocorrect: false,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: widget.validator,
                inputFormatters: widget.inputFormatters,
                maxLength: widget.maxLength,
                onTap: widget.onTapTextField,
                readOnly: widget.readOnly,
                focusNode: widget.focus,
                maxLines: widget.maxLine,
                obscureText: widget.isPassword,
                onChanged: (value) {
                  if (widget.onChanged != null) widget.onChanged(value);
                },
                keyboardType: widget.keyboardType,
                controller: widget.textEditingController,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: AppColors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  errorText: widget.error,
                  hintText: widget.hintText,
                  hintStyle: AppTextStyles.regularW400(context, size: AppDimens.textSize14, color: AppColors.grey686F7A, fontStyle: FontStyle.italic),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 1,
                      color: widget.colorBorder,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 1,
                      color: widget.colorBorder,
                    ),
                  ),
                  border: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 1,
                      color: widget.colorBorder,
                    ),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  isDense: true,
                  suffixIcon: widget.isShowIcon?
                       IconButton(
                    icon: SvgPicture.asset(
                      widget.iconSuffix,
                      color: widget.colorIcon,
                    ),
                    onPressed: widget.onPressedIcon,
                  )
                      : null,
                )),
          ),
        ],
      ),
    );
  }
}
