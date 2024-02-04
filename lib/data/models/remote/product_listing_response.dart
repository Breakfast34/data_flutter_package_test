import 'dart:convert';

import 'package:flutter_package_2/data_flutter_for_test.dart';


class ProductListingResponse {
  final List<Product> products;
  final List<Department> departments;

  ProductListingResponse({
    required this.products,
    required this.departments,
  });

  factory ProductListingResponse.fromRawJson(String str) =>
      ProductListingResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductListingResponse.fromJson(Map<String, dynamic> json) =>
      ProductListingResponse(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
        departments: List<Department>.from(
            json["departments"].map((x) => Department.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "departments": List<dynamic>.from(departments.map((x) => x.toJson())),
      };
}
