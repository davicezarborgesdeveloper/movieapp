import 'package:dio/dio.dart';
import 'package:movieapp/core/domain/services/http_services.dart';

class DioHttpServiceImp implements HttpService {
  late Dio _dio;

  DioHttpServiceImp() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5NGEwMWNhNDNhZGMyYWExNmYzNzUwMWI2YzFlYzk5YSIsInN1YiI6IjYzOWNhY2IwZDJiMjA5MDBjOGE3NzY0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._xVEStvP-8mcd7Fy5psW9xwUP0AsfCwSnyKhUHEfXTw',
        },
      ),
    );
  }

  @override
  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
    );
  }
}
