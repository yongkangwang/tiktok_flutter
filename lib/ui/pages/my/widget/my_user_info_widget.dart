
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'my_user_head_widget.dart';
import 'package:bili_flutter/ui/widegts/view/clip_rect_top.dart';
import '../../../sheard/image_assets.dart';
import '../../../sheard/app_theme.dart';
import '../.../../../../widegts/view/text_normal.dart'
;
class MyUserInfoWidget extends StatefulWidget {
  const MyUserInfoWidget({super.key});

  @override
  State<MyUserInfoWidget> createState() => _MyUserInfoWidgetState();
}

class _MyUserInfoWidgetState extends State<MyUserInfoWidget> {

  final String userID = 'hhhhhh';

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Container(
      color: Colors.brown,
      // color: Colors.transparent,
      padding: EdgeInsets.only(left: 15,right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),

          Row(
            children: [
              UserHeadInfoWidget(),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('名字飞翔的螺蛳粉',style: TextStyle(fontSize: 16),),
                  SizedBox(height: 8,),
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Clipboard.setData(ClipboardData(text: userID));
                          SmartDialog.showToast('已复制抖音号： $userID',alignment: Alignment.center);
                          // Get.snackbar(title, message)
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('抖音号：$userID',style: TextStyle(color: AKAppTheme.norTextColors),),
                            Image.asset(AKImageAssets.homeAppBarLeft1PNG,width: 10,height: 10,)],
                        ),
                      ),
                    ],
                  ),

                ],
              ),

            ],
          ),
          SizedBox(height: 10,),
          TextNormal('仗剑走天下，海内觅知音')
        ],
      ),
    );

  }





}
