
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class BottomAlert extends StatelessWidget {
  // const BottomAlert({super.key});

  const BottomAlert({
    Key? key,
    this.onTapGallery,
    this.onTapCamera

}):super(key: key);

  final Function? onTapGallery;
  final Function? onTapCamera;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();

    return Container(
      height: 240,
      child: Column(
        children: [
          InkWell(
            onTap: (){
              Navigator.pop(context);
              onTapCamera?.call();
            },
            child: _buildText('相机'),
          ),
          // Divider(height: 5,),
          InkWell(
            onTap: (){
              Navigator.pop(context);
              onTapGallery?.call();
            },
            child: _buildText('相册'),
          ),
          Divider(height: 15,),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: _buildText('取消'),
          ),
        ],
      ),
    );

  }


  Widget _buildText(@required String title){

    return Container(
      alignment: Alignment.center,
      height: 55,
      child: Text(title),
    );
  }

}
