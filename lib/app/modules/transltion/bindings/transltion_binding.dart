import 'package:get/get.dart';

import '../controllers/transltion_controller.dart';

class TransltionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransltionController>(
      () => TransltionController(),
    );
  }
}
