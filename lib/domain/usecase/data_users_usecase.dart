import 'package:dartz/dartz.dart';
import 'package:flutter_package_2/core/failure.dart';
import 'package:flutter_package_2/data/models/remote/data_user.dart';
import 'package:flutter_package_2/domain/repositories/repositories.dart';

class DataUserUsecase {
  final Repositories repositories;

  DataUserUsecase({required this.repositories});
  Future<Either<Failure, RemoteDataUsers>> execute() async {
    try {
      final result = await repositories.dataUsers();
      return Future.value(result);
    } on Failure catch (e) {
      return Future.value(
          Left(ServerFailure('server failure is: ${e.message}')));
    }
  }
}
