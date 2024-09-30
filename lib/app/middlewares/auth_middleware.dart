import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/app/routes/app_pages.dart';
import 'package:getx_tutorial/app/services/auth_service.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();
    return authService.authed
        ? null
        : const RouteSettings(name: Routes.AUTH_ERROR);
  }
}
