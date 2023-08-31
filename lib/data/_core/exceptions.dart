import 'package:base_flutter_tci/_core/constants/app_constant.dart';
import 'package:base_flutter_tci/data/_core/models/response_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class NetworkException implements Exception {
  final int? statusCode;

  NetworkException({this.statusCode});

  HttpStatus get httpStatus => HttpStatus(statusCode);

  String get message {
    return (isConnectionError
            ? AppConstant.kConnectionError
            : statusCode.toString())
        .tr;
  }

  bool get isConnectionError => httpStatus.connectionError;

  bool get isInformation => httpStatus.between(
        HttpStatus.continue_,
        HttpStatus.switchingProtocols,
      );

  bool get isOK => httpStatus.isOk;

  bool get isRedirect => httpStatus.between(
        HttpStatus.multipleChoices,
        HttpStatus.permanentRedirect,
      );

  bool get isClientError => httpStatus.between(
        HttpStatus.badRequest,
        HttpStatus.unavailableForLegalReasons,
      );

  bool get isServerError => httpStatus.between(
        HttpStatus.internalServerError,
        HttpStatus.networkAuthenticationRequired,
      );

  bool get hasError => !isOK;

  @override
  String toString() {
    return "NetworkException ([${statusCode ?? AppConstant.kConnectionError}] $message)";
  }
}

class ParsingDataException implements Exception {
  @override
  String toString() {
    return "ParsingDataException";
  }
}

class ValidationException implements Exception {
  final String? message;
  final List<ErrorModel>? errors;

  ValidationException({this.message, this.errors});

  @override
  String toString() {
    final arrDetail = <String>[];
    if (message != null && message!.isNotEmpty) {
      arrDetail.add(message!);
    }
    final arrError = errors?.map((e) => {e.attribute: e.text}).toList();
    if (arrError != null && arrError.isNotEmpty) {
      arrDetail.add(arrError.toString());
    }
    String detail = '';
    if (arrDetail.isNotEmpty) {
      detail = ' (${arrDetail.toString()})';
    }

    return "ValidationException$detail";
  }
}
