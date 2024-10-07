import 'package:get/get.dart';
import '../global_controllers/shared_controller.dart';
import '../screens/guide_tour/controller/guide_tour_controller.dart';
import '../screens/home/controller/home_controller.dart';
import '../screens/home/controller/saloon_list_controller.dart';
import '../screens/login/controller/login_controller.dart';
import '../screens/my_account/controller/my_account_controller.dart';

class AppBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);
    // LazyPut ensures that the controller is only created when it is used.
    //Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<GuideTourController>(() => GuideTourController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<SaloonListController>(() => SaloonListController());
    Get.lazyPut<MyAccountController>(() => MyAccountController());
    Get.lazyPut<SharedController>(() => SharedController());
    }
}