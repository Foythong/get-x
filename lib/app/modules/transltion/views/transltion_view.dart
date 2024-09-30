import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transltion_controller.dart';

class TransltionView extends GetView<TransltionController> {
  const TransltionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransltionView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'greeting'.tr,
            style: TextStyle(fontSize: 20),
          ),
          Text(
            'greeting2'.tr,
            style: TextStyle(fontSize: 20),
          ),
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('th', 'TH'));
              },
              child: Text('ไทย')),
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(Locale('en', 'US'));
              },
              child: Text('อังกฤษ')),
        ],
      ),
    );
  }
}
