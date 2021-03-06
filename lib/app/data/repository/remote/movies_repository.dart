import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/app/data/model/movie.dart';
import 'package:flutter_architecture/app/data/providers/remote/movies_api.dart';
import 'package:flutter_architecture/app/utils/failure.dart';
import 'package:get/get.dart';

class MoviesRepository {
  final MoviesAPI _moviesAPI = Get.find<MoviesAPI>();

  Future<Either<Failure, List<Movie>>> getTopMovies() =>
      _moviesAPI.getTopMovies();
}
