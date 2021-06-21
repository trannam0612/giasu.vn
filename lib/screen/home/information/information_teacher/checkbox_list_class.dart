import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_parent/list_post_created/list_post_created_controller.dart';
import 'package:giasu_vn/screen/home/information/information_teacher/information_teacher_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';

class CheckboxListClass extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String idGS;
  const CheckboxListClass({Key key, this.name, this.imageUrl, this.idGS}) : super(key: key);

  @override
  _CheckboxListClassState createState() => _CheckboxListClassState();
}

class _CheckboxListClassState extends State<CheckboxListClass> {
  ListPostCreatedController listPostCreatedController = Get.put(ListPostCreatedController());
  ScrollController _controller = ScrollController();
  InformationTeacherController informationTeacherController = Get.put(InformationTeacherController());
  int i = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    informationTeacherController.listPostCreated.clear();
    informationTeacherController.classPosted(1, 10);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        i++;
        print(i);
        informationTeacherController.classPosted(i, 10);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InformationTeacherController>(
      init: InformationTeacherController(),
      builder:(controller) =>  Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        insetPadding: EdgeInsets.all(AppDimens.padding16),
        backgroundColor: AppColors.whiteFFFFFF,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppDimens.space30, horizontal: AppDimens.space10),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Mời giáo viên',
                style: AppTextStyles.regularW700(context, size: AppDimens.textSize24, color: AppColors.primary4C5BD4),
              ),
              SizedBox(
                height: AppDimens.space24,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.imageUrl,
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
              SizedBox(
                height: AppDimens.space16,
              ),
              Text(
                widget.name,
                style: AppTextStyles.regular(context, size: 16, color: AppColors.black),
              ),
              SizedBox(
                height: AppDimens.space16,
              ),
              Align(alignment: Alignment.centerLeft, child: Text('Chọn lớp mà bạn muốn mời giáo viên dạy', style: AppTextStyles.regular(context, size: 16, color: AppColors.primary4C5BD4))),
              SizedBox(
                height: AppDimens.space8,
              ),
              Container(
                height: AppDimens.height * 0.3,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                    controller: _controller,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        controller.idClass = controller.listPostCreated[index].pftId;
                        print(controller.idClass);
                        controller.update();
                      },
                      child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(width: 0.5, color: AppColors.greyAAAAAA)),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(AppDimens.space8),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(width: 1, color: AppColors.primary4C5BD4)),
                                  child: controller.listPostCreated[index].pftId == controller.idClass ? SvgPicture.asset(Images.ic_check_green) : Container(),
                                ),
                                SizedBox(
                                  width: AppDimens.space16,
                                ),
                                Text(
                                  controller.listPostCreated[index].pftSummary,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.regular(context, size: AppDimens.textSize16, color: AppColors.black),
                                )
                              ],
                            ),
                          ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: AppDimens.space10,
                        ),
                    itemCount: controller.listPostCreated.length),
              ),
              SizedBox(height: AppDimens.space30,),
              CustomButton2(
                color: AppColors.primary4C5BD4,
                title: 'Mời gia sư',
                textColor: AppColors.whiteFFFFFF,
                onPressed: () {
                  controller.inviteTeach(int.parse(controller.idClass),int.parse(widget.idGS));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
