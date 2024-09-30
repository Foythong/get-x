import 'package:get/get.dart';
import 'package:getx_tutorial/app/controllers/app_controller.dart';
import 'package:getx_tutorial/app/data/providers/api_provider.dart';
import 'package:getx_tutorial/app/services/auth_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppController());

    Get.put(AuthService());

    Get.put(ApiProvider());
  }
}
