import 'package:flutter_architecture/app/data/model/movie.dart';
import 'package:flutter_architecture/app/data/repository/local/local_auth_repository.dart';
import 'package:flutter_architecture/app/data/repository/remote/movies_repository.dart';
import 'package:flutter_architecture/app/routes/app_routes.dart';
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
    try {
      _movies = await _moviesRepository.getTopMovies();
      print('movies => ${_movies.length}');
      update();
    } catch (e) {
      print(e);
    }
  }
}
