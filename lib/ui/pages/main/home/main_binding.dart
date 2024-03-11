import 'package:get/get.dart';

import 'main_logic.dart';
import 'package:bili_flutter/ui/pages/home/home/home_logic.dart';
import 'package:bili_flutter/ui/pages/short_video/home/video_logic.dart';

import 'package:bili_flutter/ui/pages/home/recommend/recommend_logic.dart';
import 'package:bili_flutter/ui/pages/home/cartoon/cartoon_logic.dart';
import '../mainScroll/main_scroll_logic.dart';
import '../../my/home/user_logic.dart';

// 捆绑
class MainBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => MainLogic());
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => VideoLogic());
    Get.lazyPut(() => UserLogic());


    Get.lazyPut(() => RecommendLogic());
    Get.lazyPut(() => CartoonLogic());

  }
}
