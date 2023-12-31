import 'package:base_flutter_tci/presentation/_core/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            "Hi, ${authController.user?.personalData.name}",
            style: Get.textTheme.titleLarge,
          ),
        ),
      ),
      body: Center(
        child: FilledButton(
          onPressed: (){
            Get.defaultDialog(
              title: "Confirmation",
              content: const Text("Are you sure want to logout?"),
              onConfirm: authController.logout,
              onCancel: () {},
              radius: 10,
            );
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
