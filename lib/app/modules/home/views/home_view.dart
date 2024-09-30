import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_tutorial/app/controllers/app_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() => ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(controller.products[index].title ?? ''),
            );
          })),
    );
  }
}
