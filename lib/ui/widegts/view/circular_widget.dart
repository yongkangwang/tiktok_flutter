import 'dart:html';

import 'package:flutter/material.dart';
import '../../sheard/image_assets.dart';

class CircularImageWidget extends StatelessWidget {
  // const CircularWidget({super.key});


  const CircularImageWidget({
    Key? key,
    this.imageName,
    this.radius,
    this.width,
    this.heigth,
    this.type = 1,
    this.imageFile
  }):super (key: key);

  final String? imageName;
  final double? radius;
  final double? width;
  final double? heigth;
  // type 1资源图片，2网络图片，3用户从相册中选的图片文件
  final double? type;
  final File? imageFile;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();

    return Container(
      width: width,
      height: heigth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius??0),
          border: Border.fromBorderSide(BorderSide(color: Colors.white,width: 2)),
          image: DecorationImage(
             // image:
            // 需要是ImageProvider或者他的子类
            image: type == 1 ? AssetImage(imageName??'')
                : type == 2 ? AssetImage('url') : AssetImage('url')

            // AssetImage(imageName??'')
            // type? == 1
              // ? AssetImage(imageName??'')
              // : NetworkImage(imageName??'')

          )
      ),
    );


  }
}
