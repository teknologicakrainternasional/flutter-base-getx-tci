import 'package:base_flutter_tci/_core/constants/app_constant.dart';
import 'package:base_flutter_tci/data/_core/app_exceptions.dart';
import 'package:base_flutter_tci/data/_core/models/response_model.dart';
import 'package:base_flutter_tci/domain/_core/failures/app_failures.dart' as af;
import 'package:get/get_utils/src/extensions/internacionalization.dart';

extension StatusCodeX on int? {
  String get toStatusMessage {
    if (this == null) {
      return AppConstant.kConnectionError.tr;
    }
    return toString().tr;
  }
}

extension ListErrorModelX on List<ErrorModel> {
  Map<String, String> toErrorMap() {
    final errorMap = <String, String>{};
    for (final error in this) {
      errorMap[error.attribute] = error.text;
    }
    return errorMap;
  }
}

extension AppFailureParsingDataX on af.ParsingData {
  String get message => AppConstant.kParsingDataCode.tr;
}

extension AppExceptionX on AppException {
  af.AppFailure toAppFailure() {
    return map(
      network: (n) => af.AppFailure.general(n.statusCode.toStatusMessage),
      parsingData: (p) => const af.AppFailure.parsingData(),
      validation: (v) =>
          af.AppFailure.validation(v.message, v.errors.toErrorMap()),
    );
  }
}

extension AppFailureX on af.AppFailure {
  String getMessage() {
    return map(
      general: (g) => g.message,
      validation: (v) => v.message,
      parsingData: (p) => p.message,
    );
  }
}
