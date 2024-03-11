
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


class PlayPauseGesture extends StatefulWidget {
  // const PlayPauseGesture({super.key});

  PlayPauseGesture({
    required this.child,
     this.onSingleTap,
     this.onAddFavorite,

  });

  final Widget child;
  final Function? onSingleTap;
  final Function? onAddFavorite;

  @override
  State<PlayPauseGesture> createState() => _PlayPauseGestureState();
}

class _PlayPauseGestureState extends State<PlayPauseGesture> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return GestureDetector(
      onTap: (){
        widget.onSingleTap?.call();
      },
      child: widget.child

    );


  }
}
