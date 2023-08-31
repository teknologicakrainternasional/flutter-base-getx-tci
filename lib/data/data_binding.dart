import 'package:base_flutter_tci/data/_core/api_base_helper.dart';
import 'package:base_flutter_tci/data/_core/interceptors/auth_interceptor.dart';
import 'package:base_flutter_tci/data/_core/interceptors/logger_interceptor.dart';
import 'package:base_flutter_tci/data/auth/data_auth_binding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DataBinding extends Bindings {
  @override
  void dependencies() {
    //GET STORAGE
    Get.put(GetStorage(), permanent: true);
    //API BASE HELPER
    Get.put(
      ApiBaseHelper(
        client: GetConnect().httpClient,
        interceptors: [
          AuthInterceptor(Get.find()),
          LoggerInterceptor(Get.find()),
        ],
      ),
      permanent: true,
    );

    //AUTH
    DataAuthBinding().dependencies();
  }
}
