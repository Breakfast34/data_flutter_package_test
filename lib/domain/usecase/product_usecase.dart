import 'package:dartz/dartz.dart';
import 'package:flutter_package_2/core/failure.dart';
import 'package:flutter_package_2/data_flutter_for_test.dart';

class ProductUsecase {
  final Repositories repositories;

  ProductUsecase({required this.repositories});
  Future<Either<Failure, List<Product>>> execute(String? departmentId) async {
    try {
      final result = await repositories.products(departmentId);
      return Future.value(result);
    } on Failure catch (e) {
      return Future.value(
          Left(ServerFailure('server failure is: ${e.message}')));
    }
  }
}
