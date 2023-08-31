import 'package:base_flutter_tci/data/_core/api_base_helper.dart';
import 'package:base_flutter_tci/data/_core/app_exceptions.dart';
import 'package:base_flutter_tci/data/_core/models/response_model.dart';
import 'package:base_flutter_tci/data/auth/auth_endpoints.dart';
import 'package:base_flutter_tci/data/auth/models/login_model.dart';
import 'package:base_flutter_tci/data/auth/models/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<String> getToken({
    required String username,
    required String password,
  });

  Future<UserModel> getUser();
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final ApiBaseHelper apiBaseHelper;

  AuthRemoteDatasourceImpl(this.apiBaseHelper);

  /// Return [UserModel] from api
  /// An [AppException.validation] will be thrown when the status is false
  /// An [AppException.network] will be thrown when network error
  /// An [AppException.parsingData] will be thrown when error while parsing json
  @override
  Future<UserModel> getUser() async {
    final responseBody = await apiBaseHelper.getApi(AuthEndpoints.getUser);
    final model = ResponseModel.fromJson(responseBody, UserModel.fromJson);
    if (!model.status) {
      throw AppException.validation(model.message, model.errors);
    }
    return model.data ?? UserModel();
  }

  /// Return token from api
  /// An [AppException.validation] will be thrown when the status is false
  /// An [AppException.network] will be thrown when network error
  /// An [AppException.parsingData] will be thrown when error while parsing json
  @override
  Future<String> getToken({
    required String username,
    required String password,
  }) async {
    final responseBody = await apiBaseHelper.postApi(
      AuthEndpoints.login,
      {"username": username, "password": password},
    );
    final model = ResponseModel.fromJson(responseBody, LoginModel.fromJson);
    if (!model.status) {
      throw AppException.validation(model.message, model.errors);
    }
    return model.data?.accessToken??'';
  }
}
