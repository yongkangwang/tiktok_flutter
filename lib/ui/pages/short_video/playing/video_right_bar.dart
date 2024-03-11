import 'package:bili_flutter/ui/sheard/image_assets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:like_button/like_button.dart';


import 'package:bili_flutter/ui/sheard/app_theme.dart';


import 'package:bili_flutter/core/model/video/short_video_model.dart';
import 'package:bili_flutter/ui/widegts/button/icon_text_button.dart';
import '../../home/recommend/recommend_view.dart';

class VideoRightBarWidget extends StatefulWidget {
  // const VideoRightBarWidget({super.key});


  const VideoRightBarWidget({
    this.onClickHead,
    this.onClickLike,
    this.onClickComment,
    this.onClickShare,
    required this.videoModel
  });

  final Function? onClickHead;
  final Function? onClickLike;
  final Function? onClickComment;
  final Function? onClickShare;
  final AKShortVideoModel videoModel;

  @override
  State<VideoRightBarWidget> createState() => _VideoRightBarWidgetState();
}

class _VideoRightBarWidgetState extends State<VideoRightBarWidget> {

  final double _widgetWidth = 50;
  // var bool _isLike = true;
  bool _isLiked = false;
  bool? get isLiked => _isLiked;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();

    return ConstrainedBox(

      constraints: BoxConstraints(maxWidth: _widgetWidth),
      child: Column(
        children: [
          _buildHeadWidget(),
          SizedBox(height: 25,),
          _buildLikeWidget(),
          SizedBox(height: 20,),
          _getCommentButton(),
          SizedBox(height: 20,),
          _getShearButton(),
          SizedBox(height: 20,),
          _getMusicOriginal(),

        ],

      ),
    );
  }

  // 头像
  Widget _buildHeadWidget(){
    // final int kkk = 10;

    return InkWell(
      onTap: (){
        widget.onClickHead?.call();
      },
      child: Container(
        // color: Colors.green,
        width: _widgetWidth,
        height: _widgetWidth+10,
        child: Stack(
        alignment: Alignment.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_widgetWidth/2),
                  border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 2)),
                image: DecorationImage(image: NetworkImage(widget.videoModel.image))
              ),
            ),
            Positioned(
              child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20/2),
                  color: AKAppTheme.norRedColor_3
                ),
                child: Image.asset(AKImageAssets.videoRightAddImage,width: 15,height: 15,),

          )
            )
          ],
        ),
      ),
    );
  }

//  喜欢
  Widget _buildLikeWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LikeButton(

          onTap: onLikeButtonTapped,
          size: 40,
          // countPostion: CountPostion.bottom,
          // likeCount: 100,
          // likeCountPadding: EdgeInsets.only(top: 3),
          // isLiked: _isLike,
          // 气泡圆圈
          circleColor: CircleColor(start: AKAppTheme.norRedColor_3, end: AKAppTheme.norRedColor_3),
          likeBuilder: (isLike){
            // print('objectis这里会加载很多次Like== $_isLiked');
            return Image.asset(
              AKImageAssets.videoRedHeartImage,
              color: _isLiked == true ?AKAppTheme.norRedColor_3:Colors.white,
            );

          },
          // 气泡
          bubblesColor: BubblesColor(dotPrimaryColor: AKAppTheme.norRedColor_3, dotSecondaryColor: AKAppTheme.norRedColor_3),
        ),
        SizedBox(height: 2,),
        Text('188w',style: TextStyle(color: Colors.white),)
      ],
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async{
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;
    print('object== $isLiked');
    _isLiked = !_isLiked;
    // return !isLiked;
    return _isLiked;
  }


//   评论
  Widget _getCommentButton(){
    // return Container();
    return IconTextButton(
      iconSize: 40,
      icon: Image.asset(AKImageAssets.videoRightCommentImage),
      text: '100w',
      onTap: (){
        print('评论点击了');
        // Get.snackbar("评论", "评论点击了",snackPosition: SnackPosition.BOTTOM);
        Get.bottomSheet(RecommendPage());
      },
    );
  }

  // 分享
  Widget _getShearButton() {
    return IconTextButton(
      iconSize: 40,
      icon: Image.asset(AKImageAssets.videoRightShareImage),
      text: '10w',
      onTap: (){
        print('分享点击了');
        Get.snackbar("Snackbar 标题", "分享点击了",snackPosition: SnackPosition.BOTTOM);

      },
    );
  }


  Widget _getMusicOriginal(){
    
    return GestureDetector(
      onTap: (){
      // DialogExample();
        Get.defaultDialog(
          title: '音乐原创',
          onCancel: (){

          },
          onConfirm: (){

          }
        );


      },
      child: CircleAvatar(
        radius: _widgetWidth/2,
        backgroundImage: NetworkImage(widget.videoModel.image)
        // child:Image.network(widget.videoModel.image,width: _widgetWidth,height: _widgetWidth,)
      ),
    );

  }




}
