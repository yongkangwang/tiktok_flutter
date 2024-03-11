
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'package:bili_flutter/core/I18n/str_res_keys.dart';

class AKInitalizeItems {

  static final List<BottomNavigationBarItem> items = [

    buildBottomNavigationBarItem(AKSr.home.tr.toUpperCase(), 'home'),
    buildBottomNavigationBarItem(AKSr.video.tr.toUpperCase(), 'home'),

  ];


}


BottomNavigationBarItem buildBottomNavigationBarItem (String title,String iconNmae){
  return BottomNavigationBarItem(
    label: title,
    icon: Image.asset(
      "assets/image/tabbar/${iconNmae}_custom.png",
      //gaplessPlayback: 原图片保持不变，直到图片加载完成时替换图片，这样就不会出现闪烁
      gaplessPlayback: true,
      width: 18.sp,
      height: 18.sp,
    ),
    activeIcon: Image.asset(
      "assets/image/tabbar/${iconNmae}_selected.png",
      gaplessPlayback: true,
      width: 18.sp,
      height: 18.sp,
    ),


  );



}


