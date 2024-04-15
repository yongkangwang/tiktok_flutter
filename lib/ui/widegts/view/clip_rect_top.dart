import 'package:flutter/material.dart';

class ClipRectTopLeftRightWidget extends StatelessWidget {

  // 剪辑左上角和右上角  圆角
  // const ClipRectTopLeftRightWidget({super.key});
  const ClipRectTopLeftRightWidget({
    Key? key,
    required this.child,
    this.radius = 0
  }):super(key:key);

  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(radius),
        topLeft: Radius.circular(radius)
      ),
      child: child,
    );
  }


}
