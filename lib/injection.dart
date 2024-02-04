import 'package:flutter_package_2/domain/usecase/product_usecase.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/remote/remote_datasources.dart';
import 'data/repositories/repositories_imp.dart';
import 'domain/repositories/repositories.dart';
import 'domain/usecase/catalog_usecase.dart';

final GetIt getIt = GetIt.instance;
void getInjection() {
  getIt.registerLazySingleton<Repositories>(
    () => RepositoriesImpl(
      remoteDataSource: RemoteDataSourceImpl(),
    ),
  );
  getIt.registerLazySingleton<DepartmentUsecase>(
    () => DepartmentUsecase(
      repositories: getIt(),
    ),
  );

  getIt.registerLazySingleton<ProductUsecase>(
    () => ProductUsecase(
      repositories: getIt(),
    ),
  );
}
