

import 'package:bili_flutter/core/third/event/event_bus.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:bili_flutter/ui/sheard/image_assets.dart';

import 'package:bili_flutter/core/third/event/event_bus.dart';


import 'package:bili_flutter/core/model/video/short_video_model.dart';

import '../recommend/commend_video_logic.dart';

import 'play_pause_gesture.dart';
import 'video_right_bar.dart';
import 'video_bottom_bar.dart';

class AKVideoPlaying extends StatefulWidget {
  // const AKVideoPlaying({super.key});


  //
  AKVideoPlaying({
    required this.videoModel,
    required this.index,
    required this.page,

  });

  final AKShortVideoModel videoModel;
  final int index;
  final int page;


  @override
  State<AKVideoPlaying> createState() => _AKVideoPlayingState();
}

class _AKVideoPlayingState extends State<AKVideoPlaying> {
  
  late VideoPlayerController _videoPlayerController;
  var _isPlaying = false;

  var _isPlayButton = false;
  var _isInit = false;


  final state = Get.find<Commend_videoLogic>().state;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoModel.url
        ));
    // ..initialize().then((value) {
    //   setState(() {});
    // });
    // 添加监听会导致页面不断刷新
    // _videoPlayerController.addListener(() {
      // setState(() {
      //   print('AKVideoPlaying i==000');
      // });
    // });

    _videoPlayerController.setLooping(true);
    _videoPlayerController.initialize().then((_) => setState(() {
      print('AKVideoPlaying i==111');

    }));
    // _videoPlayerController.play();
    _videoPlayerController.setLooping(true);
    // _playOrPause();


    // 注册监听器，订阅 eventbus
    EventAppBus.eventVideo.on().listen((event) {
      print('object===  $event');
      // _videoPlayerController.pause();
    });
    print('object=== eventBus initState ');

    // Application.eventBus.fire(StopPlayEvent());
    _isInit = true;

  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();

  }


  @override
  Widget build(BuildContext context) {
    // return const Placeholder();

    
    if(_isPlayButton){
    }else{
      if(widget.index == widget.page){
        // _playOrPause();
        _isPlaying = true;
        _videoPlayerController.play();
      }
    }


    print('AKVideoPlaying  index== ${widget.index}====page ${widget.page}');

    return Scaffold(
      body: Stack(
          children: [
            _buildVideoPlayer(),
            _buildVideoRightBar(),
            _buildBottomVideoInfo(),
          ]
      ),
    );

/*
    return Scaffold(
      body: Container(
        color: Colors.green,
        height: ScreenUtil().screenHeight,
        child: Stack(
          children: [
            _buildVideoPlayer(),
            _buildVideoRightBar(),
            _buildBottomVideoInfo(),
          ],
        
        ),
      ),
    );


 */


  }


  // 视频组件
  Widget _buildVideoPlayer(){


     double scale = 1;
     double videoLayoutWidth = 10;
     double videoLayoutHeight =10;

    final double contentHeight= ScreenUtil().screenHeight;
    final double screenWidth= ScreenUtil().screenWidth;

    if(_videoPlayerController.value.isInitialized){

      double rateWidthHeightContent = screenWidth / contentHeight;
      double rateWidthContentVideo = screenWidth / _videoPlayerController.value.size.width;
      double heightVideoByRate = _videoPlayerController.value.size.height * rateWidthContentVideo;
      print('视频宽:${_videoPlayerController.value.size.width} 视频高:${_videoPlayerController.value.size.height}');
      print('视频宽高比:${_videoPlayerController.value.size.width/_videoPlayerController.value.size.height}');
      print('屏幕宽:${screenWidth}  高：${contentHeight}');
      print('内容高度:${contentHeight}');
      print('内容宽高比例:$rateWidthHeightContent');
      print('比例:$rateWidthContentVideo');
      print('比例换算视频高度:$heightVideoByRate');
      if(contentHeight > heightVideoByRate ){
        double rateHeightContentVideo = contentHeight /  _videoPlayerController.value.size.height;
        videoLayoutHeight = heightVideoByRate;
        videoLayoutWidth = screenWidth;
        scale = contentHeight / videoLayoutHeight;
        print('width:$videoLayoutWidth height:$videoLayoutHeight scale:$scale rate:$rateHeightContentVideo');
      }
    }



    return PlayPauseGesture(
      onSingleTap: (){
        _playOrPause();
      },
      child: Container(
        // width: ScreenUtil().screenWidth,
        // height: ScreenUtil().screenHeight,
        // color: Colors.black,
        color: Colors.green,

      child:Stack(
          children: [
            // _buildVideoCcaleTwo(scale),

            _buildVideoScale(scale),

            _isPlayButton == true?
            _isPlaying == true? Container() : buildPauseImage()
            :Container()
            ,

          ],
        )

      ),
    );

  }

  Center _buildVideoCcaleTwo(double scale) {
    return Center(
            child: AspectRatio(
              // aspectRatio: _videoPlayerController.value.aspectRatio,
              // aspectRatio: 0.5,
              aspectRatio: scale,

              child: VideoPlayer(_videoPlayerController),
            ),
          );
  }

  Transform _buildVideoScale(double scale) {
    return Transform.scale(
            scale: scale,
            alignment: Alignment.topCenter,
            child: Container(
              // width: videoLayoutWidth,
              // height: videoLayoutHeight,
                child: VideoPlayer(_videoPlayerController),
            ),
          );
  }

  void _playOrPause() {
    _isPlayButton = true;
    _isPlaying = !_isPlaying;
    if(_isPlaying){
      _videoPlayerController.play();
    }else{
      _videoPlayerController.pause();
    }
    setState(() {
      print('AKVideoPlaying i==222');

    });

  }

  // 视频暂停图片
  Widget buildPauseImage(){
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: Image.asset(AKImageAssets.videoPauseImage,fit: BoxFit.fill,),
      ),
    );
      
  }

//   视频右边工具栏
  Widget _buildVideoRightBar(){
    return Positioned(
      right: 10,
      // bottom: 50,
        bottom: ScreenUtil().bottomBarHeight+80,
        child: VideoRightBarWidget(
        videoModel: widget.videoModel,
        onClickHead: (){

        },
      )
    );

  }

//   视频底部信息
  Widget _buildBottomVideoInfo(){
    // return Container();
    return Positioned(
      // bottom: 20,
      left: 12,
      bottom: ScreenUtil().bottomBarHeight+80,

      child: VideoBottonBar(videoModel: widget.videoModel),
    );

  }




}
