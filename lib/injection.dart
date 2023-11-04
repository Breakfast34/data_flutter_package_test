import 'package:get_it/get_it.dart';

import 'data/datasources/remote/remote_datasources.dart';
import 'data/repositories/repositories_imp.dart';
import 'domain/repositories/repositories.dart';
import 'domain/usecase/data_users_usecase.dart';

final GetIt getIt = GetIt.instance;
void getInjection() {
  getIt.registerLazySingleton<Repositories>(
    () => RepositoriesImpl(
      remoteDataSource: RemoteDataSourceImpl(),
    ),
  );
  getIt.registerLazySingleton<DataUserUsecase>(
    () => DataUserUsecase(
      repositories: getIt(),
    ),
  );
}
