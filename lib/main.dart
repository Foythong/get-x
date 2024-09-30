import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_tutorial/app/binding/app_binding.dart';
import 'package:getx_tutorial/app/translations/translation.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      translations: Languages(),
    ),
  );
}
