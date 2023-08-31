import 'package:base_flutter_tci/_core/constants/app_validation.dart';
import 'package:formz/formz.dart';
import 'package:get/get.dart';

class PasswordInput extends FormzInput<String, List<String>> {
  const PasswordInput.pure() : super.pure('');

  const PasswordInput.dirty(String value) : super.dirty(value);

  @override
  List<String>? validator(String value) {
    final validationItem = <String>[];
    if (value.length < 6) {
      validationItem.add(AppValidation.characterLength.trParams({
        'field': 'Password',
        'length': '6',
      }));
    }
    /*if (!value.contains(RegExp(r'[A-Z]'))) {
      validationItem.add(AppValidation.containUppercase.trParams({
        'field': 'Password',
        'number': '1',
      }));
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      validationItem.add(AppValidation.containNumber.trParams({
        'field': 'Password',
        'number': '1',
      }));
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      validationItem.add(AppValidation.containSymbol.trParams({
        'field': 'Password',
        'number': '1',
      }));
    }*/
    return validationItem.isNotEmpty ? validationItem : null;
  }
}
