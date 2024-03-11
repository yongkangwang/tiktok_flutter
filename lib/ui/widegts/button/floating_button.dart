
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:bili_flutter/ui/sheard/app_theme.dart';

import 'package:bili_flutter/core/third/shared_preference/shared_preference_util.dart';
import 'package:bili_flutter/core/third/shared_preference/preference_keys.dart';

class AKFloatingActionButton extends StatelessWidget {
  const AKFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return SpeedDial(
      icon: Icons.add,
      backgroundColor: AKAppTheme.norMainThemeColors,
      children: [
        SpeedDialChild(
          label: '切换语言',
          backgroundColor: AKAppTheme.norWhite01Color,
          child: Icon(Icons.abc,size: 10.r,),
          onTap: (){
            ///切换语言并保存语言至本地
            final locale = AKSharedPreferenceUtil.getString(AKSharedPreferenceKeys.locale);
            if (locale == 'zh') {
              Get.updateLocale(const Locale('en', 'US'));
              AKSharedPreferenceUtil.setString(AKSharedPreferenceKeys.locale, 'en');
            } else {
              Get.updateLocale(const Locale('zh', 'CN'));
              AKSharedPreferenceUtil.setString(AKSharedPreferenceKeys.locale, 'zh');
            }

          },
        ),

        SpeedDialChild(
            label: '待定',
            backgroundColor: AKAppTheme.norBlue01Colors,
            onTap: (){

            }
        ),


      ],

    );


  }
}
