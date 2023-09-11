import 'package:base_flutter_tci/_core/app_extensions.dart';
import 'package:base_flutter_tci/domain/auth/repositories/auth_repository.dart';
import 'package:base_flutter_tci/presentation/screens/login/forms/login_form.dart';
import 'package:base_flutter_tci/presentation/screens/login/forms/password_input.dart';
import 'package:base_flutter_tci/presentation/screens/login/forms/username_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController(this._authRepository);

  final AuthRepository _authRepository;
  final _loginForm = LoginForm().obs;
  final _isLoading = false.obs;
  final errors = <String, String?>{}.obs;
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  LoginForm get loginForm => _loginForm.value;

  bool get isLoading => _isLoading.value;

  onUsernameChanged(String value) {
    errors.remove('username');
    final username = UsernameInput.dirty(value);
    _loginForm.value = loginForm.copyWith(username: username);
    if (loginForm.isNotValid) {
      errors['username'] = loginForm.username.displayError;
    }
  }

  onPasswordChanged(String value) {
    errors.remove('password');
    final password = PasswordInput.dirty(value);
    _loginForm.value = loginForm.copyWith(password: password);
    if (loginForm.isNotValid) {
      errors['password'] = loginForm.password.displayError;
    }
  }

  onSubmitForm() async {
    if (loginForm.isValid) {
      errors.clear();
      _isLoading.value = true;
      final result = await _authRepository.logIn(
        username: loginForm.username.value,
        password: loginForm.password.value,
      );
      _isLoading.value = false;
      result.fold((failure) {
        Get.showSnackbar(GetSnackBar(
          title: 'Warning',
          message: failure.getMessage(),
          duration: const Duration(seconds: 2),
        ));
      }, (_) => null);
    }
  }

  @override
  void onInit() {
    _loginForm.value = loginForm.copyWith(
      username: const UsernameInput.dirty('bennyqt'),
      password: const PasswordInput.dirty('12345678'),
    );
    usernameCtrl.text = loginForm.username.value;
    passwordCtrl.text = loginForm.password.value;
    super.onInit();
  }
}
