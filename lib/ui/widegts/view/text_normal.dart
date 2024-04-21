import 'package:flutter/material.dart';

import '../../sheard/app_theme.dart';



class TextNormal extends StatelessWidget {
  const TextNormal(
    this.text,{
    super.key,
    this.fontSize = AKAppTheme.normalFontSize,
    this.color = AKAppTheme.norTextColors
  });

  final String text;
  final double fontSize;
  final Color color;



  @override
  Widget build(BuildContext context) {
    // return const Placeholder();

    return Text(text,style: TextStyle(fontSize: fontSize,color: color),);
  }




  
  
}
