import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller:
                    controller.scrollController, // กำหนด ScrollController
                itemCount: controller.isLoading.value
                    ? controller.products.length +
                        1 // ถ้ากำลังโหลด เพิ่ม 1 สำหรับ Loading
                    : controller
                        .products.length, // ถ้าไม่โหลด แสดงแค่รายการผลิตภัณฑ์
                itemBuilder: (_, index) {
                  // ตรวจสอบว่าถึงรายการสุดท้ายของผลิตภัณฑ์หรือยัง
                  if (index == controller.products.length) {
                    // ถ้ากำลังโหลดข้อมูลเพิ่มเติมให้แสดง Loading indicator
                    if (controller.isLoading.value) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else {
                      // ถ้าไม่กำลังโหลด ไม่ต้องแสดงอะไรที่ตำแหน่งนี้
                      return const SizedBox.shrink();
                    }
                  }

                  // แสดงรายการผลิตภัณฑ์
                  return ListTile(
                    title: Text(controller.products[index].title ?? ''),
                  );
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
