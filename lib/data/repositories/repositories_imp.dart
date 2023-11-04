import 'package:dartz/dartz.dart';
import 'package:flutter_package_2/core/failure.dart';
import 'package:flutter_package_2/data/datasources/remote/remote_datasources.dart';
import 'package:flutter_package_2/data/models/remote/data_user.dart';
import 'package:flutter_package_2/domain/repositories/repositories.dart';

class RepositoriesImpl implements Repositories {
  final RemoteDataSource remoteDataSource;

  RepositoriesImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, RemoteDataUsers>> dataUsers() async {
    try {
      final result = await remoteDataSource.dataUsers();
      return Future.value(Right(result));
    } on Failure catch (e) {
      return Future.value(
          Left(ServerFailure('server failure is: ${e.message}')));
    }
  }
}
