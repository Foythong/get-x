import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_tutorial/app/routes/app_pages.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';

import '../controllers/scanqr_controller.dart';

class ScanqrView extends GetView<ScanqrController> {
  const ScanqrView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffafafa),
      appBar: AppBar(
        title: const Text('QR Scanner'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.flash_auto),
            color: controller.isFlashOn.value ? Colors.blue : Colors.black,
            onPressed: () {
              controller.isFlash;

              controller.mobilecontroller.value.toggleTorch();
            },
          ),
          IconButton(
            icon: Icon(Icons.camera),
            color: controller.isFrontCamera.value ? Colors.blue : Colors.black,
            onPressed: () {
              controller.isCamera;

              controller.mobilecontroller.value.switchCamera();
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Place thr QR code in the area",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Scanning will be started automatically",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Obx(() => MobileScanner(
                          controller: controller.mobilecontroller.value,
                          onDetect: (barcodes) {
                            if (!controller.isScanCompletd.value) {
                              String code = barcodes.toString();

                              print('code ');

                              controller.isScanCompletd.value = true;
                              Get.toNamed(
                                Routes.RESULTQR,
                                arguments: {
                                  'code': code,
                                  'closeScreen': controller.closeScreen,
                                },
                              );
                            }
                          },
                        )),
                    QRScannerOverlay(
                      // overlayColor: Color(0xfffafafa),
                      borderColor: Color.fromARGB(255, 86, 142, 225),
                    )
                  ],
                )),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Developed by Babba Devs",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
