import 'package:formz/formz.dart';
import 'package:get/get.dart';

class UsernameInput extends FormzInput<String, String> {
  const UsernameInput.pure() : super.pure('');

  const UsernameInput.dirty(String value) : super.dirty(value);

  @override
  String? validator(String value) {
    if(value.isEmpty){
      return 'empty_validation'.trParams({'field':'Username'});
    }
    return null;
  }
}
