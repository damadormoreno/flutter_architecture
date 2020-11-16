import 'package:dio/dio.dart';
import 'package:flutter_architecture/app/data/model/movie.dart';
import 'package:flutter_architecture/app/utils/constants.dart';
import 'package:get/get.dart';

class MoviesAPI {
  final Dio _dio = Get.find<Dio>();

  Future<List<Movie>> getTopMovies() async {
    final Response response = await _dio.get(
      '/movie/top_rated',
      queryParameters: {
        "api_key": Constants.THE_MOVIEDB_API_KEY,
        "language": "es",
      },
    );

    return (response.data['results'] as List)
        .map((e) => Movie.fromJson(e))
        .toList();
  }
}
