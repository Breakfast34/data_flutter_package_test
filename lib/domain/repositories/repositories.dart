import 'package:dartz/dartz.dart';
import 'package:flutter_package_2/core/failure.dart';
import 'package:flutter_package_2/data_flutter_for_test.dart';


abstract class Repositories {
  Future<Either<Failure, List<Department>>> departments();
  Future<Either<Failure, List<Product>>> products(String? departmentId);
}
