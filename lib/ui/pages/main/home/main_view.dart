
// 系统
import 'package:bili_flutter/ui/pages/short_video/home/video_view.dart';
import 'package:bili_flutter/ui/sheard/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 第三方
import 'package:get/get.dart';
import 'package:animations/animations.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// 第三方封装
import 'package:bili_flutter/core/third/shared_preference/shared_preference_util.dart';
import 'package:bili_flutter/core/third/shared_preference/preference_keys.dart';

import 'package:bili_flutter/ui/widegts/button/floating_button.dart';

// 自定义
import 'main_logic.dart';
import 'AKInitalizeItems.dart';
import 'package:bili_flutter/core/I18n/str_res_keys.dart';
import '../../home/home/home_view.dart';

import '../mainScroll/main_scroll_logic.dart';

class MainPage extends StatelessWidget {
  // MainPage({Key? key}) : super(key: key);


  MainPage({this.scrollPageController});
  final PageController? scrollPageController;

  static final String routeName = '/main';

  final logic = Get.find<MainLogic>();
  final state = Get.find<MainLogic>().state;

  final main_scrollLogic = Get.find<Main_scrollLogic>();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MainLogic>(
      builder: (logic){
        return buildScaffold(logic);

        // return  buildSafeArea(logic);

      }

    );

  }

  SafeArea buildSafeArea(MainLogic logic) {
    // 为了解决不同屏幕的问题，Flutter有了SafeArea，
    // 在SafeArea的child里面进行布局，就不会受屏幕的影响，内容不会被遮盖住。
    // 但是感觉不好用
    return SafeArea(
      child: Scaffold(

          // animation
          // body: state.mainIndexStackPages[state.currentIndex],
          body: PageTransitionSwitcher(
            transitionBuilder: (child, animation, secondaryAnimation){
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child: state.mainIndexStackPages[state.currentIndex],
          ),


          bottomNavigationBar: BottomNavigationBar(
            // items: AKInitalizeItems.items,
            // items数组不能单独抽出去，会导致i180国际化失效
            items: [
              buildBottomNavigationBarItem(AKSr.home.tr.toUpperCase(), 'home'),
              buildBottomNavigationBarItem(AKSr.video.tr.toUpperCase(), 'home'),
            ],
            currentIndex: state.currentIndex,
            selectedItemColor: AKAppTheme.norMainThemeColors,
            onTap: (index){
              logic.updateCurrentIndex(index);
            },

          ),


          floatingActionButton: AKFloatingActionButton(),


        ),
    );
  }

  Scaffold buildScaffold(MainLogic logic) {
    // return SafeArea(child:TextButton(onPressed: (){print('点击了');}, child: Text('data=======')));

    return Scaffold(

      // animation
      //   body: state.mainIndexStackPages[state.currentIndex],
        body: buildPageTransitionSwitcher(),
        bottomNavigationBar: buildBottomNavigationBar(logic),
        extendBody: true,
        primary: true,


        // floatingActionButton: AKFloatingActionButton(),
/*
      body:Stack(
        // bottomEnd导致首页整个页面无法响应事件了
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          buildPageTransitionSwitcher(),
          buildBottomNavigationBar(logic)//在模拟器iPhone8plus上首页无法响应事件，真机上运行正常

          /*
          Positioned(
            left: 0,
            right: 0,
            bottom: 0.1,//设置为0会导致首页无法响应事件，
              child: buildBottomNavigationBar(logic)
          )

           */

        ],
      ),


 */

      );

  }

  PageTransitionSwitcher buildPageTransitionSwitcher() {
    return PageTransitionSwitcher(
          transitionBuilder: (child, animation, secondaryAnimation){
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
          },
          child: state.mainIndexStackPages[state.currentIndex],
      );
  }

  BottomNavigationBar buildBottomNavigationBar(MainLogic logic) {
    return BottomNavigationBar(
      // backgroundColor: Color.fromRGBO(255, 255, 255, 0.00001),
        backgroundColor: state.currentIndex == 0 ? Colors.transparent : Colors.white,

        // items: AKInitalizeItems.items,
        // items数组不能单独抽出去，会导致i180国际化失效
        items: [
          buildBottomNavigationBarItem(AKSr.home.tr.toUpperCase(), 'home'),
          buildBottomNavigationBarItem(AKSr.video.tr.toUpperCase(), 'home'),
          buildBottomNavigationBarItem(AKSr.my.tr.toUpperCase(), 'home'),

        ],
        currentIndex: state.currentIndex,
        selectedItemColor: AKAppTheme.norMainThemeColors,
        unselectedItemColor: state.currentIndex == 0 ?Colors.white:Colors.black,
        onTap: (index){
          print('底部导航点击了$index');
          logic.updateCurrentIndex(index);
          main_scrollLogic.selectIndexBottomBarMainPage(index);

        },

      );
  }





}


BottomNavigationBarItem buildBottomNavigationBarItem (String title,String iconNmae) {
  return BottomNavigationBarItem(
    label: title,
    // backgroundColor: Colors.red,

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

