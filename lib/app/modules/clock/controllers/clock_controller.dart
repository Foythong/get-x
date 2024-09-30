import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/app/routes/app_pages.dart';

class ClockController extends GetxController {
  final currentTime = DateTime.now().obs;

  late Timer timer;

  @override
  void onInit() {
    super.onInit();

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      updateCurrentTime();
    });

    print('start timer');
  }

  @override
  void onReady() {
    super.onReady();
    print('start ready timer');
    Get.showSnackbar(
      GetSnackBar(
        backgroundColor: Colors.amber,
        title: 'Benz',
        message: 'xxxxxxxxxxxx',
        duration: Duration(seconds: 1),
      ),
    );
    // Timer.periodic(Duration(seconds: 2), (timer) {
    //   Get.toNamed(Routes.LOGIN);
    // });
  }

  @override
  void onClose() {
    super.onClose();

    timer.cancel();
    print('cancle timer');
  }

  void updateCurrentTime() {
    currentTime.value = DateTime.now();
  }
}
