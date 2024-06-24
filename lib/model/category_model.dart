// models/category.dart

class Category {
  int id;
  String name;
  int? isAuthorize;
  int? update080819;
  int? update130919;
  List<SubCategory>? subCategories;

  Category({
    required this.id,
    required this.name,
    this.isAuthorize,
    this.update080819,
    this.update130919,
    this.subCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['Id'],
      name: json['Name'],
      isAuthorize: json['IsAuthorize'],
      update080819: json['Update080819'],
      update130919: json['Update130919'],
      subCategories: json['SubCategories'] != null
          ? (json['SubCategories'] as List)
          .map((i) => SubCategory.fromJson(i))
          .toList()
          : null,
    );
  }
}

class SubCategory {
  int id;
  String name;
  List<Product>? products;

  SubCategory({
    required this.id,
    required this.name,
    this.products,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json['Id'],
      name: json['Name'],
      products: json['Product'] != null
          ? (json['Product'] as List).map((i) => Product.fromJson(i)).toList()
          : null,
    );
  }
}

class Product {
  String name;
  String priceCode;
  String imageName;
  int id;

  Product({
    required this.name,
    required this.priceCode,
    required this.imageName,
    required this.id,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['Name'],
      priceCode: json['PriceCode'],
      imageName: json['ImageName'],
      id: json['Id'],
    );
  }
}
