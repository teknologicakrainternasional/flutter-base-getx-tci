import 'package:base_flutter_tci/presentation/screens/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(Get.find()));
  }
}
