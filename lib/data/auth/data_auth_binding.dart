import 'package:base_flutter_tci/data/auth/datasources/auth_local_datasource.dart';
import 'package:base_flutter_tci/data/auth/datasources/auth_remote_datasource.dart';
import 'package:base_flutter_tci/data/auth/repositories/auth_repository_impl.dart';
import 'package:base_flutter_tci/domain/auth/repositories/auth_repository.dart';
import 'package:get/get.dart';

class DataAuthBinding extends Bindings{
  @override
  void dependencies() {
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