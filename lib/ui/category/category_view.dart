
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/app/app_colors.dart';
import 'package:test_app/model/category_model.dart';
import 'package:test_app/ui/category/category_controller.dart';

class CategoryView extends StatelessWidget {
  final CategoryController _categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.colorBlack,
        title: Text(
          'ESP TILES',
          style: TextStyle(fontSize: 16, color: AppColors.colorWhite),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt, color: AppColors.colorWhite),
            onPressed: () {
              // Implement your action here
            },
          ),
          IconButton(
            icon: Icon(Icons.search, color: AppColors.colorWhite),
            onPressed: () {
              // Implement your action here
            },
          ),
        ],
      ),
      body: GetBuilder<CategoryController>(
        builder: (controller) {
          return NotificationListener<ScrollNotification>(
            onNotification: (scrollInfo) {
              if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent) {
                // Reached the bottom, load more data
                _categoryController.loadMore();
              } else if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.minScrollExtent) {
                // Reached the top, load previous data
                _categoryController.loadPrevious();
              }
              return false;
            },
            child: Obx(
                  () => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : _buildCategoryTabs(controller),
            ),
          );
        },
      ),
    );
  }
///Tab Bar View
  Widget _buildCategoryTabs(CategoryController controller) {
    return DefaultTabController(
      length: controller.categories.length,
      child: Column(
        children: [
          Container(
            color: AppColors.colorBlack,
            constraints: BoxConstraints.expand(height: 50),
            child: TabBar(
              isScrollable: true,
              labelColor: AppColors.colorWhite,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              indicatorColor: Colors.transparent,
              tabs: controller.categories
                  .map((category) => Tab(
                text: category.name,
              ))
                  .toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: controller.categories
                  .map((category) => _buildSubCategoryList(controller, category))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

///subCategory View
  Widget _buildSubCategoryList(CategoryController controller, Category category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: category.subCategories?.length ?? 0,
            itemBuilder: (context, index) {
              var subCategory = category.subCategories?[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      subCategory?.name ?? '',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 240, // Adjust height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: subCategory?.products?.length ?? 0,
                      itemBuilder: (context, index) {
                        var product = subCategory?.products?[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              product?.imageName.isNotEmpty == true
                                  ? ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  product?.imageName ?? "",
                                  width: 180,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              )
                                  : SizedBox(),
                              SizedBox(height: 8),
                              Container(
                                width: 180,
                                child: Text(
                                  product?.name ?? '',
                                  maxLines: 2, // Adjust as needed
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        // Load more button
        if (controller.categories.last == category &&
            !controller.isLoading.value)
          TextButton(
            onPressed: () => controller.loadMore(),
            child: Text(
              'Load More',
              style: TextStyle(color: AppColors.colorBlack),
            ),
          ),
      ],
    );
  }
}
