import 'package:flutter/services.dart';


import 'package:bili_flutter/ui/sheard/app_theme.dart';

///沉浸式体验（设置状态栏颜色和字体颜色）
class SystemUiOverlayStyleUtil {
  SystemUiOverlayStyleUtil._internal();

  static final SystemUiOverlayStyleUtil _instance =
      SystemUiOverlayStyleUtil._internal();

  factory SystemUiOverlayStyleUtil() => _instance;

  ///主题色状态栏
  void setMainThemeSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AKAppTheme.norMainThemeColors,
      ),
    );
  }

  ///白色主题
  void setWhiteSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: AKAppTheme.norWhite01Color,
      ),
    );
  }

  ///黑色主题
  void setBlackSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AKAppTheme.norBlackColors,
      ),
    );
  }
}
