import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'attention_video_logic.dart';

class Attention_videoPage extends StatelessWidget {
  Attention_videoPage({Key? key}) : super(key: key);

  static final String routeName = '/AttentionPage';

  final logic = Get.put(Attention_videoLogic());
  final state = Get.find<Attention_videoLogic>().state;

  @override
  Widget build(BuildContext context) {
    print('Attention_videoPage ==build');

    return Container(
      color: Colors.blue,
    );
  }





}
