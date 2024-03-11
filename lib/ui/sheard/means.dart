import 'package:flutter/material.dart';



///十六进制转为颜色
class ColorRadixChange {
  static Color hexColor(String hex, {double alpha = 1}) {
    int? val;
    if (hex.toUpperCase().contains("#")) {
      hex = hex.substring(1);
    }
    if (hex.toUpperCase().contains("0X")) {
      String desString = hex.substring(2);
      val = int.tryParse("0x$desString");
    } else {
      val = int.tryParse("0x$hex");
    }
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    return Color.fromRGBO((val! & 0xFF0000) >> 16, (val & 0x00FF00) >> 8,
        (val & 0x0000FF) >> 0, alpha);
  }
}



///共享一些通用的方法
///将Color转为MaterialColor
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}





///时间戳转为日期
String datetimeStampToYearMonthDay(int datetimeStamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(datetimeStamp);
  return "${dateTime.year}.${dateTime.month}.${dateTime.day}";
}
