import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shop_logic.dart';

class ShopPage extends StatelessWidget {
  ShopPage({Key? key}) : super(key: key);

  final logic = Get.put(ShopLogic());
  final state = Get.find<ShopLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
