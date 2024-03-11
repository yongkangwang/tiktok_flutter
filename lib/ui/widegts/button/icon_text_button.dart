
import 'package:flutter/material.dart';


class IconTextButton extends StatelessWidget {
  // const IconTextButton({super.key});

  const IconTextButton({
    Key? key,
    this.icon,
    this.text,
    this.onTap,
    this.iconSize
  }):super(key: key);

  final Widget? icon;
  final String? text;
  final Function? onTap;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return Container(

      child: Column(
        children: [
          IconButton(
            onPressed: (){
              onTap?.call();
              },
            icon: icon??Container(),
            iconSize: iconSize??40,
            padding:const EdgeInsets.all(0.0),

          ),
          Text(text??'',style: TextStyle(color: Colors.white),)
        ],
      ),
    );


  }
}
