import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'user_logic.dart';


import '../../../sheard/image_assets.dart';
import '../../../sheard/app_theme.dart';

import '../../main/mainScroll/main_scroll_logic.dart';
import '../widget/my_user_info_widget.dart';
import '../widget/my_user_head_widget.dart';

class UserPage extends StatelessWidget {

  static final String routeName = '/UserPage';

  // UserPage({Key? key}) : super(key: key);
  UserPage({
     this.isLoginUser = false

});

  final bool? isLoginUser;




  final logic = Get.find<UserLogic>();
  final state = Get.find<UserLogic>().state;

  final mainScrollLogic = Get.find<Main_scrollLogic>();

  @override
  Widget build(BuildContext context) {
    print('UserPage===   build ');


    return Scaffold(
      backgroundColor: Colors.transparent,

      // backgroundColor: Colors.red,
      // appBar: buildNavAppBar(),
      // body: Container(
      //   color: Colors.yellow,
      // ),

      body: CustomScrollView(

        controller: logic.scrollController,
        // physics: BouncingScrollPhysics(),
        slivers: [
          _getSliverAppBar(),
          _getSliverUserInfo(),
          _getTabBar(),
          _getTabView()
        ],
      ),

    );
  }

  // 顶部导航栏
  Widget _getSliverAppBar() {
    print('_getSliverAppBar顶部导航栏===   build ');
    print('_getSliverAppBar顶部导航栏===${logic.titleString.value}');

    return SliverAppBar(
      // brightness:Brightness.dark,
      backgroundColor:Colors.white,
      pinned: true,//标题栏是否固定，表示SliverAppBar在滚动的过程中是否会固定在界面的边缘。
      expandedHeight: 200,//合并的高度，默认状态栏的高度加appbar高度
      elevation: 0,//阴影
      // stretch: true：SliverAppBar完全展开后是否可以继续拉伸，
      //现在好像不需要外部组件设置physics了, 注意这个需要外部滑动组件physics的支持（设置BouncingScrollPhysics()，滑动到标界可以继续滑动拥有回弹效果），否则是不会生效的
      stretch: true,
      // FlexibleSpaceBar 这里就是用于实现滚动折叠的效果的地方
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(AKImageAssets.myTopBackgroundImage,fit: BoxFit.fill,),
        // background: UserHeadInfoWidget(),
      ),
      actions: [
        IconButton(
            onPressed: (){},
            icon: Image.asset(AKImageAssets.myTopRightMore_s)
        ),
        IconButton(
            onPressed: (){},
            icon: Image.asset(AKImageAssets.myTopRightSearch_s)
        ),
      ],

      title:  Container(
        // width: 100,
        child: Row(

            children: [
            isLoginUser == true ? IconButton(
                onPressed: (){
                  mainScrollLogic.pageController.previousPage(duration: Duration(milliseconds: 200), curve: Curves.linear);
                  // logic.titleString.value = '改变';
                  // print('改变了string');
                },
                icon: Image.asset(AKImageAssets.myTopLeftBackIcon)
            ):Container(),
            Text('名字'),
            SizedBox(width: 80,),
            Text('个人主页'),
            // Obx(() => Text(logic.titleString.value))

          ],
        ),
      )

      // Container(
      //   child: Text('标题'),
      // ),


    );
  }

  // 用户信息
  Widget _getSliverUserInfo() {
    print('_getSliverUserInfo===   build ');

    return SliverToBoxAdapter(
      child: Container(
        height: 300,
        color: Colors.transparent,
        // color: Colors.teal,
        // child: Text('用户信息'),
        child: MyUserInfoWidget(),
      ),
    );
  }

  // 标签栏
  Widget _getTabBar() {
    print('标签栏===   build ');

    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(
          child: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: Container(
                color: Colors.white,
                // child: Text('作品       喜欢'),
                child: TabBar(
          //        指示器颜色
                  indicatorColor: AKAppTheme.norMainThemeColors,
                  // 非选中文字颜色
                  // unselectedLabelColor: AKAppTheme.unselectedLabelColor,
                  // 选中tab文字颜色
                  // labelColor: AKAppTheme.norMainThemeColors,
                  // 指示器大小计算方式
                  // indicatorSize: TabBarIndicatorSize.label,
                  // //指示器宽度
                  // indicatorWeight: 3.r,
                  // isScrollable: true,
                  labelStyle: TextStyle(fontSize: 16,color: AKAppTheme.norMainThemeColors),
                  unselectedLabelStyle: TextStyle(fontSize: 16,color: Colors.grey),
                  controller: logic.tabController,
                    tabs: [
                      Tab(
                        child: Text('作品'),
                      ),
                      Tab(
                        child: Text('喜欢'),
                      ),
                    ],
                  onTap: (index){
                    logic.pageController.animateToPage(
                        index, duration: Duration(milliseconds: 200),
                        curve: Curves.linear);
                  },
                ),
              )
          )
      ),
    );
  }

  //标签栏对应的内容
  Widget _getTabView(){
    print('标签栏对应的内容===   build ');

    return SliverToBoxAdapter(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: ScreenUtil().screenWidth,
          minWidth: ScreenUtil().screenWidth,
          maxHeight: ScreenUtil().screenHeight
        ),
        child: PageView.builder(
            itemCount: 2,
            controller: logic.pageController,
            onPageChanged: (index){
              logic.tabController.animateTo(index);
            },
            itemBuilder: (context,index){
              return Container(
                color: index==0?Colors.orange:Colors.cyanAccent,
              );
            }
        ),
      ),
    );
  }


  void kkk(){
    RepaintBoundary();
}


}


class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
