import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../fragmentbar.dart';
import 'lang_selector.dart';

class HelperFunc {
  //check connection
  static Future<bool> checkNetwork() async {
    bool chk;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        showToast("Connection fine", Colors.green);
        chk = true;
      }
    } on SocketException catch (_) {
      print('not connected');
      showToast("No Connection", Colors.red);
      chk = false;
    }
    return chk;
  }

  static showToast(String msg, Color col) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: col,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  //move to setting
  static void reopenSetting(BuildContext context) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => LanguageSelector()));
  }

//move to More
  static void reopenMoreInfo(BuildContext context) async {
   Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Fragmentnaql()));
  }

  //set lang firest
  static void setFirstLang() async {
    SharedPreferences sPref = await SharedPreferences.getInstance();
    sPref.setString("defLangCode", "en");
    sPref.setString("defLangCountry", "US");
  }

  //set lang def
  static void updateDefLang(String locCode, String locCountry) async {
    SharedPreferences sPref = await SharedPreferences.getInstance();
    sPref.setString("defLangCode", locCode);
    sPref.setString("defLangCountry", locCountry);
  }

  //line
  static Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.grey.withOpacity(.8),
        ),
      );
}
