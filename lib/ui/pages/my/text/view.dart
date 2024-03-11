import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';



// UI管理
// getx 默认案例

class TextPage extends StatelessWidget {
  TextPage({Key? key}) : super(key: key);

  final logic = Get.put(TextLogic());
  final state = Get.find<TextLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
