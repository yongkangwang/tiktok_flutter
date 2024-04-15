
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bili_flutter/ui/widegts/view/primary_scroll_container.dart';

class HomeState {

  // GlobalKey 需要导入系统库cupertino/material
  late GlobalKey<PrimaryScrollContainerState> keyRecommend;
  late GlobalKey<PrimaryScrollContainerState> keyCartoon;

  late List<GlobalKey<PrimaryScrollContainerState>> scrollChildKeys;

  HomeState() {
    ///Initialize variables
    keyRecommend = GlobalKey<PrimaryScrollContainerState>();
    keyCartoon = GlobalKey<PrimaryScrollContainerState>();
    scrollChildKeys = [
      keyRecommend,
      keyCartoon,

    ];


  }
}
