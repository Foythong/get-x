import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_tutorial/app/routes/app_pages.dart';

import '../controllers/clock_controller.dart';

class ClockView extends GetView<ClockController> {
  const ClockView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClockView'),
        centerTitle: true,
      ),
      body: Obx(
        () => Center(
          child: Column(
            children: [
              Text(
                controller.currentTime.value.toString(),
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.LOGIN),
                child: Text('Login'),
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.TRANSLTION),
                child: Text('translation'),
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.SCANQR),
                child: Text('scanqr'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
