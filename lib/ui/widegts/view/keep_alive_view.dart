import 'package:flutter/material.dart';




// 有些部件一旦页面滑出屏幕它就会被销毁，用这个部件包裹的页面状态会被缓存，不会被销毁，
class KeepAliveWrapper extends StatefulWidget {
  // const KeepAliveWrapper({super.key});
  final Widget child;

  const KeepAliveWrapper({required this.child});

  @override
  State<KeepAliveWrapper> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    super.build(context);
    return widget.child;
  }

  @override
  // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => throw UnimplementedError();

  bool get wantKeepAlive => true;


}
