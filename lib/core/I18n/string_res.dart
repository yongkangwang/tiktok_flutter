

import 'package:get/get_navigation/src/root/internacionalization.dart';

import 'str_res_en.dart';
import 'str_res_zh.dart';


//

class StringRex extends Translations{
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys =>{
//    中文
    'zh_CN': strResZh,
    ///英文
    'en_US': strResEn,
  };
}

// class StringRes extends Translations{
//
//   Map<String, Map<String, String>> get keys;
//
//
// }