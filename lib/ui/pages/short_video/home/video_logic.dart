import 'package:bili_flutter/ui/pages/short_video/home/video_view.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../../../widegts/view/primary_scroll_container.dart';


import 'video_state.dart';

class VideoLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final VideoState state = VideoState();

  late TabController tabController;
  late ScrollPhysics scrollPhysics;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: 2, vsync: this ,initialIndex: 1);
    scrollPhysics = ScrollPhysics();
    tabController.addListener(() {
      ///避免addListener调用2次
      if (tabController?.index == tabController?.animation?.value) {
        print("点击了下标为${tabController?.index}的tab");
      }

      for (int i = 0; i < state.scrollChildKeys.length; i++) {
        GlobalKey<PrimaryScrollContainerState> key = state.scrollChildKeys[i];
        if (key.currentState != null) {
          key.currentState?.onPageChange(tabController.index == i); //控制是否当前显示
        }
      }

    });

  }


  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    tabController.removeListener(() { });
    tabController.dispose();

  }


}
