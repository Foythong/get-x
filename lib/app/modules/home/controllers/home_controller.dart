import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/app/data/models/api_model.dart';
import 'package:getx_tutorial/app/data/providers/api_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  final products = <Product>[].obs;

  var perPage = 20; // จำนวนผลิตภัณฑ์ที่จะโหลดต่อครั้ง
  var countPage =
      0; // ใช้ติดตามจำนวนหน้าที่โหลดแล้ว (เป็นตัวนับสำหรับตำแหน่งเริ่มต้นของรายการผลิตภัณฑ์ที่กำลังจะโหลด)
  final ScrollController scrollController =
      ScrollController(); // ควบคุมการเลื่อนของ ScrollView

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getProducts();

    scrollController.addListener(() {
      if (scrollController.offset >=
              scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        getProducts();
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getProducts() async {
    try {
      isLoading(true);

      var result = await Get.find<ApiProvider>().getApi();
      var data = result?.products ?? [];

      // ถ้า data.length น้อยกว่าจำนวนที่โหลดไปแล้ว ให้หยุดการทำงานทันที
      if (data.length <= countPage) {
        isLoading(false); // หยุดการโหลด
        return; // หยุดการทำงานของฟังก์ชัน
      }

      // โหลดผลิตภัณฑ์เพิ่มจากข้อมูลที่ได้มาและเพิ่มเข้าไปในรายการผลิตภัณฑ์ที่แสดงผล
      for (var i = countPage; i < countPage + perPage && i < data.length; i++) {
        products.add(data[i]); // เพิ่มผลิตภัณฑ์ที่โหลดเข้ามาในรายการผลิตภัณฑ์
      }

      // เพิ่มค่าตัวนับของหน้าที่โหลดแล้ว
      countPage += perPage;

      print('countPage ${countPage}');
    } catch (e) {
      // จัดการข้อผิดพลาดและแสดงข้อความหรือบันทึกลงใน console
      print('Error loading products: $e');
    } finally {
      // เมื่อโหลดข้อมูลเสร็จสิ้น ไม่ว่าจะสำเร็จหรือมีข้อผิดพลาด ตั้ง isLoading เป็น false
      isLoading(false);
    }
  }

  void increment() => count.value++;
}
