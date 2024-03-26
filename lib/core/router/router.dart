

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:bili_flutter/ui/pages/main/home/main_view.dart';
import 'package:bili_flutter/ui/pages/main/home/main_binding.dart';


import 'package:bili_flutter/ui/pages/home/home/home_view.dart';
import 'package:bili_flutter/ui/pages/home/home/home_binding.dart';

import 'package:bili_flutter/ui/pages/short_video/home/video_view.dart';
import 'package:bili_flutter/ui/pages/short_video/home/video_binding.dart';

import 'package:bili_flutter/ui/pages/home/recommend/recommend_view.dart';
import 'package:bili_flutter/ui/pages/home/recommend/recommend_binding.dart';

import 'package:bili_flutter/ui/pages/home/cartoon/cartoon_view.dart';
import 'package:bili_flutter/ui/pages/home/cartoon/cartoon_binding.dart';

import 'package:bili_flutter/ui/pages/short_video/attention/attention_video_view.dart';
import 'package:bili_flutter/ui/pages/short_video/recommend/commend_video_view.dart';

import 'package:bili_flutter/ui/pages/main/mainScroll/main_scroll_view.dart';
import 'package:bili_flutter/ui/pages/main/mainScroll/main_scroll_binding.dart';

import 'package:bili_flutter/ui/pages/my/home/user_view.dart';

import 'package:bili_flutter/ui/pages/mall/home/mall_logic.dart';
import 'package:bili_flutter/ui/pages/mall/home/mall_view.dart';


class AKRouter{


//  初始路由
//   static final String initalRoute = MainPage.routeName;
  static final String initalRoute = Main_scrollPage.routeName;
// getx注入

  static List<GetPage> getPages = [

    GetPage(
      name: Main_scrollPage.routeName,
      page: () => Main_scrollPage(),
      binding: Main_scrollBinding(),

    ),

    // 初始路由需要加binding，目的是加载MainLogic
    GetPage(
      name: MainPage.routeName,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    // 首页
    GetPage(
      name: HomePage.routeName,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    //短视频
    GetPage(
      name: VideoPage.routeName,
      page: () => VideoPage(),
      binding: VideoBinding(),
    ),

    GetPage(
      name: MallPage.routeName,
      page: () => MallPage(),
    ),


    //我的
    GetPage(
      name: UserPage.routeName,
      page: () => UserPage(),
    ),


    // 首页-推荐
    GetPage(
      name: RecommendPage.routeName,
      page: () => RecommendPage(),
      binding: RecommendBinding(),
    ),
    // 首页-动画
    GetPage(
      name: CartoonPage.routeName,
      page: () => CartoonPage(),
      binding: CartoonBinding(),
    ),

//========短视频
    GetPage(
        name: Attention_videoPage.routeName,
        page: () =>Attention_videoPage()
    ),
    GetPage(
        name: Commend_videoPage.routeName,
        page: () =>Commend_videoPage()
    )
  ];




}