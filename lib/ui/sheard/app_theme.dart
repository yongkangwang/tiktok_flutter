


import 'package:flutter/material.dart';
import '../sheard/means.dart';

class AKAppTheme{





  // 1.共有属性
  static const double bodyFontSize = 14;
  static const double normalFontSize = 16;
  // static const double normalFontSize = 20;
  static const double largeFontSize = 20;
  static const double xlargeFontSize = 30;



  ///粉色（主题色）
  static const Color norMainThemeColors = Color.fromRGBO(253, 105, 155, 1);

  static const Color norRedColor_3 = Color.fromARGB(255, 254,44,85);

  //  黑色 默认文字颜色
  static const Color norTextColors = Colors.black;
  static const Color unselectedLabelColor = Color.fromRGBO(95, 95, 95, 1);
  static const Color norBlackColors = Colors.black;


  static const Color norWhite01Color = Colors.white;
  static const Color norWhite02Color = Color.fromRGBO(246, 247, 249, 1);
  static const Color norWhite05Color = Color.fromRGBO(254, 244, 234, 1);
  static const Color norWhite06Color = Color.fromRGBO(241, 242, 244, 1);

  // 灰色
  static const Color norGrayColor = Color.fromRGBO(149, 149, 149, 1);


  ///蓝色
  static const Color norBlue01Colors = Color.fromRGBO(44, 158, 221, 1);


  ///阴影
  static BoxShadow norBoxShadow = BoxShadow(
    color: AKAppTheme.norTextColors.withOpacity(.1),
    blurRadius: 3,
    spreadRadius: 1,
    offset: const Offset(0, 0),
  );


  // 2.普通模式
  static final ThemeData norTheme = ThemeData(
    useMaterial3: true,
    // primarySwatch传入不是Color, 而是MaterialColor，是继承于Color的
    // 包含了primaryColor和accentColor
    // 设置完之后，导航条的颜色，TabBar的颜色，Switch的颜色，floatingActionButton的颜色都会改变
    // primarySwatch: Colors.red,//pick
  // 为主题色的一个样本色，通过样本色可以定义主题色
    primarySwatch: createMaterialColor(norMainThemeColors),
    // 可用于配置大多数组件的颜色属性
    // colorScheme: ColorScheme.fromSeed(seedColor: norMainThemeColors),

    // primaryColor: 单独设置导航和TabBar的颜色，会覆盖primarySwatch
    primaryColor: norWhite01Color,

    // 这个是所有页面的背景颜色
    canvasColor: norWhite06Color,

    // 文本字体
    // fontFamily: 'biliFonts',

    // 文本框中文本选择的颜色，如TextField
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: norMainThemeColors,
      selectionColor: norBlue01Colors.withOpacity(.5)
    ),


  );



  // 3.暗黑模式

  static final Color darkTextColors = Colors.green;

  static final ThemeData darkTheme = ThemeData(
      primaryColor: Colors.grey,
      textTheme: TextTheme(
        displaySmall: TextStyle(fontSize: bodyFontSize,color: darkTextColors),

      )

  );


}