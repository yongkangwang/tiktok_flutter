
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'main_scroll_state.dart';

class Main_scrollLogic extends GetxController {
  final Main_scrollState state = Main_scrollState();

  late PageController pageController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController(initialPage: 1,keepPage: true);

  }



  //MainPage的底部导航当前选中bar的位置
  var indexBottomBarMainPage = 0;

  //ScrollPage是否可以滑动
  var scrollPageViewScrollPage = true.obs;

  //视频播放页的高度
  var videoViewHeight = 0.0.obs;

  //当前播放视频的用户model


  //设置当前播放视频的用户model


  //设置视频播放页视频的高度
  void setVideoViewHeight(double height){
    videoViewHeight.value = height;
  }

  //MainPage底部导航选中指定的bar
  void selectIndexBottomBarMainPage(int index){
    if(index == 0){
      updateScrollPageScrollState(true);
    }else{
      updateScrollPageScrollState(false);
    }
    print('selectIndexBottomBarMainPage == $index');
    update();
    //刷新数据必须要update,不然组件依赖的数据不会更新
    // view要使用GetBuilder
  }

  //ScrollPage的PageView是否可以滑动
  void updateScrollPageScrollState(bool scroll){
    scrollPageViewScrollPage.value = scroll;
  }



}
