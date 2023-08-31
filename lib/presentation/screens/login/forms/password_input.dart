import 'package:base_flutter_tci/_core/constants/app_validation.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class PasswordInput extends FormzInput<String, String> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.length < 6) {
      return AppValidation.characterLength.trParams({
        'field': 'Password',
        'length': '6',
      });
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      AppValidation.containUppercase.trParams({
        'field': 'Password',
        'number': '1',
      });
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      AppValidation.containNumber.trParams({
        'field': 'Password',
        'number': '1',
      });
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      AppValidation.containSymbol.trParams({
        'field': 'Password',
        'number': '1',
      });
    }
    return null;
  }
}
