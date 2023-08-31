import 'package:base_flutter_tci/_core/constants/app_page.dart';
import 'package:base_flutter_tci/domain/auth/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthController(this._authRepository);

  final AuthRepository _authRepository;
  final _isAuthenticated = false.obs;

  bool get isAuthenticated => _isAuthenticated.value;

  @override
  void onInit() {
    _authRepository.streamUser().listen((user) {
      _isAuthenticated.value = user != null;
      if (user == null) {
        Get.offAllNamed(AppPage.loginScreen);
      } else {
        Get.offAllNamed(AppPage.homeScreen);
      }
    });
    super.onInit();
  }
}
