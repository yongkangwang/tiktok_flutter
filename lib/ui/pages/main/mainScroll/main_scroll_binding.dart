import 'package:get/get.dart';

import 'main_scroll_logic.dart';
import '../home/main_logic.dart';
import '../../my/home/user_logic.dart';
import '../../home/recommend/recommend_logic.dart';
import '../../home/cartoon/cartoon_logic.dart';
import '../../short_video/home/video_logic.dart';
import '../../home/home/home_logic.dart';
class Main_scrollBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Main_scrollLogic());

    Get.lazyPut(() => MainLogic());
    Get.lazyPut(() => UserLogic());

    Get.lazyPut(() => HomeLogic());

    Get.lazyPut(() => VideoLogic());
    Get.lazyPut(() => RecommendLogic());
    Get.lazyPut(() => CartoonLogic());
  }
}
