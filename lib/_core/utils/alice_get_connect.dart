import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_alice/core/alice_core.dart';
import 'package:flutter_alice/model/alice_form_data_file.dart';
import 'package:flutter_alice/model/alice_from_data_field.dart';
import 'package:flutter_alice/model/alice_http_call.dart';
import 'package:flutter_alice/model/alice_http_error.dart';
import 'package:flutter_alice/model/alice_http_request.dart';
import 'package:flutter_alice/model/alice_http_response.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class AliceGetConnect {
  /// Should user be notified with notification if there's new request catched
  /// by Alice
  final bool showNotification;

  /// Should inspector be opened on device shake (works only with physical
  /// with sensors)
  final bool showInspectorOnShake;

  /// Should inspector use dark theme
  final bool darkTheme;

  /// Icon url for notification
  final String notificationIcon;

  GlobalKey<NavigatorState>? _navigatorKey;
  late AliceCore _aliceCore;

  /// Creates alice instance.
  AliceGetConnect({
    GlobalKey<NavigatorState>? navigatorKey,
    this.showNotification = true,
    this.showInspectorOnShake = false,
    this.darkTheme = false,
    this.notificationIcon = "@mipmap/ic_launcher",
  }) {
    _navigatorKey = navigatorKey ?? GlobalKey<NavigatorState>();
    _aliceCore = AliceCore(
      _navigatorKey,
      showNotification,
      showInspectorOnShake,
      darkTheme,
      notificationIcon,
    );
  }

  /// Set custom navigation key. This will help if there's route library.
  void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    _aliceCore.setNavigatorKey(navigatorKey);
  }

  /// Get currently used navigation key
  GlobalKey<NavigatorState>? getNavigatorKey() {
    return _navigatorKey;
  }

  void onRequest(
    Request request, {
    int? timeoutMillisecond,
    Function(Request)? onConnectionTimeout,
  }) async {
    request.headers['date'] = DateTime.timestamp().toString();
    AliceHttpCall call = AliceHttpCall(_getRequestHashCode(request));
    call.method = request.method;
    call.endpoint = request.url.path;
    call.server = request.url.host;
    call.client = "Get Connect";
    if (request.url.scheme.contains("https")) {
      call.secure = true;
    }
    AliceHttpRequest aliceHttpRequest = AliceHttpRequest();

    aliceHttpRequest.size = request.contentLength??0;
    aliceHttpRequest.body = await request.getBody();
    if(aliceHttpRequest.body == 'Form Data'){
      final listFormData = await request.toListFormData();
      aliceHttpRequest.formDataFields = listFormData.whereType<AliceFormDataField>().toList();
      aliceHttpRequest.formDataFiles = listFormData.whereType<AliceFormDataFile>().toList();
    }

    aliceHttpRequest.time = DateTime.now();
    aliceHttpRequest.headers = request.headers;

    String? contentType = "unknown";
    if (request.headers.containsKey("Content-Type")) {
      contentType = request.headers["Content-Type"];
    }
    aliceHttpRequest.contentType = contentType;
    aliceHttpRequest.queryParameters = request.url.queryParameters;

    call.request = aliceHttpRequest;
    call.response = AliceHttpResponse();

    _aliceCore.addCall(call);

    if(timeoutMillisecond != null){
      //HANDLE CONNECTION TIMEOUT
      final actualTimeout = timeoutMillisecond + 1000;
      Future.delayed(Duration(milliseconds: actualTimeout)).then((value) {
        final requestId = _getRequestHashCode(request);
        final call = _selectCall(requestId);
        //WHEN STILL WAITING FOR REQUEST
        if (call != null && call.loading) {
          _aliceCore.addResponse(AliceHttpResponse(), requestId);
          _aliceCore.addError(
            AliceHttpError()..error = 'Connection Timeout',
            requestId,
          );
          if(onConnectionTimeout != null){
            onConnectionTimeout(request);
          }
        }
      });
    }
  }

  void onResponse(Request request, Response response) {
    var httpResponse = AliceHttpResponse();
    httpResponse.status = response.statusCode ?? 0;
    if (response.body == null) {
      httpResponse.body = "";
      httpResponse.size = 0;
    } else {
      httpResponse.body = response.body;
      httpResponse.size = utf8.encode(response.body.toString()).length;
    }
    httpResponse.time = DateTime.now();
    Map<String, String> headers = {};
    response.headers?.forEach((header, values) {
      headers[header] = values.toString();
    });
    httpResponse.headers = headers;

    _aliceCore.addResponse(
      httpResponse,
      _getRequestHashCode(request),
    );
  }

  int _getRequestHashCode(Request request) {
    int hashCodeSum = 0;
    hashCodeSum += request.url.hashCode;
    hashCodeSum += request.method.hashCode;
    if (request.headers.isNotEmpty) {
      request.headers.forEach((key, value) {
        hashCodeSum += key.hashCode;
        hashCodeSum += value.hashCode;
      });
    }
    if (request.contentLength != null) {
      hashCodeSum += request.contentLength.hashCode;
    }

    return hashCodeSum.hashCode;
  }

  AliceHttpCall? _selectCall(int requestId) {
    return _aliceCore.callsSubject.value.firstWhereOrNull((call) {
      return call.id == requestId;
    });
  }
}

extension GetConnectRequestX on Request{
  Future<String?> getBody() async{
    if (method.toLowerCase() == 'post') {
      if (contentType.contains('multipart/form-data')) {
        return 'Form Data';
      } else{
        return utf8.decode(await bodyBytes.toBytes());
      }
    }
    return null;
  }

  String get contentType{
    return headers['content-type']??'';
  }

  String get boundary{
    List<String> parts = contentType.split(";");
    for (String part in parts) {
      if (part.trim().startsWith("boundary=")) {
        String boundary = part.trim().substring("boundary=".length);
        boundary = boundary.trim();
        return boundary;
      }
    }

    return "";
  }

  Future<List<dynamic>> toListFormData() async{
    List<dynamic> formDataList = [];
    if(boundary.isNotEmpty){
      final separator = '--$boundary\r\n';
      final close = '--$boundary--\r\n';
      final data = utf8.decode(await bodyBytes.toBytes(), allowMalformed: true);
      final clearData = data.replaceAll(close, '');
      final inputList = clearData.split(separator).toList();

      for (String inputString in inputList) {
        if(inputString.contains('content-disposition: form-data')){
          if (inputString.contains('filename')) {
            final List<String> parts = inputString.split('\r\n').where((e)=>e.isNotEmpty).toList();
            if(parts.length >= 2){
              final String stringContainFileName = parts[0];
              final String stringContainContentType = parts[1];
              final String content = parts[2];
              String fileName = '';
              String contentType = '';

              final RegExp regexFn = RegExp(r'filename="([^"]+)"');
              final Match? matchFn = regexFn.firstMatch(stringContainFileName);
              if (matchFn != null) {
                fileName = matchFn.group(1)!;
              }

              final RegExp regexCt = RegExp(r'content-type: ([^ ]+)');
              final Match? matchCt = regexCt.firstMatch(stringContainContentType);
              if (matchCt != null) {
                contentType = matchCt.group(1)!;
              }

              if(fileName.isNotEmpty && contentType.isNotEmpty){
                formDataList.add(AliceFormDataFile(fileName, contentType, content.length));
              }
            }
          } else if (inputString.contains('name')) {
            final List<String> parts = inputString.split('\r\n').where((e)=>e.isNotEmpty).toList();
            if(parts.length >= 2){
              final String stringContainName = parts[0];
              final String value = parts[1];
              String name = '';

              final RegExp regex = RegExp(r'name="([^"]+)"');
              final Match? match = regex.firstMatch(stringContainName);
              if(match != null){
                name = match.group(1)!;
              }

              if(name.isNotEmpty && value.isNotEmpty){
                formDataList.add(AliceFormDataField(name, value));
              }
            }
          }
        }
      }
    }
    return formDataList;
  }
}
