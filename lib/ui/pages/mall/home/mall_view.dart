import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'mall_logic.dart';

// 功能测试、功能演示、组件演示、展示、原理分析、


class MallPage extends StatelessWidget {
  MallPage({Key? key}) : super(key: key);

  static final String routeName = '/MallPage';

  final logic = Get.put(MallLogic());
  final state = Get.find<MallLogic>().state;




  @override
  Widget build(BuildContext context) {
    // return Container();
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('测试'),
    //   ),
    //   body: ListView.builder(
    //     itemCount: 5,
    //
    //       itemBuilder: (context,index){
    //         return Text('测试');
    //       }
    //
    //   ),
    // );
    // return builtemp();
    // return builtem2();

    // return builtem3();
    // return buildScaffold();

    // return buildScaffold2();
// return builtem8();

    return buildCustomScrollView();

  }




  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
    slivers: [
      // RenderSliver不能是 RenderBox 的子级
      // 会报错
      // A RenderViewport expected a child of type RenderSliver but received a child of type RenderConstrainedBox.
      SizedBox(width: 100,height: 100,child: Text('data'),)
      // SliverToBoxAdapter(
      //   child: Container(color: Colors.green,height: 100,width: 100,),
      // ),
    ],
  );
  }


  Widget builtem8() {
    return GestureDetector(
      child: SizedBox(
        child: Container(color: Colors.green,height: 100,width: 100,),
      ),
    );
  }


    Scaffold buildScaffold2() {
    return Scaffold(
    body: Column(
      children: [
        SizedBox(height: 100,),
        // builtem5(),
        // builtem6(),
        // builtem7(),
        SliverToBoxAdapter(
          child: Container(color: Colors.green,height: 100,width: 100,),
        ),

        // Stack()

      ],
    ),
  );
  }
  Widget builtem7() {
    return SingleChildScrollView(
        // CustomScrollView
      child: GestureDetector(
        onTap: (){
          print('object');
        },
        child: Container(color: Colors.green,height: 100,width: 100,),
      ),
    );
  }
    Widget builtem6() {
    return Positioned(//Positioned只能用于定位，其父widget不能是Column之类的
      child: Container(
        child: ConstrainedBox(constraints: BoxConstraints(
            maxHeight: 200,
            maxWidth: 200
        ),
          child: Container(color: Colors.green,height: 100,width: 100,),
        ),
      ),
    );
  }

  Widget builtem5() {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 200,
          maxWidth: 200
        ),
      child: Container(color: Colors.green,height: 300,width: 300,
        child: Positioned(
            child: Column(
              children: [
                Container(color: Colors.yellow, height: 40,width: 40,)
              ],
            )
        ),
      ),
    );
  }
  Scaffold buildScaffold() {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          SizedBox(width: 100,child: builtem4(),),
          SizedBox(width: 210,child: builtem4(),),

        ],
      ),
    );
  }


    Widget builtem4() {
    // return Container();
    return LayoutBuilder(builder: (ctx,con){
      if(con.maxWidth>200){
        return Container(color: Colors.grey, height: 100,width: 100,);

      }else{
        return Container( color: Colors.yellow,height: 100,width: 100,);
      }
    });
  }

  Widget builtem3() {
    return FittedBox(child: Text('data可视角度付款啦结算单开发机手打拉受打击饭卡拉萨电极法刷卡skd手机壳到付件阿萨德'),);

  }

  Widget builtem2() {
    // return IntrinsicHeight(child: Container(color: Colors.yellow,width: 200,height: 3000,));
    return IntrinsicWidth(child:Container(color: Colors.yellow,width: 2000,height: 300,) ,);

  }

  Widget builtemp(){
    return Stack(
      children: [

        Column(children: [
          SizedBox(height: 100,),
          SizedBox(
            height: 200,width: 200,
            child: UnconstrainedBox(child: Container(height: 200,width: 200,color: Colors.green,),),
          ),

          IntrinsicWidth(),
          Text('data')
        ],)

      ],
    );
    // Expanded(child: child)
    // Row
    // Padding
    // UnconstrainedBox
  }


}
