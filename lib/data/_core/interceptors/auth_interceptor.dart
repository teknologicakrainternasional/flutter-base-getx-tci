import 'dart:async';
import 'dart:io';

import 'package:alice_get_connect/base_interceptor.dart';
import 'package:base_flutter_tci/_core/constants/app_constant.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get_storage/get_storage.dart';

class AuthInterceptor implements BaseInterceptor {
  final GetStorage storage;

  AuthInterceptor(this.storage);

  @override
  FutureOr<Request> requestInterceptor(Request request) {
    var token = storage.read<String>(AppConstant.kToken) ?? '';
    request.headers[HttpHeaders.authorizationHeader] = "Bearer $token";
    return Future(() => request);
  }

  @override
  FutureOr responseInterceptor(Request request, Response response) {
    if (response.unauthorized) {
      storage.remove(AppConstant.kUser);
      storage.remove(AppConstant.kToken);
    }
    return Future(() => response);
  }
}
