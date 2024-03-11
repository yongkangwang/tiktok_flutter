
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:easy_refresh/easy_refresh.dart';


import 'recommend_logic.dart';


class RecommendPage extends StatefulWidget {
  RecommendPage({Key? key}) : super(key: key);

  static final String routeName = '/home/recommend';

  @override
  State<RecommendPage> createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage>
    with AutomaticKeepAliveClientMixin{

  final logic = Get.find<RecommendLogic>();

  final state = Get.find<RecommendLogic>().state;

  @override
  Widget build(BuildContext context) {
    print('RecommendPage   build');

    return GetBuilder<RecommendLogic>(
      builder: (logic){
        print('RecommendPage   GetBuilder');

        // 要使用GetBuilder，才能更新EasyRefresh的状态，或者用其他方式
        return EasyRefresh.builder(

          onRefresh: (){
            print('刷新');
            // logic.loadMoreData();
          },
          onLoad:()async{
            print('加载');
            logic.loadMoreData();
          },
          childBuilder: (context,phy){
            state.physics = phy;
            return logic.buildHomeRecommendVideoCards();
          },

        );
      },

    );

  }


  // 类混入了AutomaticKeepAliveClientMixin
  // 需要实现实例方法
  @override
  // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => throw UnimplementedError();
  bool get wantKeepAlive => true;

}
