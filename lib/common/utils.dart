import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class Utils {
  static String getPhoneVn(String phone) {
    if (phone.startsWith("+84")) phone = phone.replaceFirst("+84", "0");
    return phone;
  }

  static showToast(String message, {Toast toastLength}) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        textColor: Colors.white,
        backgroundColor: Colors.grey[600],
        gravity: ToastGravity.BOTTOM,
        toastLength: toastLength ?? Toast.LENGTH_SHORT);
  }

  Future<bool> checkConnectionInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  var convert8 = NumberFormat('###,###,###,###,###,###.00000000#', 'en_US');
  var convert2 = NumberFormat('###,###,###,###,###,###.00#', 'en_US');
}