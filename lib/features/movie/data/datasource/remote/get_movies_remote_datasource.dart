import 'package:dartz/dartz.dart';
import 'package:movieapp/core/domain/services/http_services.dart';
import 'package:movieapp/core/utils/api.utils.dart';
import 'package:movieapp/features/movie/data/datasource/get_movies_datasource.dart';
import 'package:movieapp/features/movie/data/dtos/movie_dto.dart';
import 'package:movieapp/features/movie/domain/entities/movie_entity.dart';

class GetMoviesRemoteDataSourceImp implements GetMoviesDataSource {
  final HttpService _httpService;
  GetMoviesRemoteDataSourceImp(this._httpService);

  @override
  Future<Either<Exception, MovieEntity>> call() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      var result = await _httpService.get(API.REQUEST_MOVIE_LIST);
      return Right(MovieDto.fromJson(result.data));
    } catch (e) {
      return Left(Exception('Falha no datasource'));
    }
  }
}
