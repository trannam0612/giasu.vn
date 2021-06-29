import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/screen/home/home_after/home_after_teacher/list_parent_saved/list_parent_saved_controller.dart';

class ListParentSavedScreen extends StatefulWidget {
  const ListParentSavedScreen({Key key}) : super(key: key);

  @override
  _ListParentSavedScreenState createState() => _ListParentSavedScreenState();
}

class _ListParentSavedScreenState extends State<ListParentSavedScreen> {
  ListParentSavedController listParentSavedController = Get.put(ListParentSavedController());
  ScrollController _controller = ScrollController();
  int i = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listParentSavedController.listPHDL = [];
    listParentSavedController.parentSaved(1, 10);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // homeAfterController.homeParent();
        i++;
        print(i);
        listParentSavedController.parentSaved(i, 10);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListParentSavedController>(
      init: ListParentSavedController(),
      builder: (controller) =>  Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Phụ huynh đã lưu',
            style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
          ),
          backgroundColor: AppColors.primary4C5BD4,
          elevation: 0,
          titleSpacing: 0,
          centerTitle: false,
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
        body: controller.listPHDL.isEmpty ? Center(
          child: Text(
            'Danh sách trống',
            style: AppTextStyles.regularW500(context, size: AppDimens.textSize20, color: AppColors.grey747474),
          ),
        ):  ListView.separated(
          physics: BouncingScrollPhysics(),
            controller: _controller,
            itemBuilder: (context, index) => Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.15,
              secondaryActions: [
                Padding(
                  padding: const EdgeInsets.all(2.5),
                  child: IconSlideAction(
                    caption: 'Xoá',
                    color: AppColors.redEB5757,
                    icon: Icons.delete_outline,
                    onTap: () {
                      controller.deleteParentSaved(int.parse(controller.listPHDL[index].ugsId));
                      controller.listPHDL.remove(controller.listPHDL[index]);
                      controller.update();
                    },
                  ),
                ),
              ],
              child: Container(
                    padding: EdgeInsets.symmetric(horizontal: AppDimens.space6, vertical: AppDimens.space6),
                    child: SizedBox(
                      height: AppDimens.height * 0.11,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Positioned.fill(
                            left: 30,
                            child: Container(
                              padding: EdgeInsets.only(left: AppDimens.space48, top: AppDimens.space10, right: AppDimens.space28, bottom: AppDimens.space16),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.whiteFFFFFF, boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ]),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.listPHDL[index].ugsName,
                                            style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
                                          ),
                                          SizedBox(
                                            height: AppDimens.space6,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppDimens.space16,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Mã:',
                                            style: AppTextStyles.regular(context, size: AppDimens.textSize14, color: AppColors.greyAAAAAA),
                                          ),
                                          SizedBox(
                                            width: AppDimens.space6,
                                          ),
                                          Text(
                                            controller.listPHDL[index].ugsId,
                                            style: AppTextStyles.regular(
                                              context,
                                              size: AppDimens.textSize14,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                            Images.ic_location,
                                            width: 16,
                                            height: 16,
                                          ),
                                          SizedBox(
                                            width: AppDimens.space6,
                                          ),
                                          Text(
                                            controller.listPHDL[index].spDetail,
                                            style: AppTextStyles.regular(
                                              context,
                                              size: AppDimens.textSize14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: CachedNetworkImage(
                              imageUrl: controller.listPHDL[index].ugsAvatar,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              progressIndicatorBuilder: (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(value: downloadProgress.progress),
                              ),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
            separatorBuilder: (context, index) => SizedBox(
                  height: AppDimens.space10,
                ),
            itemCount: controller.listPHDL.length),
      ),
    );
  }
}
