import 'package:get_it/get_it.dart';
import 'package:movieapp/core/data/services/dio_service_impl.dart';
import 'package:movieapp/core/domain/services/http_services.dart';
import 'package:movieapp/features/movie/data/datasource/get_movies_datasource.dart';
import 'package:movieapp/features/movie/data/datasource/local/get_movies_local_data_source_decorator_imp.dart';
import 'package:movieapp/features/movie/data/datasource/remote/get_movies_remote_datasource.dart';
import 'package:movieapp/features/movie/data/repositories/get_movies_repository_imp.dart';
import 'package:movieapp/features/movie/domain/repositories/get_movies_repository.dart';
import 'package:movieapp/features/movie/domain/usecases/get_movies_usecase.dart';
import 'package:movieapp/features/movie/domain/usecases/get_movies_usecase_imp.dart';
import 'package:movieapp/features/movie/presentation/controllers/movie_controller.dart';

class Inject {
  static inicialize() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<HttpService>(() => DioHttpServiceImp());

    getIt.registerLazySingleton<GetMoviesDataSource>(
      () => GetMoviesLocalDataSourceDecoratorImp(
        GetMoviesRemoteDataSourceImp(getIt()),
      ),
    );
    getIt.registerLazySingleton<GetMoviesRepository>(
      () => GetMoviesRepositoryImp(getIt()),
    );

    getIt.registerLazySingleton<GetMoviesUseCase>(
      () => GetMoviesUseCaseImp(getIt()),
    );

    getIt.registerLazySingleton(
      () => MovieController(getIt()),
    );
  }
}
