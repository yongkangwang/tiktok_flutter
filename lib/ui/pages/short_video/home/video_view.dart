


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';



import 'package:bili_flutter/core/I18n/str_res_keys.dart';
import 'package:bili_flutter/ui/sheard/app_theme.dart';
import '../../../../core/third/event/event_bus.dart';
import 'video_logic.dart';

import '../../../sheard/image_assets.dart';

import 'package:bili_flutter/ui/widegts/view/primary_scroll_container.dart';
import '../attention/attention_video_view.dart';
import '../recommend/commend_video_view.dart';
import '../../../widegts/view/keep_alive_view.dart';

import '../../main/mainScroll/main_scroll_logic.dart';

class VideoPage extends StatelessWidget  {
  VideoPage({Key? key}) : super(key: key);

  static final String routeName = '/VideoPage';


  final logic = Get.find<VideoLogic>();
  final state = Get.find<VideoLogic>().state;


  final mainScrollLogic = Get.find<Main_scrollLogic>();

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Container(
      child: Stack(

        children: [
          // Expanded(child: buildHomeTabbarView()),
          buildHomeTabbarView(),
          Container(
            height: 100,
              child: buildNavAppBar())
      
        ],
      ),
    );


/*
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: buildNavAppBar(),
      body: buildHomeTabbarView(),
    );
    
 */

  }


  // 顶部导航栏
  AppBar buildNavAppBar() {

    return AppBar(
      // backgroundColor: Colors.orange,
      backgroundColor: Colors.transparent,

      title: Container(
        // color: Colors.blue,
        child: Row(

          children: [
            IconButton(
              onPressed: (){},
              icon: Image.asset(
                AKImageAssets.homeAppBarLeft1PNG,
                width: 20,
                height: 20,
              ),

            ),
            10.horizontalSpace,
            Expanded(
                child: Container(
                  // color: Colors.red,

                  alignment: Alignment.topCenter,      ///对齐在顶部中间
                  child: buildHomeTabBar(),

                )
            ),

            IconButton(
                onPressed: (){},
                icon: Image.asset(
                  AKImageAssets.homeAppBarRight2PNG,
                  width: 20,
                  height: 20,
                )
            ),

          ],
        ),
      ),
    );
  }



//  首页顶部tab栏
  Widget buildHomeTabBar(){

    return TabBar(
      controller: logic.tabController,
      tabs: [
        Tab(text: '关注',),
        Tab(text: AKSr.recommend.tr.toUpperCase(),),

      ],

//        指示器颜色
      indicatorColor: AKAppTheme.norMainThemeColors,
      // 非选中文字颜色
      unselectedLabelColor: AKAppTheme.unselectedLabelColor,
      // 选中tab文字颜色
      labelColor: AKAppTheme.norMainThemeColors,
      // 指示器大小计算方式
      indicatorSize: TabBarIndicatorSize.label,
      // //指示器宽度
      indicatorWeight: 3.r,
      isScrollable: true,
      labelStyle: TextStyle(
        fontSize: 18,//字体设置不一样大会导致抖动
        color: AKAppTheme.norMainThemeColors,
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 18,
        color: AKAppTheme.norMainThemeColors,
        fontWeight: FontWeight.normal,

      ),


    );

    // return Text('slkjaslkdfjaklsjdflksajdflkasjdflkasjdflks');
  }


  // 顶部标签栏对应的内容
  Widget buildHomeTabbarView(){
    return NotificationListener(
      child: TabBarView(
        controller: logic.tabController,
        children: [
          // Attention_videoPage(),
          // Commend_videoPage(),
          KeepAliveWrapper(child: Attention_videoPage()),
          KeepAliveWrapper(child: Commend_videoPage()),

          /*
          PrimaryScrollContainer(
            key: state.keyAttention,
            child:  Attention_videoPage(),
          ),
          PrimaryScrollContainer(
            key: state.keyRecommend,
            child: Commend_videoPage(),
          ),

           */

        ],
      ),

      onNotification:(overscroll){

        if (overscroll is OverscrollNotification && overscroll.overscroll != 0 && overscroll.dragDetails != null) {
          if(overscroll.overscroll > 0){
            EventAppBus.eventVideo.fire(EventVideoPauseEvent('videoPause'));
            mainScrollLogic.pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
          }else {
            mainScrollLogic.pageController.previousPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
          }
          // print('overscroll==== ${overscroll.overscroll}');

        }

        return true;
      },

    );


  }




}
