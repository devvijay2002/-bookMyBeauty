import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GuideTourController extends GetxController {
  var currentPage = 0.obs;
  PageController pageController = PageController();

  void updatePage(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 2) {
      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }
}
