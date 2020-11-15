//import 'package:flutter_architecture/app/data/model/request_token.dart';
//import 'package:flutter_architecture/app/data/repository/authentication_repository.dart';
import 'package:flutter_architecture/app/data/model/request_token.dart';
import 'package:flutter_architecture/app/data/repository/local/local_auth_repository.dart';
import 'package:flutter_architecture/app/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final LocalAuthRepository _authRepository = Get.find<LocalAuthRepository>();

  @override
  void onReady() {
    _init();
  }

  _init() async {
    try {
      //await Future.delayed(Duration(seconds: 2));
      final RequestToken requestToken = await _authRepository.session;
      print(requestToken);
      Get.offNamed(
        requestToken != null ? AppRoutes.HOME : AppRoutes.LOGIN,
      );
    } catch (e) {
      print(e);
    }
  }
}
