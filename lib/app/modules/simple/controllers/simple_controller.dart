import 'package:get/get.dart';

class SimpleController extends GetxController {
  //TODO: Implement SimpleController

  var count = 0;

  void increment() {
    count++;
    update();
  }
}
