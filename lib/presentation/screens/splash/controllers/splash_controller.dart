import 'package:base_flutter_tci/_core/app_extensions.dart';
import 'package:base_flutter_tci/domain/auth/repositories/auth_repository.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController(this.authRepository);

  final AuthRepository authRepository;
  final _isLoading = false.obs;
  final _isAuthenticated = false.obs;
  final _message = ''.obs;

  bool get isLoading => _isLoading.value;

  bool get isAuthenticated => _isAuthenticated.value;

  String get message => _message.value;

  login() async {
    _isLoading.value = true;
    final result = await authRepository.logIn(
      username: "bennyqt",
      password: "12345678",
    );
    _isLoading.value = false;
    result.fold((failure) {
      Get.snackbar("Failure", failure.getMessage());
    }, (r) {});
  }

  logout() async {
    //_isLoading.value = true;
    await authRepository.logOut();
    //_isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    _isLoading.value = true;
    authRepository.streamUser().listen((user) {
      _isLoading.value = false;
      if (user == null) {
        _isAuthenticated.value = false;
        _message.value = '';
      } else {
        _isAuthenticated.value = true;
        _message.value = user.personalData.name;
      }
    });
  }
}
