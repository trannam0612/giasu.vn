import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/search/list_result_search_screen.dart';
import 'package:giasu_vn/search/search_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchController searchController = Get.put(SearchController());
  Completer<GoogleMapController> _completer = Completer();

  @override
  void initState() {
    searchController.displayCurrentLocation();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      init: SearchController(),
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.greyf6f6f6,
        appBar: AppBar(
          title: Text(
            'Bộ Lọc',
            style: AppTextStyles.regularW500(context,
                size: AppDimens.textSize24,
                lineHeight: AppDimens.textSize28,
                color: AppColors.whiteFFFFFF),
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
        body: Container(
          padding: EdgeInsets.all(AppDimens.space14),
          child: Column(
            children: [
              Container(
                width: AppDimens.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.whiteFFFFFF),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.isValueSearch = true;
                          controller.update();
                        },
                        child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: controller.isValueSearch
                                  ? AppColors.primary4C5BD4
                                  : AppColors.whiteFFFFFF,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Tìm kiếm theo tỉnh thành',
                                style: AppTextStyles.regularW400(context,
                                    size: AppDimens.textSize16,
                                    color: controller.isValueSearch
                                        ? AppColors.whiteFFFFFF
                                        : AppColors.black),
                              ),
                            )),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.isValueSearch = false;
                          controller.update();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: controller.isValueSearch
                                ? AppColors.whiteFFFFFF
                                : AppColors.primary4C5BD4,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'Tìm kiếm quanh đây',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16,
                                  color: controller.isValueSearch
                                      ? AppColors.black
                                      : AppColors.whiteFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              controller.isValueSearch
                  ? Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: AppDimens.space50,
                          ),
                          CustomTextField(
                            onTapTextField: () {
                              Get.to(SelectTinhThanh(context));
                            },
                            readOnly: true,
                            isShowIcon: false,
                            obligatory: true,
                            textEditingController: controller.provincial,
                            onPressed: () {},
                            title: 'Tỉnh, thành phố',
                            hintText: 'Chọn tỉnh, thành phố',
                            iconSuffix: Images.ic_arrow_down,
                            error: controller.checkProvincial(),
                          ),
                          SizedBox(
                            height: AppDimens.space18,
                          ),
                          CustomTextField(
                            onTapTextField: () {
                              Get.to(SelectDistrict(context));
                            },
                            readOnly: true,
                            isShowIcon: false,
                            obligatory: true,
                            textEditingController: controller.district,
                            onPressed: () {},
                            title: 'Quận, huyện',
                            hintText: 'Chọn quận, huyện',
                            iconSuffix: Images.ic_arrow_down,
                            error: controller.checkDistrict(),
                          ),
                          SizedBox(
                            height: AppDimens.space18,
                          ),
                          CustomTextField(
                            onTapTextField: () {},
                            readOnly: true,
                            isShowIcon: false,
                            obligatory: true,
                            textEditingController: controller.subject,
                            onPressed: () {},
                            title: 'Môn học',
                            hintText: 'Nhập môn học',
                            iconSuffix: Images.ic_arrow_down,
                          ),
                          SizedBox(
                            height: AppDimens.space18,
                          ),
                          CustomTextField(
                            onTapTextField: () {},
                            readOnly: true,
                            isShowIcon: true,
                            obligatory: true,
                            textEditingController: controller.methodTeach,
                            onPressed: () {},
                            title: 'Hình thức học',
                            hintText: '',
                            iconSuffix: Images.ic_arrow_down,
                            // error: controller.checkDistrict(),
                          ),
                          SizedBox(
                            height: AppDimens.space36,
                          ),
                          SizedBox(
                            width: AppDimens.width *0.8,
                            height: 40,
                            child: CustomButton2(
                              color: AppColors.primary4C5BD4,
                              onPressed: () {
                                Get.to(ListResultSearchScreen());
                              },
                              title: 'Tìm kiếm',
                              textColor: AppColors.whiteFFFFFF,
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                height: 500,
                child: Center(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(controller.locationDefault.latitude, controller.locationDefault.longitude),
                        zoom: 15,
                        bearing: 0.0,
                        tilt: 0.0),
                    onMapCreated: (GoogleMapController controller) {
                      if (!_completer.isCompleted) {
                        //first calling is false
                        //call "completer()"
                        _completer.complete(controller);
                      } else {
                        //other calling, later is true,
                        //don't call again completer()
                      }
                    },
                    zoomGesturesEnabled: true,
                    tiltGesturesEnabled: false,
                    onCameraMove: (CameraPosition cameraPosition) {
                      print(cameraPosition.zoom);
                    },
                    markers: {
                      Marker(
                          markerId: MarkerId('hn1'),
                          position: LatLng(controller.locationDefault.latitude, controller.locationDefault.longitude),
                          infoWindow: InfoWindow(title: 'Vị trí của bạn'),
                          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue))
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget SelectTinhThanh(BuildContext context) {
  SearchController searchController = Get.put(SearchController());
  List<String> list = ['Hà Nội', 'Hưng Yên', 'Thái Bình', 'Thanh Hóa'];
  return SafeArea(
      child: Scaffold(
    backgroundColor: AppColors.greyf6f6f6,
    appBar: AppBar(
      backgroundColor: AppColors.primary4C5BD4,
      title: Text(
        'TỈNH, THÀNH PHỐ',
        style: AppTextStyles.regularW500(context,
            size: AppDimens.textSize24,
            lineHeight: AppDimens.textSize28,
            color: AppColors.whiteFFFFFF),
      ),
      leading: IconButton(
        icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
        onPressed: () {
          Get.back();
        },
      ),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(
          vertical: AppDimens.space32, horizontal: AppDimens.padding16),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
                // ignore: deprecated_member_use
                onTap: () {
                  searchController.provincial.text = list[index];
                  Get.back();
                },
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        list[index],
                        style: AppTextStyles.regularW400(context,
                            size: AppDimens.padding16, color: AppColors.black),
                      ),
                      Spacer(),
                      list[index] == searchController.provincial.text
                          ? SvgPicture.asset(Images.ic_check_green)
                          : Container()
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: AppColors.black12,
              ),
          itemCount: list.length),
    ),
  ));
}

// ignore: non_constant_identifier_names
Widget SelectDistrict(BuildContext context) {
  SearchController searchController = Get.put(SearchController());
  List<String> list = ['Hai bà trưng', 'Hoàng Mai', 'Tây Hồ', 'Ba Đình'];
  return SafeArea(
      child: Scaffold(
    backgroundColor: AppColors.greyf6f6f6,
    appBar: AppBar(
      backgroundColor: AppColors.primary4C5BD4,
      title: Text(
        'Quận, Huyện',
        style: AppTextStyles.regularW500(context,
            size: AppDimens.textSize24,
            lineHeight: AppDimens.textSize28,
            color: AppColors.whiteFFFFFF),
      ),
      leading: IconButton(
        icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
        onPressed: () {
          Get.back();
        },
      ),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(
          vertical: AppDimens.space32, horizontal: AppDimens.padding16),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => GestureDetector(
                // ignore: deprecated_member_use
                onTap: () {
                  searchController.district.text = list[index];
                  Get.back();
                },
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        list[index],
                        style: AppTextStyles.regularW400(context,
                            size: AppDimens.padding16, color: AppColors.black),
                      ),
                      Spacer(),
                      list[index] == searchController.district.text
                          ? SvgPicture.asset(Images.ic_check_green)
                          : Container()
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: AppColors.black12,
              ),
          itemCount: list.length),
    ),
  ));
}
