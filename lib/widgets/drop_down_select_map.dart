import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';

class DropDownSelectMap extends StatefulWidget {
  final Map<int,String> list;
  final String hint;
  final String title;
  final Color colorTitle;
  final Color borderColor;
  final bool isTitle;
  final bool obligatory;
  final String dropdownValue;
  final void Function(String) onChanged;

  DropDownSelectMap(
      {Key key,
        this.list,
        this.dropdownValue,
        this.onChanged,
        this.hint = '',
        this.title = '',
        this.isTitle = true,
        this.obligatory = false,
        this.colorTitle = AppColors.black,
        this.borderColor = AppColors.grey747474})
      : super(key: key);

  @override
  _DropDownSelectState createState() => _DropDownSelectState();
}

class _DropDownSelectState extends State<DropDownSelectMap> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isTitle
            ? RichText(
          text: TextSpan(
            text: widget.title,
            style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: widget.colorTitle),
            children: <TextSpan>[
              TextSpan(
                text: widget.obligatory ? ' *' : '',
                style: AppTextStyles.regularW400(context, size: AppDimens.textSize16, lineHeight: AppDimens.space18, color: AppColors.redEB5757),
              ),
            ],
          ),
        )
            : Container(),
        SizedBox(
          height: AppDimens.space4,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.padding16),
          width: AppDimens.width,
          height: 52,
          decoration: BoxDecoration(color: AppColors.whiteFFFFFF, borderRadius: BorderRadius.circular(AppDimens.space10), border: Border.all(width: 1, color: widget.borderColor)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(
                widget.hint,
                style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.grey747474),
              ),
              style: new TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              icon: SvgPicture.asset(
                Images.ic_arrow_down,
                color: AppColors.black12,
              ),
              value: widget.dropdownValue,
              onChanged: widget.onChanged,
              dropdownColor: AppColors.whiteFFFFFF,
              elevation: 10,
              items: widget.list.values
                  .map((selectedType) {
                return DropdownMenuItem(
                  child: new Text(
                    selectedType,
                  ),
                  value: selectedType,
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
