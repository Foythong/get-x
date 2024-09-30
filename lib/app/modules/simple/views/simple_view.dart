import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/simple_controller.dart';

class SimpleView extends StatelessWidget {
  const SimpleView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SimpleController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleView'),
        centerTitle: true,
      ),
      body: GetBuilder<SimpleController>(
        builder: (controller) {
          return Column(
            children: [
              Center(
                child: Text(
                  controller.count.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ElevatedButton(
                onPressed: () => controller.increment(),
                child: Text('กด'),
              )
            ],
          );
        },
      ),
    );
  }
}
