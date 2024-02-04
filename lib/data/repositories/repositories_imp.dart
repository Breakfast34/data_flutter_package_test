import 'package:dartz/dartz.dart';
import 'package:flutter_package_2/core/failure.dart';
import 'package:flutter_package_2/data_flutter_for_test.dart';


class RepositoriesImpl implements Repositories {
  final RemoteDataSource remoteDataSource;

  RepositoriesImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Department>>> departments() async {
    try {
      final result = await remoteDataSource.departments();
      return Future.value(Right(result));
    } on Failure catch (e) {
      return Future.value(
          Left(ServerFailure('server failure is: ${e.message}')));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> products(
      String? departmentId) async {
    try {
      final result = await remoteDataSource.products(departmentId);
      return Future.value(Right(result));
    } on Failure catch (e) {
      return Future.value(
          Left(ServerFailure('server failure is: ${e.message}')));
    }
  }
}
