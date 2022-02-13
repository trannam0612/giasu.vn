import 'package:intl/intl.dart';

class Convert {
  static String convertTempDate(int timeInMillis, String style) {
    var date = new DateTime.fromMicrosecondsSinceEpoch(timeInMillis * 1000000);
    var formattedDate = DateFormat(style,'vi').format(date);
    return formattedDate;
  }

  static String convertTempDate2(int timeInMillis, String style) {
    var date = new DateTime.fromMicrosecondsSinceEpoch(timeInMillis * 1000);
    var formattedDate = DateFormat(style,'vi').format(date);
    return formattedDate;
  }

  static String convertDateTime(DateTime value, String style) {
    var convertTime = DateFormat(style,'vi').format(value).toString();
    return convertTime;
  }
  // static String? convertDateTime2(DateTime? value, String? style) {
  //   DateFormat dateFormat;
  //   dateFormat =  DateFormat.yMMMMEEEEd('vi');
  //   var convertTime = dateFormat.format(value!);
  //
  //   return convertTime;
  // }

  static String convertStringTime(String timeString, String style) {
    var inputFormat = DateFormat('MM/dd/yyyy HH:mm:ss');
    var inputDate = inputFormat.parse(timeString);
    var convertTime = DateFormat(style).format(inputDate).toString();

    return convertTime;
  }


}
