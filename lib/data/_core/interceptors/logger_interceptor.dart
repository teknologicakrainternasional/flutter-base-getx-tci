import 'dart:async';
import 'dart:convert';

import 'package:alice_get_connect/alice_get_connect.dart';
import 'package:alice_get_connect/base_interceptor.dart';
import 'package:base_flutter_tci/_core/utils/logger.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class LoggerInterceptor implements BaseInterceptor {
  @override
  FutureOr<Request> requestInterceptor(Request request) async {
    var message = await _getRequestMap(request);
    logger.i(message);
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

    return response;
  }

  Future<Map<String, dynamic>> _getRequestMap(Request request) async {
    var message = {
      'REQUEST URL:': request.url,
      'REQUEST HEADER:': request.headers,
      'REQUEST METHOD:': request.method,
    };
    final body = await request.getBody();
    if (body != null && body.isNotEmpty) {
      try {
        if ((request.headers['content-type'] ?? '')
            .contains('application/json')) {
          message['REQUEST BODY'] = json.decode(body);
        } else {
          message['REQUEST BODY'] = body;
        }
      } catch (e, s) {
        logger.e("_getRequestMap", error: e, stackTrace: s);
      }
    }
    return message;
  }
}
