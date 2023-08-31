import 'package:base_flutter_tci/presentation/_core/controllers/auth_controller.dart';
import 'package:get/get.dart';

class PresentationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(Get.find()), permanent: true);
  }
}
