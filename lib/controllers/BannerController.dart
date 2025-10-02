import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BannerController extends GetxController{
  final PageController pageController= PageController();
  var currentPage= 0.obs;

  final List<String> banners = [
    "https://picsum.photos/id/1015/800/300",
    "https://picsum.photos/id/1016/800/300",
    "https://picsum.photos/id/1018/800/300",
    "https://picsum.photos/id/1020/800/300",
  ];
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (currentPage.value < banners.length - 1) {
        currentPage.value++;
      } else {
        currentPage.value = 0;
      }
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}