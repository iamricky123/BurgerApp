import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:Burger_App/common/custom_print_log.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GlobalFunction {
  static DateTime? convertDate(String date){
    if(date != null && date.isNotEmpty){
      String tempDOB = date.substring(0,8) + 'T' + date.substring(8);
      return DateTime.parse(tempDOB);
    }else{
      return null;
    }
  }

  static String convertToThousandSeparatorString(dynamic d){
    var formatter = NumberFormat("#,##0.00", "en_US");
    return formatter.format(d);
  }

  static String greetingByTime() {
    int hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    }
    if (hour < 17) {
      return "Good Afternoon";
    }
    return "Good Evening";
  }

  static Future<bool> internetConnectionStatus() async {
    var connectionResult = await (Connectivity().checkConnectivity());
    if(connectionResult == ConnectivityResult.wifi){
      CustomLog.customPrintLog('Internet Connection Status', 'Connected to Wifi');
      return true;
    }
    if(connectionResult == ConnectivityResult.mobile){
      CustomLog.customPrintLog('Internet Connection Status', 'Connected to Mobile Data');
      return true;
    }
    CustomLog.customPrintLog('Internet Connection Status', 'No Internet Connection');
    return false;
  }

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

enum ResponseStatus {
  LOADING,
  COMPLETE,
  ERROR
}