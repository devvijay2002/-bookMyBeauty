import 'package:get/get.dart';

class SaloonListController extends GetxController {
  var saloons = <String>[].obs; // Observable list of salons
  var searchQuery = ''.obs; // Observable for search query

  void fetchSaloons() {
    saloons.value = ["Saloon1", "Saloon2", "Saloon3", "Saloon4", "Saloon5"];
  }

  void searchSaloon(String query) {
    searchQuery.value = query;
    // You can add search filtering logic here if needed
  }
}
