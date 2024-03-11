
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee/marquee.dart';

import 'package:bili_flutter/ui/sheard/image_assets.dart';

import 'package:bili_flutter/core/model/video/short_video_model.dart';

class VideoBottonBar extends StatefulWidget {
  // const VideoBottonBar({super.key});

  const VideoBottonBar({
    Key? key,
    required this.videoModel
  }):super(key: key);

  final AKShortVideoModel videoModel;


  @override
  State<VideoBottonBar> createState() => _VideoBottonBarState();
}

class _VideoBottonBarState extends State<VideoBottonBar> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: ScreenUtil().screenWidth-100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('@六道狂厨',style: TextStyle(color: Colors.white),),
          SizedBox(height: 5,),
          Text('做饭狂傲不羁,行云流水、天马行空、色香味俱全可接受的减肥的',style: TextStyle(color: Colors.white)),
          SizedBox(height: 10,),
          _buildMusicMarquee()

        ],
      ),
    );

  }


  Row _buildMusicMarquee() {
    return Row(
      children: [
        Image.asset(AKImageAssets.videoBottomMusicImage,width: 25,height: 25,),
        Container(
          height: 30,
          width: 200,
          child: Marquee(
              text: '做饭狂傲不羁,行云流水、天马行空、色香味俱全可接受的减肥的',
              style: TextStyle(color: Colors.white)
          ),
        )
      ],
    );
  }




}
