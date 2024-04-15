

import 'dart:io';

import 'package:flutter/material.dart';
import '../../sheard/image_assets.dart';
import 'package:bili_flutter/ui/sheard/means.dart';

class CircularImageWidget extends StatelessWidget {
  // const CircularWidget({super.key});


  const CircularImageWidget({
    super.key,
    this.imageName,
    this.radius,
    this.width,
    this.heigth,
    this.type = 1,
    this.imageFile
  });
  final String? imageName;//资源图片路径或者网络url
  final double? radius;
  final double? width;
  final double? heigth;
  // type 1资源图片，2网络图片，3用户从相册中选的图片文件
  final double? type;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    // FadeInImage.assetNetwork  淡入效果，无本地缓存
    // printDebug('object圆角图片  ${imageName}');

    return Container(
      width: width,
      height: heigth,
      child: _buildImage(),
      /*
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius??0),
          border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 2)),
          image: DecorationImage(
             image: AssetImage(imageName??'')
            // 需要是ImageProvider或者他的子类,而且只能返回相同类型的，不能AssetImage和NetworkImage同时出现
            // image: type == 1 ? NetworkImage(imageName??'')
            //     : type == 2 ? NetworkImage('url') : NetworkImage('url')

            //   image: type == 1 ? AssetImage(imageName??'') : NetworkImage(imageName??'')

          )
          
      ),

       */
    );


  }

  Widget _buildImage(){
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius??0),
      child: type == 1 ? Image.asset(imageName??'')
           : type == 2 ? Image.network(imageName??'') : Image.file(imageFile??File('path'),fit: BoxFit.fill,)
    );
  }


}
