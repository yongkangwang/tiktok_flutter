
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageUtils{

  /// 图片选取
  static Future<File?> getImage() async {
    final XFile? file = await ImagePicker().pickImage(
        source: ImageSource.gallery,//图库选择
      // maxWidth: 100.0, // 设置图片最大宽度，间接压缩了图片的体积
    );


    /// 选取图片失败file为null，要注意判断下。
    /// 获取图片路径后可以上传到服务器上
         print('${file?.path}');
    if(file == null){
      return null;
    }else{
      return File(file.path);
    }

  }

  /// 视频选取
  static Future<File?> getCamera() async {
    final XFile? file = await ImagePicker().pickVideo(
      source: ImageSource.camera, // 调用相机拍摄
    );
    print('${file?.path}');
    if(file == null){
      return null;
    }else{
      return File(file.path);
    }
  }

}