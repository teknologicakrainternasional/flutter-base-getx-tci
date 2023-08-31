import 'package:base_flutter_tci/_core/constants/app_constant.dart';
import 'package:base_flutter_tci/_core/constants/app_flavor.dart';
import 'package:base_flutter_tci/data/_core/app_exceptions.dart';
import 'package:base_flutter_tci/data/_core/interceptors/base_interceptor.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/http.dart';

class ApiBaseHelper {
  final GetHttpClient client;
  final List<BaseInterceptor> interceptors;

  ApiBaseHelper({required this.client, this.interceptors = const []}) {
    client.baseUrl = AppFlavor.instance.baseUrl;
    client.timeout = const Duration(
      milliseconds: AppConstant.kConnectionTimeout,
    );
    for (var interceptor in interceptors) {
      client.addRequestModifier(interceptor.requestInterceptor);
      client.addResponseModifier(interceptor.responseInterceptor);
    }
  }

  Future<dynamic> getApi(String url, {Map<String, String>? query}) async {
    final response = await client.get(url, query: query);
    if (response.isOk) {
      return response.body;
    } else {
      throw AppException.network(response.statusCode);
    }
  }

  Future<dynamic> postApi(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? query,
  }) async {
    final response = await client.post(url, body: body, query: query);
    if (response.isOk) {
      return response.body;
    } else {
      throw AppException.network(response.statusCode);
    }
  }
}
