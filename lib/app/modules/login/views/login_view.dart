import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_tutorial/app/routes/app_pages.dart';
import 'package:getx_tutorial/app/services/auth_service.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          Obx(() =>
              Text('username ${controller.user.value.username.toString()}')),
          ElevatedButton(
              onPressed: () => controller.updateUsername('peach'),
              child: Text('update username')),
          ElevatedButton(
              onPressed: () => Get.toNamed('/home'), child: Text('Go to Home')),
          ElevatedButton(
              onPressed: () => Get.find<AuthService>().login(),
              child: Text('Login')),
          ElevatedButton(
              onPressed: () => Get.find<AuthService>().logout(),
              child: Text('Logout')),
        ],
      )),
    );
  }
}
