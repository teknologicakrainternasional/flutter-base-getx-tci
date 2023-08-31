import 'package:base_flutter_tci/data/_core/api_base_helper.dart';
import 'package:base_flutter_tci/data/_core/interceptors/auth_interceptor.dart';
import 'package:base_flutter_tci/data/_core/interceptors/logger_interceptor.dart';
import 'package:base_flutter_tci/data/auth/datasources/auth_local_datasource.dart';
import 'package:base_flutter_tci/data/auth/datasources/auth_remote_datasource.dart';
import 'package:base_flutter_tci/data/auth/repositories/auth_repository_impl.dart';
import 'package:base_flutter_tci/domain/auth/repositories/auth_repository.dart';
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

    //DATASOURCE
    Get.lazyPut<AuthLocalDatasource>(
      () => AuthLocalDatasourceImpl(Get.find()),
      fenix: true,
    );
    Get.lazyPut<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl(Get.find()),
      fenix: true,
    );

    //REPOSITORY
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        localDatasource: Get.find(),
        remoteDatasource: Get.find(),
      ),
      fenix: true,
    );
  }
}
