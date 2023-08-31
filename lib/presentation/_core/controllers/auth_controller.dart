import 'package:base_flutter_tci/_core/constants/app_page.dart';
import 'package:base_flutter_tci/domain/auth/entities/user.dart';
import 'package:base_flutter_tci/domain/auth/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthController(this._authRepository);

  final AuthRepository _authRepository;
  final _isAuthenticated = false.obs;
  final _user = Rx<User?>(null);

  bool get isAuthenticated => _isAuthenticated.value;

  User? get user => _user.value;

  logout() => _authRepository.logOut();

  @override
  void onInit() {
    _authRepository.streamUser().listen((user) {
      _isAuthenticated.value = user != null;
      _user.value = user;
      if (user == null) {
        Get.offAllNamed(AppPage.loginScreen);
      } else {
        Get.offAllNamed(AppPage.homeScreen);
      }
    });
    super.onInit();
  }
}
