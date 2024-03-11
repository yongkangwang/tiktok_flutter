import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'core/third/shared_preference/shared_preference_util.dart';
import 'core/third/shared_preference/preference_keys.dart';
import 'package:bili_flutter/core/I18n/string_res.dart';


import 'package:bili_flutter/ui/sheard/app_theme.dart';
import 'package:bili_flutter/core/router/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




Size defaultSize = const Size(375, 667);

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


void main() {
  // 需要初始化Binding后才能对AKSharedPreferenceUtil初始化
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){

  }else{
      AKSharedPreferenceUtil.initSharedPreference();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(

      ///与键盘是否遮挡输入框有关
      rebuildFactor: RebuildFactors.sizeAndViewInsets,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: defaultSize,

      builder: (context,child){
        ///保存本地语言
         String? locale = AKSharedPreferenceUtil.getString(AKSharedPreferenceKeys.locale);
        if(locale!.isEmpty){
          AKSharedPreferenceUtil.setString(AKSharedPreferenceKeys.locale, 'zh');
        }

        return GetMaterialApp(
          key: navigatorKey,

          // title: '六道高仿',
          theme: AKAppTheme.norTheme,

          // home: MyHomePage(title: 'kkk'),

          ///去掉右上角的debug
          debugShowCheckedModeBanner: false,
          // 起始路由
          initialRoute: AKRouter.initalRoute,
          getPages: AKRouter.getPages,
          // routes

          // i18n国际化
          translations: StringRex(),
          locale: locale == 'en' ? Locale('en','US') : Locale('zh','CN'),

          // locale: Locale('zh','CN'),
          // 在配置错误的情况下 显示的语言
          // fallbackLocale: Locale("zh",'CN'),
        );

      },

    );


  }
}

