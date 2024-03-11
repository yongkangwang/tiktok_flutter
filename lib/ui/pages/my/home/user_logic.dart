

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'user_state.dart';


class UserLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final UserState state = UserState();

  
  

  //是否展示AppBar的title
  var showTitle = false.obs;
  //是否展示右边的菜单
  var showRightMenu = false.obs;

  final ScrollController scrollController = ScrollController();
  late TabController tabController;
  final PageController pageController = PageController(keepPage: true);


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // 初始化

    // 监听单个变量的值，  // 监听count的值,当它发生改变的时候调用
    ever(showRightMenu, (callback) =>print('showRightMenu 改变了$showRightMenu'));
    tabController = TabController(length: 2, vsync: this ,initialIndex: 0);

    // scrollController.addListener(() {
    //   double position =scrollController.offset;
    //   bool showTitle = userPageController.showTitle.value;
    //   if(position >  145 && !showTitle){
    //     userPageController.setShowTitle(true);
    //   }else if(position <  145 && showTitle){
    //     userPageController.setShowTitle(false);
    //   }
    // });



  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  //   加载完成
  }
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  //   控制器被释放

  }
  
  

  void setShowTitle(bool show){
    showTitle.value = show;
  }

  void toggleRightMenu(){
    showRightMenu.value = !showRightMenu.value;
  }


}
