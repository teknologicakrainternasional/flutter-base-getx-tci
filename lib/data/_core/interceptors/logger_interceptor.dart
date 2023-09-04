import 'dart:async';
import 'dart:convert';

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
    var message = await _getRequestMap(request);

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

  Future<Map<String, dynamic>> _getRequestMap(Request request) async{
    var message = {
      'REQUEST URL:': request.url,
      'REQUEST HEADER:': request.headers,
      'REQUEST METHOD:': request.method,
    };
    final body = await request.getBody();
    if(body != null && body.isNotEmpty){
      try{
        message['REQUEST BODY'] = json.decode(body);
      }catch(e, s){
        logger.e("_getRequestMap", error: e, stackTrace: s);
      }
    }
    return message;
  }

  _onConnectionTimeout(Request request) async {
    final message = await _getRequestMap(request);
    message['REQUEST TIMEOUT'] = true;
    logger.w(message);
  }
}
