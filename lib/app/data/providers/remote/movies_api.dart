import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/app/data/model/movie.dart';
import 'package:flutter_architecture/app/utils/constants.dart';
import 'package:flutter_architecture/app/utils/failure.dart';
import 'package:get/get.dart';

class MoviesAPI {
  final Dio _dio = Get.find<Dio>();

  Future<Either<Failure, List<Movie>>> getTopMovies() async {
    try {
      final response = await _dio.get(
        '/movie/top_rated',
        queryParameters: {
          "api_key": Constants.THE_MOVIEDB_API_KEY,
          "language": "es",
        },
      );

      if (response.statusCode == 200) {
        return Right((response.data['results'] as List)
            .map((e) => Movie.fromJson(e))
            .toList());
      } else {
        return Left(Failure(response.statusCode, response.statusMessage));
      }
    } catch (e) {
      if (e is DioError) {
        return Left(Failure(e.response.statusCode, e.response.statusMessage));
      }
      return Left(Failure(e.hashCode, e.toString()));
    }
  }
}
