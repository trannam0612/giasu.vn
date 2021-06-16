import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeAfterTeacherController extends GetxController {
  String userType = '1';
  String timeAgo(int timestamp) {
    var date = new DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000 * 1000);
    var now = new DateTime.now();
    var format = new DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    var time = DateTime.parse(format.format(date));
    var diff = now.difference(time)
    ;
    if (diff.inDays > 365) return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "năm" : "năm"} trước";
    if (diff.inDays > 30) return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "tháng" : "tháng"} trước";
    if (diff.inDays > 7) return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "tuần" : "tuần"} trước";
    if (diff.inDays > 0) return "${diff.inDays} ${diff.inDays == 1 ? "ngày" : "ngày"} trước";
    if (diff.inHours > 0) return "${diff.inHours} ${diff.inHours == 1 ? "giờ" : "giờ"} trước";
    if (diff.inMinutes > 0) return "${diff.inMinutes} ${diff.inMinutes == 1 ? "phút" : "phút"} trước";
    return "vừa xong";
  }

}