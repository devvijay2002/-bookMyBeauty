import 'package:get/get.dart';

class SharedController extends GetxController{
  RxInt currentIndex =0.obs;

  void updateImageIndex({required int index}){
    currentIndex.value =index;
  }
}
