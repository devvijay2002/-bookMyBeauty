import 'package:get/get.dart';

class HomeController extends GetxController{
  RxString saloonSelectedType ='Men'.obs;

  void updateSaloonSelectedType ({required String selectedType}){
    saloonSelectedType.value =selectedType;
  }
}