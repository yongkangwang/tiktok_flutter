import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:easy_refresh/easy_refresh.dart';

import 'cartoon_logic.dart';




// import 'package:flutter/scheduler.dart';
// import 'package:flutter/widgets.dart';

class CartoonPage extends StatelessWidget {
  CartoonPage({Key? key}) : super(key: key);

  static final String routeName = '/home/cartoon';

  final logic = Get.find<CartoonLogic>();
  final state = Get.find<CartoonLogic>().state;

  @override
  Widget build(BuildContext context) {

    print('CartoonPage   build');


    return GetBuilder<CartoonLogic>(
        builder: (logic){
          // return Scaffold(
          //   body: ,
          //
          // );
          print('CartoonPage   GetBuilder');

          return EasyRefresh(
            onRefresh: ()async{
              print('刷新');
              logic.refreshData();

            },
            onLoad: (){
              print('加载更多');
              logic.loadMoreData();
            },

            child: Container(
              padding: EdgeInsets.only(top: 10,left: 10,bottom: 10,right: 10),
              //
              child: CustomScrollView(
                slivers: state.cartoonList,
              ),
            ),

            // child: ListView.builder(
            //     itemCount: state.cartoonList.length,
            //     itemBuilder: (ctx,index){
            //     return state.cartoonList[index];
            //     }
            // ),

            // child: ListView(
            //   padding: EdgeInsets.only(top: 10,left: 10,bottom: 10,right: 10),
            //   children: state.cartoonList,
            //
            // )



          );
        },
    );

  }

  void   dddd (){


     // BlocBuilder
  }

}
