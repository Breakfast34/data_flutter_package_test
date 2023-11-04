import 'package:dartz/dartz.dart';
import 'package:flutter_package_2/core/failure.dart';
import 'package:flutter_package_2/data/models/remote/data_user.dart';

abstract class Repositories {
  Future<Either<Failure, RemoteDataUsers>> dataUsers();
}
