import 'dart:async';

import 'package:base_flutter_tci/_core/constants/app_constant.dart';
import 'package:base_flutter_tci/_core/utils/logger.dart';
import 'package:base_flutter_tci/data/auth/models/user_model.dart';
import 'package:get_storage/get_storage.dart';

abstract class AuthLocalDatasource {
  StreamController<UserModel?> get streamUserModel;

  Future<void> storeUser(UserModel user);

  Future<void> storeToken(String token);

  Future<UserModel?> loadUser();

  Future<String?> loadToken();

  Future<void> deleteUser();

  Future<void> deleteToken();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final GetStorage storage;
  final _controller = StreamController<UserModel?>();

  AuthLocalDatasourceImpl(this.storage) {
    storage.listenKey(AppConstant.kUser, (_) async {
      logger.i("USER UPDATE!");
      try {
        final userModel = await loadUser();
        _controller.add(userModel);
      } catch (e) {
        logger.e(e);
      }
    });
  }

  @override
  Future<UserModel?> loadUser() {
    if (storage.hasData(AppConstant.kUser)) {
      UserModel? user;
      try {
        dynamic json = storage.read(AppConstant.kUser);
        if(json != null){
          user = UserModel.fromJson(json);
        }
      } catch (e, s) {
        logger.e('loadUser', error: e, stackTrace: s);
      }
      return Future(() => user);
    }
    return Future(() => null);
  }

  @override
  Future<void> storeUser(UserModel user) {
    return Future(() => storage.write(AppConstant.kUser, user.toJson()));
  }

  @override
  Future<void> deleteUser() {
    return Future(() => storage.remove(AppConstant.kUser));
  }

  @override
  Future<String?> loadToken() {
    if (storage.hasData(AppConstant.kToken)) {
      String? token;
      try {
        token = storage.read<String>(AppConstant.kToken);
      } catch (e, s) {
        logger.e('loadToken', error: e, stackTrace: s);
      }
      return Future(() => token ?? '');
    }
    return Future(() => null);
  }

  @override
  Future<void> storeToken(String token) {
    return Future(() => storage.write(AppConstant.kToken, token));
  }

  @override
  Future<void> deleteToken() {
    return Future(() => storage.remove(AppConstant.kToken));
  }

  @override
  StreamController<UserModel?> get streamUserModel => _controller;
}
