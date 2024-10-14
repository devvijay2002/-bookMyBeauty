import 'package:get/get.dart';

class HomeController extends GetxController{
  RxString saloonSelectedType ='Men'.obs;
  RxList bannerImageList =[].obs;

  void updateBannerImageList({required List<String> imageList})async{
    bannerImageList.value =imageList;
  }

  void updateSaloonSelectedType ({required String selectedType}){
    saloonSelectedType.value =selectedType;
  }

}