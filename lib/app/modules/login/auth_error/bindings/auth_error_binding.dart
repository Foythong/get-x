import 'package:get/get.dart';

import '../controllers/auth_error_controller.dart';

class AuthErrorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthErrorController>(
      () => AuthErrorController(),
    );
  }
}
