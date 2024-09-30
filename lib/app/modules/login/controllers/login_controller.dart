import 'package:get/get.dart';
import 'package:getx_tutorial/app/data/models/user.model.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final user = User().obs;

  @override
  void onInit() {
    super.onInit();

    user.update((val) {
      val?.username = "benz";
      val?.email = "benz@example.com";
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateUsername(String newUsername) {
    user.update((val) => val?.username = newUsername);
  }
}
