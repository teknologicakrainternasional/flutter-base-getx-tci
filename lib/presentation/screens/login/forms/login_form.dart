import 'package:base_flutter_tci/presentation/screens/login/forms/password_input.dart';
import 'package:base_flutter_tci/presentation/screens/login/forms/username_input.dart';
import 'package:formz/formz.dart';

class LoginForm with FormzMixin {
  final UsernameInput username;
  final PasswordInput password;

  LoginForm({
    this.username = const UsernameInput.pure(),
    this.password = const PasswordInput.pure(),
  });

  @override
  List<FormzInput> get inputs => [username, password];

  LoginForm copyWith({
    UsernameInput? username,
    PasswordInput? password,
  }) {
    return LoginForm(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
