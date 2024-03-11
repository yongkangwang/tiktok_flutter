

import 'package:bili_flutter/ui/sheard/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cartoon_state.dart';


import 'package:get/get.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

import 'package:bili_flutter/core/service/request/home_request.dart';
import '../../../../core/service/utils/constant.dart';
import '../../../sheard/params_sign.dart';
import '../../../../ui/sheard/image_assets.dart';
import '../../../../ui/sheard/means.dart';


import '../../../../core/model/home/cartoon_index_model.dart';



class CartoonLogic extends GetxController {
  final CartoonState state = CartoonState();

  @override
  void onReady() {
    // TODO: implement onReady
    refreshData();

    super.onReady();
  }


  Future refreshData() async{
    state.pageNum = 1;
    state.pageSize = 10;
    state.cartoonList = [];
    fetchCartoonData();

  }

  Future loadMoreData() async{
    state.isLoading = true;
    state.pageNum++;
    fetchCartoonData();

    if(!state.isLoading){

    }
  }



  void fetchCartoonData(){

    HYHomeRequest().fetchCartoonData(
        getparams()
    ).then((value) {
      if(value.code == 0){
        for(final modules in value.result!.modules!){
          final style = modules!.style;
          if(style == 'banner_v3'){
            state.cartoonList.add(buildHomeComicSwiper(modules));
            // state.cartoonList.add(buildHomeComicSwiper(modules));
          } else if (style == "function") {
            // state.cartoonList.add(buildHomeComicFunctionButton(module));
          } else if (style == "card") {
            state.cartoonList.add(buildCrtoonlist(modules));
          } else if (style == "double_feed") {
            state.cartoonList.add(buildCrtoonlist(modules));
          }


        }

      }
      // getx更新数据
      update();

      }
    );


  }


  Map<String,dynamic> getparams(){

    Map<String, dynamic> params = {
      'appkey': Constant.appKey,
      'access_key': '',
      'ad_extra': '',
      'build': '7110300',
      'c_locale': 'zh_CN',
      'channel': 'bili',
      'cursor': '',
      'disable_rcmd': '0',
      'feed_related_season_ids': '',
      'fnval': '272',
      'fnver': '0',
      'fourk': '0',
      'from_context': '',
      'from_scene': '0',
      'is_refresh': '1',
      'jump_module': '',
      'jump_rank_id': '',
      'mobi_app': 'android',
      'platform': 'android',
      's_locale': 'zh_CN',
      'statistics':
      '%7B%22appId%22%3A1%2C%22platform%22%3A3%2C%22version%22%3A%227.11.0%22%2C%22abtest%22%3A%22%22%7D',
      'ts': '1673228123',
    };
    final signEntry = <String, dynamic>{'sign': ParamsSign.getSign(params)};
    params.addEntries(signEntry.entries);

    return params;
  }


  //   将轮播图包装成sliver
  Widget buildHomeComicSwiper(Module module) {
    return SliverList.builder(

      itemCount: 1,
      itemBuilder: (ctx,index){
        return buildComicSwiper(module);
      }
    );

  }
//   轮播图
  Widget buildComicSwiper(Module module){
    // 在这里布局hot reload不管用
    // SizedBox
    return Container(
      height: 200,
      width: 1.sw,
      padding: EdgeInsets.only(bottom: 10),
      // 需要给Swiper包裹一个高度
      child: Swiper(
        // scale: 1,//轮播图之间的间距
        // controller: state.swiperController,
        // autoplayDelay: 3000,//自动轮播之间的间隔，毫秒单位
        // scrollDirection: ,轮播方向

        // layout: SwiperLayout.TINDER,//构建轮播的布局
        // 指示器的类型，如带颜色的、可以放大的等等
        // indicatorLayout: PageIndicatorLayout.COLOR,
        // loop: true,//s是否循环轮播
        itemCount: module.items!.length,
        autoplay: true,//是否自动轮播
        // 指示器样式
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          builder: DotSwiperPaginationBuilder(
            // 默认颜色
            color: Colors.yellow,
            // 当前索引颜色
            activeColor: Colors.green,
          ),
        ),
          // indicatorLayout
        onTap: (index){
          print('点击轮播图$index');
        },
        itemBuilder: (context, index){
          // print('轮播图itemBuilder == ${module.items![index]!.cover!}');
          return Container(
            // margin: const EdgeInsets.only(bottom: 30).r,
            // height: 230.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    module.items![index]!.cover!,
                  ),
                  // 保持Box的纵横比进行缩放至Box完全填充满父控件，超出部分进行裁剪，
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.r))),
          );
        },

      ),
    );

  }



  // 列表
  Widget buildCrtoonlist(Module modeul) {
    return SliverGrid.builder(
        itemCount: modeul.items!.length,
        // SliverGridDelegateWithFixedCrossAxisCount(),可以设置列数
        // SliverGridDelegateWithMaxCrossAxisExtent(),根据设置的宽高比，自动算出列数
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        //设置横向间距
        crossAxisSpacing: 10,
        //设置主轴间距
        mainAxisSpacing: 10,
      ),

        itemBuilder: (ctx,index){
          final item = modeul.items![index];
          print('itemdesc == $index==${item!.desc!}');
          print('itemtitle == $index==${item!.title!}');
          print('badgeInfo == $index==${item!.badgeInfo!.text!}');
          print('subTitleLeftBadge == $index==${item!.subTitleLeftBadge!.text!}');



          return Container(
            decoration: BoxDecoration(
              color: AKAppTheme.norWhite01Color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [AKAppTheme.norBoxShadow],
            ),
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                         borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                         child: FadeInImage(
                            placeholder: AssetImage(AKImageAssets.icUpperVideoDefaultPNG),
                            image: NetworkImage(modeul.items![index]!.cover!),
                         ),
                       ),
                    if (item!.badgeInfo! != null) Positioned(
                      right: 0,
                      top: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorRadixChange.hexColor(
                              item.badgeInfo!.bgColor!.substring(1)
                          ),
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(10))
                        ),
                        padding: EdgeInsets.only(top: 5,left: 5,bottom: 5,right: 5),
                        child: Text(
                          item!.badgeInfo!.text! == null ?'会员==':item!.badgeInfo!.text!,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),

                      ),
                    ) else Container()
                  ],
                ),
                5.verticalSpace,
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    item!.title! == null ? '六道1' :'${item!.title!}==$index',
                    style: TextStyle(
                      color: AKAppTheme.norTextColors,
                      fontSize: 13,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                5.verticalSpace,
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: AKAppTheme.norWhite05Color,
                        borderRadius: BorderRadius.all(Radius.circular(3))
                      ),

                      child: Text(
                        item!.subTitleLeftBadge!.text!  ==  null  ?  '0.0'  : item!.subTitleLeftBadge!.text!,
                        style: TextStyle(
                          color: const Color.fromRGBO(241, 129, 56, 1),
                          fontSize: 12,
                        ),

                      ),

                    ),
                    3.horizontalSpace,
                    Text(
                      item!.desc! == null ? '六道' : item!.desc!,
                      style: TextStyle(
                        color: AKAppTheme.norGrayColor,
                        fontSize: 13,
                      ),

                    ),
                  ],

                ),
              ],

            ),
          );

      }
    );

  }




}
