import 'package:base_flutter_tci/presentation/screens/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(Get.find()));
  }
}
