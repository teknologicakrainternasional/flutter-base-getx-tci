import 'package:base_flutter_tci/_core/translations/app_error_message.dart';
import 'package:base_flutter_tci/_core/translations/app_status_message.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    ...AppStatusMessage.translation,
    ...AppErrorMessage.translation,
  };
}
