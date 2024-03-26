
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:bili_flutter/core/third/shared_preference/preference_keys.dart';


import 'home_logic.dart';

import 'package:bili_flutter/ui/sheard/image_assets.dart';
import 'package:bili_flutter/core/I18n/str_res_keys.dart';
import 'package:bili_flutter/ui/sheard/app_theme.dart';

import 'package:bili_flutter/ui/widegts/view/primary_scroll_container.dart';

import 'package:bili_flutter/ui/pages/home/recommend/recommend_view.dart';
import 'package:bili_flutter/ui/pages/home/cartoon/cartoon_view.dart';

import '../../../widegts/view/keep_alive_view.dart';


class HomePage extends StatefulWidget {
  // HomePage({Key? key}) : super(key: key);


  HomePage({this.scrollPageController});
  final PageController? scrollPageController;

  static final String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}
//混入
class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final logic = Get.find<HomeLogic>();

  final state = Get.find<HomeLogic>().state;

  late TabController tabController;



  late PageController  _pageController;



  @override
  void initState() {

    _pageController = PageController(initialPage: 2,keepPage: true);

    // TODO: implement initState
    // 使用this当做 TickerProvider需要给类添加 SingleTickerProviderStateMixin，
    // 也可以抽出来在GetxController中混入添加
    tabController = TabController(length: 2, vsync: this ,initialIndex: 0);
    tabController.addListener(() {
      for (int i = 0; i < state.scrollChildKeys.length; i++) {
        GlobalKey<PrimaryScrollContainerState> key = state.scrollChildKeys[i];
        if (key.currentState != null) {
          key.currentState?.onPageChange(tabController.index == i); //控制是否当前显示
        }
      }

    });
    super.initState();
    print('HomePage  initState');

  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.removeListener(() { });
    tabController.dispose();
    super.dispose();
    print('HomePage  dispose');

  }

  @override
  Widget build(BuildContext context) {
    print('HomePage  build');
    // 一个嵌套scrollview

    return Scaffold(
      appBar: buildHomeAppBar(),
      body: buildNestedScrollView(),
      // extendBody: true,
      // primary: true,

    );
  }



  NestedScrollView buildNestedScrollView() {
    return NestedScrollView(
        headerSliverBuilder: (context,innerBoxIsScrolled){
          return [
            SliverAppBar(
              title: buildHomeTabBar(),
              pinned: true,//AppBar是否置顶
              floating: false,//是否向下滑动时立即显示AppBar
              //当手指放开时，SliverAppBar是否会根据当前位置展开/收起
              snap: false,
              backgroundColor: AKAppTheme.norWhite01Color,
              elevation: 0,//阴影

            ),

          ];
        },
        body: buildHomeTabbarView(),

    );
  }

  // 首页导航栏
  AppBar buildHomeAppBar(){
    return AppBar(
      title: Container(
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
            5.horizontalSpace,
            // 填充
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                height: 40.r,
                decoration: BoxDecoration(
                  color: AKAppTheme.norWhite02Color,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Container(
                  padding: EdgeInsets.only(left: 15.r),

                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.search_sharp),
                      Text('六道'),
                    ],
                  ),
                ),

              ),
            ),


            IconButton(
                onPressed: (){},
                icon: Image.asset(
                  AKImageAssets.homeAppBarRight1PNG,
                  width: 20,
                  height: 20,
                ),
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
      controller: tabController,
      tabs: [
        Tab(text: AKSr.recommend.tr.toUpperCase(),),
        Tab(text: AKSr.cartoon.tr.toUpperCase(),)
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
        fontSize: 18,
        color: AKAppTheme.norMainThemeColors,
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        color: AKAppTheme.norMainThemeColors,
        fontWeight: FontWeight.normal,

      ),


    );

    // return Text('slkjaslkdfjaklsjdflksajdflkasjdflkasjdflks');
  }

  // 顶部标签栏对应的内容
  Widget buildHomeTabbarView(){
    print('buildHomeTabbarView  build');

    return TabBarView(
      controller: tabController,
      children: [
        // RecommendPage(),
        // CartoonPage()
        // 测试
        // KeepAliveWrapper(child: RecommendPage()),
        // KeepAliveWrapper(child: CartoonPage()),

        PrimaryScrollContainer(
            key: state.keyRecommend,
            child:  RecommendPage(),
          // child:  KeepAliveWrapper(child: RecommendPage()),

        ),
        PrimaryScrollContainer(
            key: state.keyCartoon,
            child: CartoonPage(),
          // child: KeepAliveWrapper(child: CartoonPage()),

        ),


      ],
    );

  }

  // 废弃的
  _getContent() {
    double contentHeight = MediaQuery.of(context).size.height;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: contentHeight,
      ),
      child: NotificationListener(
        child: PageView(
            controller: _pageController,
            children: [
              KeepAliveWrapper(child: RecommendPage()),
              KeepAliveWrapper(child: CartoonPage()),

              // RecommendPage(),
              // CartoonPage(),


            ],
            onPageChanged: (index) {
              tabController.animateTo(index);
            }),
        onNotification: (overscroll){
          if (overscroll is OverscrollNotification && overscroll.overscroll != 0 && overscroll.dragDetails != null) {
            if(overscroll.overscroll > 0){
              widget.scrollPageController!.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
            }else {
              widget.scrollPageController!.previousPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
              // widget.scrollPageController!.nextPage(duration: Duration(milliseconds: 200), curve: Curves.linear);

            }
          }
          return true;
        },
      ),
    );
  }






}
