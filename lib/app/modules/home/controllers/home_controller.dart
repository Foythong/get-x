import 'package:get/get.dart';
import 'package:getx_tutorial/app/data/models/api_model.dart';
import 'package:getx_tutorial/app/data/providers/api_provider.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  final products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProducts();
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
    var result = await Get.find<ApiProvider>().getApi();
    var data = result?.products ?? [];

    products.clear();
    products.addAll(data);
  }

  void increment() => count.value++;
}
