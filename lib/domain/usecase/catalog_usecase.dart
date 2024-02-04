import 'package:dartz/dartz.dart';
import 'package:flutter_package_2/core/failure.dart';
import 'package:flutter_package_2/data_flutter_for_test.dart';

class DepartmentUsecase {
  final Repositories repositories;

  DepartmentUsecase({required this.repositories});
  Future<Either<Failure, List<Department>>> execute() async {
    try {
      final result = await repositories.departments();
      return Future.value(result);
    } on Failure catch (e) {
      return Future.value(
          Left(ServerFailure('server failure is: ${e.message}')));
    }
  }
}
