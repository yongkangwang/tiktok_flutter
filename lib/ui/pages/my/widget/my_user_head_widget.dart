
import 'dart:io';

import 'package:bili_flutter/ui/sheard/means.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:bili_flutter/core/third/utils/image_utils.dart';
import 'package:get/get.dart';

import '../../../sheard/image_assets.dart';
import '../../../widegts/view/circular_widget.dart';
import '../../../widegts/view/bottom_alert.dart';





class UserHeadInfoWidget extends StatefulWidget {
  const UserHeadInfoWidget({super.key});

  @override
  State<UserHeadInfoWidget> createState() => _UserHeadInfoWidgetState();
}

class _UserHeadInfoWidgetState extends State<UserHeadInfoWidget> {

  var _isFile = false.obs;
  var _file;


  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    // return buildStack(context);
    return GestureDetector(
      onTap: (){
        showModalBottomAlert(context);
      },
      child: Obx(() =>  CircularImageWidget(
        imageName: AKImageAssets.myTophead_portrait,
        radius: 40,width: 80,heigth: 80,
        type: _isFile.value == false ? 1 : 3,
        imageFile: _file,
      )),
    );
    // return buildIconButton(context);

  }

  IconButton buildIconButton(BuildContext context) {
    // IconButton 有内边距，不方便左对齐
    return IconButton(
      onPressed: (){
        print('头像点击了');
        // showCupertinoAlert(context);
        // showCupertinoBottomAlert(context);
        showModalBottomAlert(context);
      },
      icon: Obx(() =>  CircularImageWidget(
        imageName: AKImageAssets.myTophead_portrait,
        radius: 40,width: 80,heigth: 80,
        type: _isFile.value == false ? 1 : 3,
        imageFile: _file,
      ))

  );
  }

  Stack buildStack(BuildContext context) {
    return Stack(
    // alignment: Alignment.bottomCenter,
    fit: StackFit.expand,
    children: [
      // FileImage(file)
      Image.asset(
        AKImageAssets.myTopBackgroundImage,
        fit: BoxFit.fill,
        width: ScreenUtil().screenWidth,
      ),
      Positioned(
          bottom: 10,
          left: 15,
          child: IconButton(
              onPressed: (){
                print('头像点击了');
                // showCupertinoAlert(context);
                // showCupertinoBottomAlert(context);
                showModalBottomAlert(context);
              },
              icon:
            Obx(() =>  CircularImageWidget(
              imageName: AKImageAssets.myTophead_portrait,
              radius: 50,width: 100,heigth: 100,
              type: _isFile.value == false ? 1 : 3,
              imageFile: _file,
            )
            )


          )
      )
    ],

  );
  }




//选择头像弹窗
  void showModalBottomAlert(BuildContext context) {
    showModalBottomSheet(context: context, builder:(BuildContext context) {
      return BottomAlert(
        onTapGallery: (){
           ImageUtils.getImage().then((value){
             printDebug('ImageUtils== $value');
             changeImage(value);
           });
        },
        onTapCamera: (){
          ImageUtils.getCamera().then((value){
            changeImage(value);
          });
        },
      );
      
    });
  }


  void changeImage(File? file){
    if(file == null){
    }else{
      _file = file;
      setState(() {
        _isFile.value = true;
      });
    }
  }

  void showCupertinoAlert(BuildContext context){
    showCupertinoDialog(context: context, builder: (BuildContext context){
      return CupertinoAlertDialog(
        title: Text('对话框'),
        content: Text('请选择'),
        actions: [
          TextButton(onPressed: (){print('取消点击了');Navigator.pop(context);}, child: Text('取消')),
          TextButton(onPressed: (){print('确定点击了');}, child: Text('确定'))

        ],
      );

    });

  }

  void showCupertinoBottomAlert(BuildContext context) {
    showBottomSheet(context: context, builder:(BuildContext context) {
      return Container(
        height: 300,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (ctx,index){
            return TextButton(
                onPressed: (){
                  if(index==0){
                    Navigator.pop(context);
                  }else if(index == 1){
                    Navigator.pop(context);
                  }else if(index == 2){
                    Navigator.pop(context);
                  }
                },
                child: Text(index==0?'相机':index==1?'相册':'取消')
            );
          }
        ),
      );
    });
  }



  void showMaterialAlert(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text('对话框'),
        content: Text('请选择'),
        actions: [
          TextButton(onPressed: (){print('取消点击了');}, child: Text('取消')),
          TextButton(onPressed: (){print('确定点击了');}, child: Text('确定'))

        ],
      );

    });
  }







}
