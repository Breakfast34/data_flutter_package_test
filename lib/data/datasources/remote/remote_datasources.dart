// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter_package_2/core/failure.dart';
import 'package:flutter_package_2/data/models/remote/data_user.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<RemoteDataUsers> dataUsers();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  RemoteDataSourceImpl();

  @override
  Future<RemoteDataUsers> dataUsers() async {
    try {
      final response =
          await http.get(Uri.parse('https://randomuser.me/api?results=10'));
      final RemoteDataUsers jsonList =
          RemoteDataUsers.fromJson(json.decode(response.body));
      return Future.value(jsonList);
    } on Failure catch (e) {
      throw ServerFailure('server failure is: ${e.message}');
    }
  }
}
