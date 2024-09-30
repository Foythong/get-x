import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_tutorial/app/controllers/app_controller.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailView'),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            Center(
              child: Text(
                'Count ${Get.find<AppController>().count.value}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
                onPressed: Get.find<AppController>().increment,
                child: Text('add')),
            ElevatedButton(
                onPressed: () => Get.toNamed('/home/detail'),
                child: Text('Go to detail'))
          ],
        ),
      ),
    );
  }
}
