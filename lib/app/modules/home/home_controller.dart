import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/app/data/model/movie.dart';
import 'package:flutter_architecture/app/data/repository/local/local_auth_repository.dart';
import 'package:flutter_architecture/app/data/repository/remote/movies_repository.dart';
import 'package:flutter_architecture/app/routes/app_routes.dart';
import 'package:flutter_architecture/app/utils/failure.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final LocalAuthRepository _localAuthRepository =
      Get.find<LocalAuthRepository>();

  final MoviesRepository _moviesRepository = Get.find<MoviesRepository>();

  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  Future<void> logout() async {
    await _localAuthRepository.clearSession();
    Get.offNamedUntil(AppRoutes.LOGIN, (_) => false);
  }

  @override
  void onReady() {
    super.onReady();
    _load();
  }

  Future<void> _load() async {
    Either<Failure, List<Movie>> _either =
        await _moviesRepository.getTopMovies();
    _either.fold(
      (failure) => null,
      (movies) => _movies = movies,
    );
    print('movies => ${_movies.length}');
    update();
  }
}
