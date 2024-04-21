
import 'package:flutter/cupertino.dart';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

import 'package:bili_flutter/core/model/home/feed_index_model.dart';

class RecommendState {

  late ScrollPhysics physics;
  // late List<Widget> homeRecommendWidgets;
  late List<FeedIndexItem> feedIndexItemList;

  late int pageNum;
  late int pageSize;
  late bool hadMore;
  late bool isLoading;

  late SwiperController swiperController;

  RecommendState() {
    ///Initialize variables
  print('object==1');
    pageNum = 1;
    pageSize = 10;
    hadMore = true;
    physics =  ScrollPhysics();
    isLoading = false;
    physics = const NeverScrollableScrollPhysics();
    // homeRecommendWidgets = [];
    feedIndexItemList = [];

    swiperController = SwiperController();

  }


}
