import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mall_logic.dart';

class MallPage extends StatelessWidget {
  MallPage({Key? key}) : super(key: key);

  static final String routeName = '/MallPage';

  final logic = Get.put(MallLogic());
  final state = Get.find<MallLogic>().state;

  @override
  Widget build(BuildContext context) {
    // return Container();
    return Scaffold(
      appBar: AppBar(
        title: Text('测试'),
      ),
      body: ListView.builder(
        itemCount: 5,

          itemBuilder: (context,index){
            return Text('测试');
          }

      ),
    );
    
  }
}
