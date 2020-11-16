import 'package:dio/dio.dart';
import 'package:flutter_architecture/app/data/providers/local/local_auth.dart';
import 'package:flutter_architecture/app/data/providers/remote/authentication_api.dart';
import 'package:flutter_architecture/app/data/providers/remote/movies_api.dart';
import 'package:flutter_architecture/app/data/repository/local/local_auth_repository.dart';
import 'package:flutter_architecture/app/data/repository/remote/authentication_repository.dart';
import 'package:flutter_architecture/app/data/repository/remote/movies_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(),
        fenix: true);
    Get.lazyPut<LocalAuth>(() => LocalAuth(), fenix: true);
    Get.lazyPut<Dio>(
      () => Dio(
        BaseOptions(baseUrl: 'https://api.themoviedb.org/3'),
      ),
      fenix: true,
    );
    Get.lazyPut<AuthenticationAPI>(() => AuthenticationAPI(), fenix: true);
    Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepository(),
        fenix: true);
    Get.lazyPut<LocalAuthRepository>(() => LocalAuthRepository(), fenix: true);
    Get.lazyPut<MoviesAPI>(() => MoviesAPI(), fenix: true);
    Get.lazyPut<MoviesRepository>(() => MoviesRepository(), fenix: true);
  }
}
