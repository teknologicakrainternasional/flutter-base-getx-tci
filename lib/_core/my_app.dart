import 'package:alice_get_connect/alice_get_connect.dart';
import 'package:base_flutter_tci/_core/constants/app_constant.dart';
import 'package:base_flutter_tci/_core/constants/app_page.dart';
import 'package:base_flutter_tci/_core/initial_binding.dart';
import 'package:base_flutter_tci/_core/translations/_app_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AliceGetConnect alice;

  @override
  void initState() {
    //INIT ALICE
    alice = Get.put(
      AliceGetConnect(
        timeout: const Duration(
          milliseconds: AppConstant.kConnectionTimeout,
        ),
      ),
      permanent: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        navigatorKey: alice.getNavigatorKey(),
        title: 'Base Flutter TCI',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialBinding: InitialBinding(),
        getPages: AppPage.pages,
        translations: AppTranslations(),
        locale: Get.deviceLocale,
      ),
    );
  }
}
