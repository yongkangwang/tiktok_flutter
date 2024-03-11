

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:easy_refresh/easy_refresh.dart';

import 'package:bili_flutter/core/service/utils/constant.dart';

import 'package:bili_flutter/ui/sheard/params_sign.dart';
import 'package:bili_flutter/ui/sheard/app_theme.dart';

import 'recommend_state.dart';

import 'package:bili_flutter/core/model/home/feed_index_model.dart';

import 'package:bili_flutter/core/service/request/home_request.dart';

import 'package:bili_flutter/core/third/shared_preference/shared_preference_util.dart';
import 'package:bili_flutter/core/third/shared_preference/preference_keys.dart';

import 'package:bili_flutter/ui/sheard/image_assets.dart';

class RecommendLogic extends GetxController {

  final RecommendState state = RecommendState();

  ///下拉刷新上拉加载固定写法

  @override
  void onReady() {
    // TODO: implement onReady
    // fetchFeedIndexData();
    refreshData();
    super.onReady();
  }


  /// 下拉刷新
  Future refreshData() async {
    state.pageNum = 1;
    state.hadMore = true;
    state.feedIndexItemList = [];

    fetchFeedIndexData();
  }

  /// 上拉加载更多
  Future loadMoreData() async{
  // void loadMoreData() async{
    if(!state.isLoading){
      state.isLoading = true;
      state.pageNum++;
      fetchFeedIndexData();
    }

    if (state.hadMore) {
    } else {

    }
  }

  ///获取数据
  void fetchFeedIndexData(){

    print('加载更多====');
    HYHomeRequest().getFeedIndexData(
        fetchFeedIndexParamsWithSign()
    ).then((value) async{
      state.feedIndexItemList.addAll(value.data.items);
      state.isLoading = false;
      update();

    });

  }

  ///获取有sign值的参数
  Map<String, dynamic> fetchFeedIndexParamsWithSign() {
    bool isLogin =
        AKSharedPreferenceUtil.getBool(AKSharedPreferenceKeys.isLogin) ?? false;
    Map<String, dynamic> params = {
      // 'ad_extra':
      //     '611A2E4B12D98FBF338F2BF6B58C2FBCEE4EF3B5F4163CA3F71C524BD4C28E64E5EF0D9A03448575CD92322023DFD61BD04B1044511D9C95DDA5AEBD99E97AC422A6F04E4C3563B8F4EE54C794BC4DD41CAA06F3417CCEED1BDCB21D9CB8AEFC09CDCD6BC8AE11FE730C70040DBC291FA9996D5FF9DFDD8A32592C9DC1FD0012C462E454346FC6D9803493CD2E6110A78CEB8E44A61C37D7A883513099E8757E8F0B65CBA9AE4982D8A0E3B9AEAB0FCAA623115E2353DE323DD4F227C7A4F65052AB2A165F76E478BA72A469C42459FBA88A778A7FFF23465258B116451B24011E20B8A895EC2A074AE13BA7E4E444842F8F069F2BB6F7DAC03C2B0EFD5E1D845B8ED6B088D879FF5E67FD2A103A145DF91A0211C772669B4BFB17D2977D2BE1244656631B96A9A915631E21549524C4986D7BA84B5B31CAFB2C1994C7DE6D789F9EF059F8DCA4A30E28E427E3F412AE8BF7882A2908ACEB195847672603F90DD1C8C6D1E0FC5EF6C905AB3B7F9E5B260904BBAE6E560EC81913C2606ECE6A70888189CBCDEFD901C9C3FB694455ECE82B6D0E9DDB97C0092131E3A66F85DFB74296BF213260D773ECB93C288EFD43B185A348EA902B8946588B3555CC4331DB8EF2279D7A2A1819BCE53A55E9D1680DEF20CAA3ABE3AFCB33146EB0449BF8B4FE5DF3864B9CB626CC6C809D7F6E888F64B9DF2C672E9C2252BAE088B57B1FD96391CE29550E5D59D3E6410E7160C9220D2A9C1A4F4F47CECF66CF689335EED850F089B8990DEDDCB4F352346A9B8213319E5AB61679F65A75401B7D72A96A182E109DEA531325737993F0BF6B09EE376B1374F44EE191D8CC6C9858BAD6896C0395971D25BB84989A6ABA19E5E1C8ECEA518545F76E0EDFD773BA67CA98208D5BAF3150057461891D56E204C8E7B7237F967BF88ADF0669F136BD818051B0F2DE7140D2A02A4604B8342668BE392889B4539A24CE996FE103A4AB0D3680AA42',
      'appkey': Constant.appKey,
      'autoplay_card': '11',
      'autoplay_timestamp': '0',
      'build': '6720300',
      'c_locale': 'zh_CN',
      'channel': 'html5_search_baidu',
      'column': '2',
      'column_timestamp': '0',
      'device_name': 'MuMu',
      'device_type': '0',
      'disable_rcmd': '0',
      'flush': '0',
      'fnval': '272',
      'fnver': '0',
      'force_host': '0',
      'fourk': '0',
      'guidance': '0',
      'https_url_req': '0',
      'idx': '0',
      'inline_danmu': '2',
      'inline_sound': '1',
      'interest_id': '0',
      'login_event': '1',
      'mobi_app': 'android',
      'network': 'wifi',
      'open_event': 'cold',
      'platform': 'android',
      'player_net': '1',
      'pull': 'true',
      'qn': '32',
      'recsys_mode': '0',
      's_locale': 'zh_CN',
      'splash_id': '',
      'statistics':
      '%7B%22appId%22%3A1%2C%22platform%22%3A3%2C%22version%22%3A%226.72.0%22%2C%22abtest%22%3A%22%22%7D',
      'ts': '1659143497',
      'voice_balance': '1',
    };

    ///如果已经登录，加上access_key字段
    if (isLogin == true) {
      String? accessKey =
      AKSharedPreferenceUtil.getString(AKSharedPreferenceKeys.accessToken);
      final accessKeyEntry = <String, dynamic>{'access_key': accessKey!};
      params.addEntries(accessKeyEntry.entries);
    }

    ///加上sign字段
    final signEntry = <String, dynamic>{'sign': ParamsSign.getSign(params)};
    params.addEntries(signEntry.entries);
    return params;
  }

  ///视频列表
  Widget buildHomeRecommendVideoCards(){
    final items = state.feedIndexItemList;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      // 如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
      primary: false,
      // 滚动控制（滚动监听）
      // controller: state.gridViewController,
      // 是否可伸缩的
      shrinkWrap: true,
      // 滑动类型设置
      // physics: const NeverScrollableScrollPhysics(),
      physics: state.physics,
      itemCount: items.length,
      // itemCount: 10,

      itemBuilder: (context,index){
        return buildRecommendItem(items[index]);

      },

    );

  }
  
  
  // 视频item
  Widget buildRecommendItem(FeedIndexItem video){

    return GestureDetector(
      onTap: (){
        
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),

        ),
        // Column 垂直布局组件
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ///视频封面
                buildHomeVideoItemCover(video),

                ///文字下的阴影块
                // buildHomeVideoItemShadow(),

                /// 视频封面上的左下区域（如视频的评论数和观看数）
                // buildHomeVideoItemLeftZone(video),

                ///视频封面上的右下区域（如视频的时长）
                // buildHomeVideoItemRightZone(video)
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///标题
                  buildHomeVideoItemTitle(video),

                  ///视频底部的左下区域
                  // buildHomeVideoItemFooter(video),
                ],
              ),
            )
          ],
        ),

      ),
      
    );

  }



  ///单视频
  Widget buildHYHomeRefreshItemOneVideo(FeedIndexItem video) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8).r,
          height: 200.w,
          width: 1.sw,
          child: FadeInImage(
            fit: BoxFit.fill,
            placeholderFit: BoxFit.fill,
            placeholder: AssetImage(AKImageAssets.icUpperVideoDefaultPNG),
            image: NetworkImage(
              video.cover!,
            ),
          ),
        ),
      ),
    );
  }


  // 轮播图
  Widget buildHomeRecommendCarousel(List<BannerItem> bannerItems) {
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          margin: const EdgeInsets.only(bottom: 8).r,
          width: 1.sw,
          height: 200.w, //这里的轮播图组件必须包裹在有高度的控件或者设置比例
          child: Swiper(
            controller: state.swiperController,
            scale: 1,
            viewportFraction: 1,
            itemBuilder: (ctx, index) {
              return Stack(
                children: [
                  SizedBox(
                    height: 200.w,
                    width: 1.sw,
                    child: FadeInImage(
                      fit: BoxFit.cover,
                      placeholderFit: BoxFit.cover,
                      placeholder: AssetImage(AKImageAssets.icUpperVideoDefaultPNG),
                      image:
                      NetworkImage(bannerItems[index].staticBanner!.image!),
                    ),
                  ),
                  Positioned(
                    left: 10.r,
                    bottom: 10.r,
                    child: Text(
                      bannerItems[index].staticBanner!.title!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: bannerItems.length,
            indicatorLayout: PageIndicatorLayout.SCALE,
            autoplayDelay: 3000,
            pagination: SwiperPagination(
                alignment: Alignment.bottomRight,
                margin:
                const EdgeInsets.only(left: 0, right: 8, bottom: 8, top: 0)
                    .r),
            fade: 1.0,
            autoplay: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }



  ///视频封面
  Widget buildHomeVideoItemCover(FeedIndexItem video) {
    if (video.cardType == "cm_v2") {
      ///广告类型的数据
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.r),
          topRight: Radius.circular(5.r),
        ),
        child: SizedBox(
          width: 180.w,
          height: 100.w,
          child: FadeInImage(
            imageErrorBuilder: (ctx, error, stackTrace) {
              return Container(
                child: Text("加载中"),
              );
            },
            placeholder: AssetImage(AKImageAssets.icUpperVideoDefaultPNG),
            image: NetworkImage(
              video.adInfo!.creativeContent!.imageUrl!,
            ),
            fit: BoxFit.fill,//Box被完全填充
            placeholderFit: BoxFit.fill,
          ),
        ),
      );
    } else if (video.cardType == "banner_v8") {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.r),
          topRight: Radius.circular(5.r),
        ),
        child: SizedBox(
          width: 180.w,
          height: 100.w,
          child: FadeInImage(
            imageErrorBuilder: (ctx, error, stackTrace) {
              return Container(
                child: Text("加载中"),
              );
            },
            placeholder: AssetImage(AKImageAssets.icUpperVideoDefaultPNG),
            image: NetworkImage(
              video.bannerItems![0].staticBanner!.image!,
            ),
            fit: BoxFit.fill,
            placeholderFit: BoxFit.fill,
          ),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.r),
          topRight: Radius.circular(5.r),
        ),
        child: SizedBox(
          width: 180.w,
          height: 100.w,
          child: video.cover != null
              ? FadeInImage(
            imageErrorBuilder: (ctx, error, stackTrace) {
              return Container(
                child: Text("加载中"),
              );
            },
            placeholder: AssetImage(AKImageAssets.icUpperVideoDefaultPNG),
            image: NetworkImage(
              video.cover!,
            ),
            fit: BoxFit.fill,
            placeholderFit: BoxFit.fill,
          )
              : Text(video.cover!),
        ),
      );
    }
  }


  ///视频的标题
  Widget buildHomeVideoItemTitle(FeedIndexItem video) {
    if (video.title != null) {
      return Expanded(
        child: Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8).r,
          child: Text(
            video.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AKAppTheme.norTextColors, fontSize: 12.sp),
          ),
        ),
      );
    } else {
      return Container();
    }
  }


}
