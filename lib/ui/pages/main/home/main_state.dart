
import 'package:flutter/cupertino.dart';
import 'package:bili_flutter/ui/pages/home/home/home_view.dart';
import 'package:bili_flutter/ui/pages/short_video/home/video_view.dart';
import '../../my/home/user_view.dart';


class MainState {

  // 添加属性
  late int currentIndex;

  ///子页面
  late  List<Widget> mainIndexStackPages;

  MainState() {
    ///Initialize variables

    currentIndex = 0;

    mainIndexStackPages = [
      VideoPage(),
      HomePage(),
      UserPage(isLoginUser: false,),

    ];



    ///
  }
}
