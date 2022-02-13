import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/common/images.dart';
import 'package:giasu_vn/common/theme/app_colors.dart';
import 'package:giasu_vn/common/theme/app_dimens.dart';
import 'package:giasu_vn/common/theme/app_text_style.dart';
import 'package:giasu_vn/common/utils.dart';
import 'package:giasu_vn/data_off/provincial_subject.dart';
import 'package:giasu_vn/screen/authen/register/register_teacher/register_giasu_controller.dart';
import 'package:giasu_vn/screen/message/message_controller.dart';
import 'package:giasu_vn/screen/navigation/navigation_controller.dart';
import 'package:giasu_vn/screen/post/post_controller.dart';
import 'package:giasu_vn/screen/post/update_post/update_post_controller.dart';
import 'package:giasu_vn/widgets/custom_button2.dart';
import 'package:giasu_vn/widgets/custom_button_1.dart';
import 'package:giasu_vn/widgets/custom_button_3.dart';
import 'package:giasu_vn/widgets/custom_textfield.dart';
import 'package:giasu_vn/widgets/custom_textfield_box.dart';
import 'package:giasu_vn/widgets/dialog_time.dart';
import 'package:giasu_vn/widgets/drop_down_select.dart';
import 'package:intl/intl.dart';

class MessageScreen extends StatelessWidget {
  NavigationController navigationController = Get.find();

  final f = new DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageController>(
        init: MessageController(),
        builder: (controller) => GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
            child: SafeArea(
              child: Scaffold(
                  backgroundColor: AppColors.greyf6f6f6,
                  appBar: AppBar(
                    backgroundColor: AppColors.primary4C5BD4,
                    title: Text(
                      'Tin nhắn',
                      style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
                    ),
                    automaticallyImplyLeading: false,

                  ),
                  body: Container(
                    padding: EdgeInsets.all(AppDimens.padding16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Image.asset(Images.img_message_app),
                        ),
                        Text(
                          'Chức năng đang được phát triển',
                          style: AppTextStyles.regularW500(context, size: AppDimens.textSize20, color: AppColors.grey747474),
                        )
                      ],
                    ),
                  )),
            )));
  }
}

Widget SelectTinhThanh(BuildContext context) {
  PostController postController = Get.put(PostController());
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
    body: Container(
      padding: EdgeInsets.symmetric(vertical: AppDimens.space32, horizontal: AppDimens.padding16),
      child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => InkWell(
                // ignore: deprecated_member_use
                onTap: () {
                  postController.provincial.text = listDataCity[index].citName;
                  postController.idProvincial = int.parse(listDataCity[index].citId);
                  postController.getListDistrict(int.parse(listDataCity[index].citId));

                  Get.back();
                },
                child: SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        listDataCity[index].citName,
                        style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
                      ),
                      Spacer(),
                      listDataCity[index].citName == postController.provincial.text ? SvgPicture.asset(Images.ic_check_green) : Container()
                    ],
                  ),
                ),
              ),
          separatorBuilder: (context, index) => Divider(
                thickness: 1,
                color: AppColors.black12,
              ),
          itemCount: listDataCity.length),
    ),
  ));
}

// ignore: non_constant_identifier_names
// Widget SelectDistrict(BuildContext context) {
//   PostController postController = Get.put(PostController());
//   List<String> list = ['Hai bà trưng', 'Hoàng Mai', 'Tây Hồ', 'Ba Đình'];
//   return SafeArea(
//       child: Scaffold(
//     backgroundColor: AppColors.greyf6f6f6,
//     appBar: AppBar(
//       backgroundColor: AppColors.primary4C5BD4,
//       title: Text(
//         'Quận, Huyện',
//         style: AppTextStyles.regularW500(context, size: AppDimens.textSize24, lineHeight: AppDimens.textSize28, color: AppColors.whiteFFFFFF),
//       ),
//       leading: IconButton(
//         icon: SvgPicture.asset(Images.ic_arrow_left_iphone),
//         onPressed: () {
//           Get.back();
//         },
//       ),
//     ),
//     body: Container(
//       padding: EdgeInsets.symmetric(vertical: AppDimens.space32, horizontal: AppDimens.padding16),
//       child: ListView.separated(
//           physics: BouncingScrollPhysics(),
//           itemBuilder: (context, index) => InkWell(
//                 // ignore: deprecated_member_use
//                 onTap: () {
//                   postController.district.text = postController.listDistrict[index].citName;
//                   postController.idDistrict = int.parse(postController.listDistrict[index].citId);
//                   Get.back();
//                 },
//                 child: SizedBox(
//                   height: 30,
//                   child: Row(
//                     children: [
//                       Text(
//                         postController.listDistrict[index].citName,
//                         style: AppTextStyles.regularW400(context, size: AppDimens.padding16, color: AppColors.black),
//                       ),
//                       Spacer(),
//                       postController.listDistrict[index].citName == postController.district.text ? SvgPicture.asset(Images.ic_check_green) : Container()
//                     ],
//                   ),
//                 ),
//               ),
//           separatorBuilder: (context, index) => Divider(
//                 thickness: 1,
//                 color: AppColors.black12,
//               ),
//           itemCount: postController.listDistrict.length),
//     ),
//   ));
// }

// DialogImage() {
//   BuildContext context = Get.context;
//   var width = MediaQuery.of(context).size.width;
//   var height = MediaQuery.of(context).size.height;
//   return GetBuilder<PostController>(
//     init: PostController(),
//     builder: (controller) => Dialog(
//         insetPadding: EdgeInsets.only(top: 10.0),
//         backgroundColor: Colors.transparent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             color: Colors.white,
//           ),
//           margin: EdgeInsets.symmetric(horizontal: 14),
//           padding: EdgeInsets.symmetric(horizontal: 15),
//           width: width,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               SizedBox(height: 15),
//               controller.imageAvatar == null
//                   ? Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppDimens.space100), border: Border.all(color: AppColors.primary4C5BD4, width: 0.5)),
//                       child: Center(
//                           child: SvgPicture.asset(
//                         Images.ic_add_camera,
//                         width: 60,
//                         height: 60,
//                         color: AppColors.grey747474,
//                       )))
//                   : ClipRRect(
//                       borderRadius: BorderRadius.circular(100),
//                       child: Image.file(
//                         controller.imageAvatar,
//                         width: 100,
//                         height: 100,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//               SizedBox(height: 65),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         controller.imgFromCamera();
//                       },
//                       child: Text(
//                         'Chụp ảnh trực tiếp',
//                         style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.black),
//                       )),
//                   SizedBox(width: 36),
//                   InkWell(
//                       onTap: () {
//                         controller.imgFromGallery();
//                       },
//                       child: Text(
//                         'Ảnh trong thư viện',
//                         style: AppTextStyles.regularW500(context, size: AppDimens.textSize16, color: AppColors.primary4C5BD4),
//                       )),
//                 ],
//               ),
//               SizedBox(height: 65),
//               Container(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: SizedBox(
//                         height: height * 0.06,
//                         child: CustomButton1(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           title: 'Hủy',
//                           textColor: AppColors.black,
//                           color: AppColors.grey747474,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 16,
//                     ),
//                     Expanded(
//                       child: SizedBox(
//                         height: height * 0.06,
//                         child: CustomButton2(
//                           onPressed: () {
//                             // controller.avatar = controller.imageAvatar;
//                             controller.changeAvatar();
//                             controller.errorImage = false;
//                             // controller.uploadAvatar();
//                             Get.back();
//                           },
//                           title: 'Cập nhật',
//                           textColor: AppColors.whiteFFFFFF,
//                           color: AppColors.primary4C5BD4,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16),
//             ],
//           ),
//         )),
//   );
// }
