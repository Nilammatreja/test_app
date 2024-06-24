import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/category/category_controller.dart';
import 'ui/category/category_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => CategoryView()),
      ],
      home: CategoryView(),
      initialBinding: BindingsBuilder(() {
        Get.put<CategoryController>(CategoryController());
      }),
    );
  }
}
