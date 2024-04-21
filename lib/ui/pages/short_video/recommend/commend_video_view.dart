import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'commend_video_logic.dart';

import '../../home/recommend/recommend_view.dart';
import '../../my/home/user_view.dart';
import '../playing/video_playing.dart';
class Commend_videoPage extends StatelessWidget {
  Commend_videoPage({Key? key}) : super(key: key);


  static final String routeName = '/Commend_videoPage';

  final logic = Get.put(Commend_videoLogic());
  final state = Get.find<Commend_videoLogic>().state;

  @override
  Widget build(BuildContext context) {

    print('Commend_videoPage ==build ${logic.videoList.length}');
   // return   buildContainer();
    return GetBuilder<Commend_videoLogic>(

        builder: ( logic){
          return NotificationListener(
            onNotification: (notification){
              // print('notification,这里会一直执行');
              if (notification is ScrollEndNotification && notification.depth == 0) {
                print('object==ScrollEndNotification');
                logic.updateCurrentPage();
              }
              return true;
            },
            child: buildPageView(logic),


          );
        }
    );


  }

  PageView buildPageView(Commend_videoLogic logic) {
    return PageView.builder(
            onPageChanged: (index){
              logic.updateCurrentIndex(index);
            },

              // key: Key('Commend_videoPage'),
              physics: BouncingScrollPhysics(),
              controller: logic.pageController,
              scrollDirection: Axis.vertical,
              itemCount: logic.videoList.length,
              itemBuilder: (context,index){
                print('index====$index');
                return AKVideoPlaying(
                  videoModel: logic.videoList[index],
                  index: index,
                  page: state.currentPage,
                );
              }

          );
  }




  Container buildContainer() {
    return Container(
   child: PageView.builder(
       onPageChanged: (index){
         logic.updateCurrentIndex(index);
       },
       
       // key: Key('Commend_videoPage'),
       physics: BouncingScrollPhysics(),
       controller: logic.pageController,
       scrollDirection: Axis.vertical,
       itemCount: logic.videoList.length,
       itemBuilder: (context,index){
         print('index====$index');
         return AKVideoPlaying(
           videoModel: logic.videoList[index],
           index: index,
           page: state.currentPage,
         );
       }

   ),
 );
  }








}
