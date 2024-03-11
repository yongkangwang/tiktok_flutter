
import 'package:get/get.dart';
import '../mall/mall_logic.dart';

class MallBinding extends Bindings{

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MallBinding());
  }
}