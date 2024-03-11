import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'commend_video_state.dart';
import '../../../../core/service/request/short_video_request.dart';

class Commend_videoLogic extends GetxController  {
  final Commend_videoState state = Commend_videoState();
  // AutomaticKeepAliveClientMixin
  late PageController pageController;
  late List videoList;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('onInit====');
    pageController = PageController(
      initialPage: 0,
      // viewportFraction: 1,
      keepPage: true
    );

    refreshData();

  }


  /// 下拉刷新
  Future refreshData() async {
    state.pageNum = 1;
    videoList = [];

    fetchFeedIndexData();
  }


  ///获取数据
  void fetchFeedIndexData(){
    AKShortVideoRequest().fetchVideo().then((value){
      videoList = value;
      print('获取数据====$videoList');

      update();
    });
  }


  void updateCurrentIndex(index) {
    state.currentIndex = index;

  }
    void updateCurrentPage() {
    state.currentPage = state.currentIndex;
    print('onPageChanged==${state.currentPage}');
    update();
  }



  }
