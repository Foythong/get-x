import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_tutorial/app/routes/app_pages.dart';
import 'package:getx_tutorial/app/services/auth_service.dart';

import '../controllers/auth_error_controller.dart';

class AuthErrorView extends GetView<AuthErrorController> {
  const AuthErrorView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('AuthErrorView'),
        centerTitle: true,
      ),
      body: ElevatedButton(
        onPressed: () => Get.toNamed(Routes.LOGIN),
        child: Text('Login'),
      ),
    );
  }
}
