import 'package:dartz/dartz.dart';
import 'package:movieapp/features/movie/data/datasource/get_movies_datasource.dart';
import 'package:movieapp/features/movie/domain/entities/movie_entity.dart';

class GetMoviesDataSourceDecorator implements GetMoviesDataSource {
  final GetMoviesDataSource _getMoviesDataSource;
  GetMoviesDataSourceDecorator(this._getMoviesDataSource);

  @override
  Future<Either<Exception, MovieEntity>> call() => _getMoviesDataSource();
}
