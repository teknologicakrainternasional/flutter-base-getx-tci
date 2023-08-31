import 'package:base_flutter_tci/presentation/screens/home/home_binding.dart';
import 'package:base_flutter_tci/presentation/screens/home/screens/home_screen.dart';
import 'package:base_flutter_tci/presentation/screens/login/login_binding.dart';
import 'package:base_flutter_tci/presentation/screens/login/screens/login_screen.dart';
import 'package:base_flutter_tci/presentation/screens/splash/screens/splash_screen.dart';
import 'package:base_flutter_tci/presentation/screens/splash/splash_binding.dart';
import 'package:get/get.dart';

class AppPage {
  static const splashScreen = '/';
  static const loginScreen = '/login';
  static const homeScreen = '/home';

  static var pages = <GetPage>[
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: loginScreen,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
