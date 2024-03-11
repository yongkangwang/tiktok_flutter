import 'package:get/get.dart';

import 'video_logic.dart';

class VideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoLogic());
  }
}
