import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/app/data/model/request_token.dart';
import 'package:flutter_architecture/app/data/repository/local/local_auth_repository.dart';
import 'package:flutter_architecture/app/routes/app_routes.dart';
import 'package:flutter_architecture/app/utils/failure.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final LocalAuthRepository _authRepository = Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  _init() async {
    await Future.delayed(Duration(seconds: 2));
    Either<Failure, RequestToken> _either = await _authRepository.session;
    _either.fold(
      (failure) => Get.offNamed(AppRoutes.LOGIN),
      (requestToken) => Get.offNamed(AppRoutes.HOME),
    );
  }
}
