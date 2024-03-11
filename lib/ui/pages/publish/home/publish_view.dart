import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'publish_logic.dart';

class PublishPage extends StatelessWidget {
  PublishPage({Key? key}) : super(key: key);

  final logic = Get.put(PublishLogic());
  final state = Get.find<PublishLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
    );
  }
}
