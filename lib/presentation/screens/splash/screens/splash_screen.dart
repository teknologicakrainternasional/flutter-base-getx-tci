import 'package:base_flutter_tci/presentation/screens/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<SplashController>();
    return Scaffold(
      body: Center(
        child: Obx((){
          if(ctrl.isLoading){
            return const CircularProgressIndicator();
          }
          if(!ctrl.isAuthenticated){
            return ElevatedButton(onPressed: ctrl.login, child: const Text("Login"));
          }else{
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(ctrl.message),
                const SizedBox(height: 20),
                FilledButton(onPressed: ctrl.logout, child: const Text("Logout")),
              ],
            );
          }
        }),
      ),
    );
  }
}
