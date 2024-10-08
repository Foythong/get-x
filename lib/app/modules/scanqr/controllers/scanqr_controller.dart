import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanqrController extends GetxController {
  //TODO: Implement ScanqrController

  RxBool isScanCompletd = false.obs;
  RxBool isFlashOn = false.obs;
  RxBool isFrontCamera = false.obs;
  Rx<MobileScannerController> mobilecontroller = MobileScannerController().obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void closeScreen() {
    isScanCompletd.value = false;
  }

  void isFlash() {
    isFlashOn.value = !isFlashOn.value;
  }

  void isCamera() {
    isFrontCamera.value = !isFrontCamera.value;
  }
}
