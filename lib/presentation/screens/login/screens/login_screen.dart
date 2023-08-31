import 'package:base_flutter_tci/presentation/screens/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = Get.find<LoginController>();
  final _isObscure = true.obs;

  bool get isObscure => _isObscure.value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Obx(() => TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                    hintText: 'Username',
                  ),
                  onChanged: _controller.onUsernameChanged,
                  validator: (_) {
                    return _controller.errors['username'];
                  },
                  readOnly: _controller.isLoading,
                )),
            const SizedBox(height: 20),
            Obx(() => TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: () => _isObscure.value = !isObscure,
                        icon: isObscure
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off)),
                  ),
                  onChanged: _controller.onPasswordChanged,
                  obscureText: isObscure,
                  validator: (_) {
                    return _controller.errors['password'];
                  },
                  readOnly: _controller.isLoading,
                )),
            const SizedBox(height: 40),
            Obx(() => SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    onPressed: (_controller.isLoading ||
                            _controller.loginForm.isNotValid ||
                            _controller.loginForm.isPure)
                        ? null
                        : _controller.onSubmitForm,
                    child: _controller.isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Login'),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
