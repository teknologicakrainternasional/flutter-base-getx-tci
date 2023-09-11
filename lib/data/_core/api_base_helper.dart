import 'package:alice_get_connect/base_interceptor.dart';
import 'package:base_flutter_tci/_core/constants/app_constant.dart';
import 'package:base_flutter_tci/_core/constants/app_flavor.dart';
import 'package:base_flutter_tci/data/_core/app_exceptions.dart';
import 'package:get/get.dart';

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

  Future getApi(String url, {Map<String, String>? query}) async {
    final response = await client.get(url, query: query);
    return _handleResponse(response);
  }

  Future postApi(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? query,
    bool isFormData = false,
  }) async {
    final response = await client.post(
      url,
      body: _getBody(body, isFormData: isFormData),
      query: query,
    );
    return _handleResponse(response);
  }

  Future putApi(
    String url,
    Map<String, dynamic> body, {
    Map<String, String>? query,
    bool isFormData = false,
  }) async {
    final response = await client.put(
      url,
      body: _getBody(body, isFormData: isFormData),
      query: query,
    );
    return _handleResponse(response);
  }

  dynamic _getBody(Map<String, dynamic> body, {bool isFormData = false}) {
    bool useFormData = isFormData;
    if (body.containMultipartFile()) {
      useFormData = true;
    }
    return useFormData ? FormData(body) : body;
  }

  dynamic _handleResponse(Response response) {
    if (response.isOk) {
      return response.body;
    } else {
      throw AppException.network(response.statusCode);
    }
  }
}

extension MapCheckingX on Map<String, dynamic> {
  bool containMultipartFile() {
    for (var value in values) {
      if (value is MultipartFile) {
        return true;
      }
    }
    return false;
  }
}
