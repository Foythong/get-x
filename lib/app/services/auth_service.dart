import 'package:get/get.dart';

class AuthService extends GetxService {
  final _authed = false.obs;
  bool get authed => _authed.value;

  Future<AuthService> init() async {
    return this;
  }

  void login() {
    _authed.value = true;
    Get.log('auth ${_authed.value}');
  }

  void logout() {
    _authed.value = false;
    Get.log('logout ${_authed.value}');
  }
}
