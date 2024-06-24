
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_app/model/category_model.dart';
class CategoryController extends GetxController {
  var categories = <Category>[].obs;
  var isLoading = true.obs;
  var pageIndex = 1.obs;
  var totalPage = 5;
  var scrollDirectionUp = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }
 /// fetch category data
  void fetchCategories() async {
    try {
      isLoading(true);
      final response = await http.post(
        Uri.parse('http://esptiles.imperoserver.in/api/API/Product/DashBoard'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'CategoryId': 0,
          'DeviceManufacturer': 'Google',
          'DeviceModel': 'Android SDK built for x86',
          'DeviceToken': ' ',
          'PageIndex': pageIndex.value,
        }),
      );
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var categoryList = (jsonData['Result']['Category'] as List)
            .map((i) => Category.fromJson(i))
            .toList();
        if (pageIndex.value == 1 || scrollDirectionUp.value) {
          categories.assignAll(categoryList);
        } else {
          categories.addAll(categoryList);
        }
      } else {
        // Handle error
      }
    } finally {
      isLoading(false);
    }
  }
  ///load more data with using pagination
  void loadMore() {
    if (pageIndex.value < totalPage) {
      pageIndex.value++;
      scrollDirectionUp.value = true;
      fetchCategories();
    }
  }
  ///load previous data with using pagination
  void loadPrevious() {
    if (pageIndex.value > 1) {
      pageIndex.value--;
      scrollDirectionUp.value = false;
      fetchCategories();
    }
  }
}
