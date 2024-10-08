import 'package:bookmybeauty/screens/login_screen/controller/login_controller.dart';
import 'package:get/get.dart';
import '../screens/guide_screens/controller/guide_tour_controller.dart';

class AppBinding implements Bindings {

  @override
  void dependencies() {
    Get.put<LoginController>(LoginController(), permanent: true);
    // LazyPut ensures that the controller is only created when it is used.
    //Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<GuideTourController>(() => GuideTourController());
    }
}