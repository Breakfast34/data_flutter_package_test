// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, use_build_context_synchronously, avoid_print

import 'package:dio/dio.dart';

import 'package:flutter_package_2/data_flutter_for_test.dart';

abstract class RemoteDataSource {
  Future<List<Department>> departments();
  Future<List<Product>> products(String? departmentId);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  RemoteDataSourceImpl();

  @override
  Future<List<Department>> departments() async {
    String departmentsApiUrl =
        'https://659f86b15023b02bfe89c737.mockapi.io/api/v1/departments';
    final Response departmentsResponse = await Dio().get(departmentsApiUrl);

    if (departmentsResponse.statusCode == 200) {
      final List<dynamic> departmentsData = await departmentsResponse.data;
      final List<Department> departments =
          departmentsData.map((item) => Department.fromJson(item)).toList();
      return departments;
    } else {
      throw Exception('Failed to load departments');
    }
  }

  @override
  Future<List<Product>> products(String? departmentId) async {
    final String productsApiUrl =
        'https://659f86b15023b02bfe89c737.mockapi.io/api/v1/departments/${departmentId}/products';
    final Response productsResponse = await Dio().get(productsApiUrl);

    if (productsResponse.statusCode == 200) {
      final List<dynamic> productsData = await productsResponse.data;
      final List<Product> products =
          productsData.map((item) => Product.fromJson(item)).toList();
      return products;
    } else {
      throw Exception('Failed to load products for department $departmentId');
    }
  }
}
