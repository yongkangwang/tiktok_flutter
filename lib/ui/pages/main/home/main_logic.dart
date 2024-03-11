import 'package:get/get.dart';

import 'main_state.dart';

import 'package:bili_flutter/core/system/system_preferred_orientations_util.dart';
import 'package:bili_flutter/core/system/system_ui_overlay_style_util.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();


  @override
  void onInit() {
    // TODO: implement onInit

    SystemPreferredOrientationsUtil.setVertical();
    SystemUiOverlayStyleUtil().setWhiteSystemUiOverlayStyle();
    super.onInit();
  }

  ///更新当前下标
  void updateCurrentIndex(index){
    state.currentIndex = index;
    update();
  }

}
