import 'package:base_flutter_tci/_core/constants/app_constant.dart';

enum Flavor { dev, prod }

class AppFlavor {
  final Flavor flavor;
  final String baseUrl;
  final String appName;
  static late AppFlavor _instance;
  static bool initialize = false;

  factory AppFlavor({
    required flavor,
    required baseUrl,
    appName = AppConstant.kAppName,
  }) {
    initialize = true;
    _instance = AppFlavor._initialize(flavor, baseUrl, appName);
    return _instance;
  }

  AppFlavor._initialize(this.flavor, this.baseUrl, this.appName);

  static AppFlavor get instance {
    return _instance;
  }
}
