import 'package:base_flutter_tci/_core/translations/app_error_message.dart';
import 'package:base_flutter_tci/_core/translations/app_status_message.dart';
import 'package:base_flutter_tci/_core/translations/app_validation_message.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => _mergeTranslation([
    AppStatusMessage.translation,
    AppErrorMessage.translation,
    AppValidationMessage.translation,
  ]);

  Map<String, Map<String, String>> _mergeTranslation(
      List<Map<String, Map<String, String>>> translations,
      ) {
    Map<String, Map<String, String>> mergedTranslation = {};
    for (final translation in translations) {
      translation.forEach((key, value) {
        if (mergedTranslation.containsKey(key)) {
          mergedTranslation[key]!.addAll(value);
        } else {
          mergedTranslation[key] = Map.from(value);
        }
      });
    }
    return mergedTranslation;
  }
}
