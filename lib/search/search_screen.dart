import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/constants.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/search/list_result_search_screen.dart';
import 'package:giasu_vn/search/search_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_search_textfield.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';
import 'package:giasu_vn/widgets/custom_txf.dart';
import 'package:giasu_vn/widgets/drop_down_select.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sp_util/sp_util.dart';

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
    // if (searchController.token == '') {
    //   SpUtil.putString(ConstString.USER_TYPE, '2');
    // }else{
    //   SpUtil.putString(ConstString.USER_TYPE, '1');
    // }
    searchController.token = SpUtil.getString(ConstString.token);
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
        body: Container(
          padding: EdgeInsets.all(AppDimens.space14),
          child: Column(
            children: [
              Container(
                width: AppDimens.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppColors.whiteFFFFFF),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.isValueSearch = true;
                          controller.update();
                        },
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: controller.isValueSearch ? AppColors.primary4C5BD4 : AppColors.whiteFFFFFF,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              'Theo tỉnh thành',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16, color: controller.isValueSearch ? AppColors.whiteFFFFFF : AppColors.black),
                            )),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          controller.isValueSearch = false;
                          controller.displayCurrentLocation();
                          controller.update();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: controller.isValueSearch ? AppColors.whiteFFFFFF : AppColors.primary4C5BD4,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'Quanh đây',
                              style: AppTextStyles.regularW400(context,
                                  size: AppDimens.textSize16, color: controller.isValueSearch ? AppColors.black : AppColors.whiteFFFFFF),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AppDimens.space50,
                          ),
                          CustomTxf(
                            onTapTextField: () {
                              Get.to(SelectTinhThanh(context));
                            },
                            onPressedIcon: () {
                              Get.to(SelectTinhThanh(context));
                            },
                            readOnly: true,
                            isShowIcon: true,
                            obligatory: false,
                            textEditingController: controller.provincial,
                            title: 'Tỉnh, thành phố',
                            hintText: 'Chọn tỉnh, thành phố',
                            iconSuffix: Images.ic_arrow_down,
                          ),
                          SizedBox(
                            height: AppDimens.space18,
                          ),
                          CustomTxf(
                            onTapTextField: () {
                              Get.to(SelectClass(context));
                            },
                            readOnly: true,
                            isShowIcon: true,
                            obligatory: false,
                            textEditingController: controller.className,
                            onPressedIcon: () {
                              Get.to(SelectClass(context));

                            },
                            title: 'Lớp học',
                            hintText: 'Chọn lớp học',
                            iconSuffix: Images.ic_arrow_down,
                          ),
                          SizedBox(
                            height: AppDimens.space18,
                          ),
                          DropDownSelect(
                            hint: 'Chọn môn học',
                            obligatory: false,
                            title: 'Môn học',
                            list: listDataSubject.map((e) => e.asName).toList(),
                            onChanged: (String value) => controller.onSelectedSubject(value),
                            dropdownValue: controller.selectedSubject,
                            borderColor: controller.errorSubject ? AppColors.redFF0033 : AppColors.grey747474,
                          ),
                          SizedBox(
                            height: AppDimens.space18,
                          ),
                          controller.token == ''
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.changeStatusUser();
                                        SpUtil.putString(ConstString.USER_TYPE, '2');
                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(controller.statusUser ? Images.ic_check_blue : Images.ic_check),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Gia sư',
                                            style: AppTextStyles.regularW500(context,
                                                size: AppDimens.textSize16,
                                                color: controller.statusUser ? AppColors.primary1574D0 : AppColors.grey747474),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        controller.changeStatusUser();
                                        SpUtil.putString(ConstString.USER_TYPE, '1');
                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(!controller.statusUser ? Images.ic_check_blue : Images.ic_check),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Phụ huynh',
                                            style: AppTextStyles.regularW500(context,
                                                size: AppDimens.textSize16,
                                                color: !controller.statusUser ? AppColors.primary1574D0 : AppColors.grey747474),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                          SizedBox(
                            height: AppDimens.space36,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: AppDimens.width * 0.8,
                              height: 40,
                              child: CustomButton2(
                                color: AppColors.primary4C5BD4,
                                onPressed: () {
                                  Get.to(ListResultSearchScreen());
                                },
                                // controller.userType == '1' ? Get.to(ListResultSearchScreen()) : Get.to(ListResultSearchScreen());
                                // },
                                title: 'Tìm kiếm',
                                textColor: AppColors.whiteFFFFFF,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Text(
                          'Chức năng đang được phát triển',
                          style: AppTextStyles.regularW500(context, size: AppDimens.textSize20, color: AppColors.grey747474),
                        ),
                        // child: GoogleMap(
                        //   initialCameraPosition: CameraPosition(
                        //       target: LatLng(controller.locationDefault.latitude, controller.locationDefault.longitude),
                        //       zoom: 15,
                        //       bearing: 0.0,
                        //       tilt: 0.0),
                        //   onMapCreated: (GoogleMapController controller) {
                        //     if (!_completer.isCompleted) {
                        //       //first calling is false
                        //       //call "completer()"
                        //       _completer.complete(controller);
                        //     } else {
                        //       //other calling, later is true,
                        //       //don't call again completer()
                        //     }
                        //   },
                        //   zoomGesturesEnabled: true,
                        //   tiltGesturesEnabled: false,
                        //   onCameraMove: (CameraPosition cameraPosition) {
                        //     print(cameraPosition.zoom);
                        //   },
                        //   markers: {
                        //     Marker(
                        //         markerId: MarkerId('hn1'),
                        //         position: LatLng(controller.locationDefault.latitude, controller.locationDefault.longitude),
                        //         infoWindow: InfoWindow(title: 'Vị trí của bạn'),
                        //         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue))
                        //   },
                        // ),
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
  // List<String> list = ['Hà Nội', 'Hưng Yên', 'Thái Bình', 'Thanh Hóa'];
  return SafeArea(
      child: Scaffold(
    backgroundColor: AppColors.greyf6f6f6,
    appBar: AppBar(
      backgroundColor: AppColors.primary4C5BD4,
      title: Text(
        'TỈNH, THÀNH PHỐ',
        style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
      ),
      leading: IconButton(
        icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
        onPressed: () {
          Get.back();
        },
      ),
    ),
    body: Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchTextField(
              readOnly: false,
              textEditingController: searchController.search,
              onChanged: (value) {
                searchController.changeSearchProvincial('');
                searchController.changeSearchProvincial(value);
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: AppDimens.space32, horizontal: AppDimens.padding16),
              child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => InkWell(
                        // ignore: deprecated_member_use
                        onTap: () {
                          searchController.provincial.text = searchController.listProvincial[index].citName;
                          searchController.idProvincial = int.parse(searchController.listProvincial[index].citId);
                          // searchController.getListDistrict(searchController.idProvincial);
                          Get.back();
                        },
                        child: SizedBox(
                          height: 30,
                          child: Row(
                            children: [
                              Text(
                                searchController.listProvincial[index].citName,
                                style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                              ),
                              Spacer(),
                              searchController.listProvincial[index].citName == searchController.provincial.text
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
                  itemCount: searchController.listProvincial.length),
            ),
          ),
        ],
      ),
    ),
  ));
}

// ignore: non_constant_identifier_names
Widget SelectClass(BuildContext context) {
  SearchController searchController = Get.put(SearchController());
  // List<String> list = ['Hai bà trưng', 'Hoàng Mai', 'Tây Hồ', 'Ba Đình'];
  return SafeArea(
      child: Scaffold(
    backgroundColor: AppColors.greyf6f6f6,
    appBar: AppBar(
      backgroundColor: AppColors.primary4C5BD4,
      title: Text(
        'Lớp học',
        style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
      ),
      leading: IconButton(
        icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
        onPressed: () {
          Get.back();
        },
      ),
    ),
    body: Container(
      padding: EdgeInsets.symmetric(vertical: AppDimens.space32, horizontal: AppDimens.padding16),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
                // ignore: deprecated_member_use
                onTap: () {
                  searchController.className.text = listDataClass[index].ctName;
                  searchController.idClass = int.parse(listDataClass[index].ctId);
                  Get.back();
                },
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        listDataClass[index].ctName,
                        style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                      ),
                      Spacer(),
                      listDataClass[index].ctName == searchController.className.text ? SvgPicture.asset(Images.ic_check_green) : Container()
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: AppColors.black12,
              ),
          itemCount: listDataClass.length),
    ),
  ));
}
