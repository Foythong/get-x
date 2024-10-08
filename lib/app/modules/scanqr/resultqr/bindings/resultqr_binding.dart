import 'package:get/get.dart';

import '../controllers/resultqr_controller.dart';

class ResultqrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultqrController>(
      () => ResultqrController(),
    );
  }
}
