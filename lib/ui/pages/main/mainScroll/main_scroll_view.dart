import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_scroll_logic.dart';

import '../home/main_view.dart';
import '../../my/home/user_view.dart';
import '../../my/home/user_logic.dart';
import 'package:bili_flutter/ui/pages/home/recommend/recommend_view.dart';

import '../../publish/home/publish_view.dart';
import '../../../widegts/view/keep_alive_view.dart';

class Main_scrollPage extends StatelessWidget {
  Main_scrollPage({Key? key}) : super(key: key);

  static final String routeName = '/Main_scrollPage';

  final logic = Get.find<Main_scrollLogic>();
  final state = Get.find<Main_scrollLogic>().state;

  UserLogic _userPageController = Get.put(UserLogic());

  @override
  Widget build(BuildContext context) {
    // return Container();
    print('scrollPageViewScrollPage  == ${logic.scrollPageViewScrollPage.value}');

    return GetBuilder<Main_scrollLogic>(
        builder: (logic){
          print('scrollPageViewScrollPage  == ${logic.scrollPageViewScrollPage.value}');
          return Stack(
            children: [
              PageView(
                controller: logic.pageController,
                // ClampingScrollPhysics没有跃出屏幕拉伸反弹效果，
                physics: logic.scrollPageViewScrollPage.value ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
                // physics: logic.scrollPageViewScrollPage.value ? null : NeverScrollableScrollPhysics(),
                children: [
                  KeepAliveWrapper(child: PublishPage()),
                  KeepAliveWrapper(child: MainPage()),
                  KeepAliveWrapper(child: UserPage(isLoginUser: true,)),

                ],
                // children: [MainPage(pageController:_pageController), UserPage(pageController:_pageController,isLoginUser: false,)],

              ),


/*
              Positioned(
                  top: 200,
                  child: Text('scrollPageVi ${logic.scrollPageViewScrollPage}',style: TextStyle(fontSize: 16),)
              ),
              Positioned(
                  top: 200,
                  child: Text('scrollPageVi ',style: TextStyle(fontSize: 16),)
              ),

 */

              // 第一种方法，监听scrollPageViewScrollPage 变化
              // 1、定义obx变量，2监听obx变量，这就可以了,
              // Obx(() => Positioned(
              //     top: 250,
              //     child: Text('data ${logic.scrollPageViewScrollPage}',style: TextStyle(fontSize: 16),))
              // ),

              // 第二种方法
              //     view要使用GetBuilder，在更新logic变量时，只需需要update一下即可。
              // 两种方法区别
              // 相同点是：包裹的组件会全部重新build，没有包裹的不会build
              //不同点： Obx更局部性，更轻量型，如果组件内只用到少量变量，就可以使用这个
              // GetBuilder，更重量型，如果组件内用到很多变量，就可以使用这个，

              //抽屉效果
              // buildDrawerController(),

            ],

          );


        }
    );



  }



  DrawerController buildDrawerController() {
    return DrawerController(
                alignment: DrawerAlignment.start,
                isDrawerOpen: _userPageController.showRightMenu.value,
                drawerCallback: (isOpened){
                  _userPageController.toggleRightMenu();
                },
                child: RecommendPage()
            );
  }





}
