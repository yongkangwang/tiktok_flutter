
import 'package:flutter/cupertino.dart';


import '../../../widegts/view/primary_scroll_container.dart';
import 'video_logic.dart';


class VideoState {


  // GlobalKey 需要导入系统库cupertino
  late GlobalKey<PrimaryScrollContainerState> keyRecommend;
  late GlobalKey<PrimaryScrollContainerState> keyAttention;

  late List<GlobalKey<PrimaryScrollContainerState>> scrollChildKeys;

  VideoState() {
    ///Initialize variables

    keyRecommend = GlobalKey<PrimaryScrollContainerState>();
    keyAttention = GlobalKey<PrimaryScrollContainerState>();
    scrollChildKeys = [
      keyRecommend,
      keyAttention,

    ];

  }
}
