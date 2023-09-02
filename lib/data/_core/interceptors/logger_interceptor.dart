import 'dart:async';

import 'package:base_flutter_tci/_core/constants/app_constant.dart';
import 'package:base_flutter_tci/_core/utils/alice_get_connect.dart';
import 'package:base_flutter_tci/_core/utils/logger.dart';
import 'package:base_flutter_tci/data/_core/interceptors/base_interceptor.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class LoggerInterceptor implements BaseInterceptor {
  final AliceGetConnect alice;

  LoggerInterceptor(this.alice);

  @override
  FutureOr<Request> requestInterceptor(Request request) async {
    var message = {
      'REQUEST URL:': request.url,
      'REQUEST HEADER:': request.headers,
      'REQUEST METHOD:': request.method,
      'REQUEST BODY:': await request.getBody(),
    };

    logger.i(message);
    alice.onRequest(
      request,
      timeoutMillisecond: AppConstant.kConnectionTimeout,
      onConnectionTimeout: _onConnectionTimeout,
    );
    return request;
  }

  @override
  FutureOr responseInterceptor(Request request, Response response) async {
    var message = <String, dynamic>{
      'RESPONSE URL:': request.url,
      'RESPONSE CODE:': response.statusCode,
      'RESPONSE MESSAGE:': response.statusText,
      'RESPONSE HEADER:': response.headers,
      'RESPONSE BODY:': response.body,
      'RESPONSE UNAUTHORIZED:': response.unauthorized,
    };
    logger.i(message);
    alice.onResponse(request, response);

    return response;
  }

  _onConnectionTimeout(Request request) async {
    var message = {
      'REQUEST URL:': request.url,
      'REQUEST HEADER:': request.headers,
      'REQUEST METHOD:': request.method,
      'REQUEST BODY:': await request.getBody(),
      'REQUEST TIMEOUT:': true,
    };
    logger.w(message);
  }
}
