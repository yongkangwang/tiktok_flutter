

import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

class CartoonState {

  late List<Widget> cartoonList;
  late int pageNum;
  late int pageSize;
  late bool hadMore;
  late bool isLoading;

  late SwiperController swiperController;

  CartoonState() {
    ///Initialize variables
    cartoonList = [];
    pageNum = 1;
    pageSize = 10;
    hadMore = true;
    isLoading = false;
    swiperController = SwiperController();

  }
}
