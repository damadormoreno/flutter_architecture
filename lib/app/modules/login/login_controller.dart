import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/app/data/model/request_guest_token.dart';
import 'package:flutter_architecture/app/data/model/request_token.dart';
import 'package:flutter_architecture/app/data/repository/local/local_auth_repository.dart';
import 'package:flutter_architecture/app/data/repository/remote/authentication_repository.dart';
import 'package:flutter_architecture/app/modules/login/local_widgets/error_dialog.dart';
import 'package:flutter_architecture/app/routes/app_routes.dart';
import 'package:flutter_architecture/app/utils/failure.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthenticationRepository _repository =
      Get.find<AuthenticationRepository>();
  final LocalAuthRepository _localRepository = Get.find<LocalAuthRepository>();
  String _username = '', _password = '';

  void onUserNameChanged(String text) {
    _username = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<void> submit() async {
    final either = await _repository.newRequestToken();
    either.fold(
      (failure) => _showErrorDialog(failure.message),
      (requestToken) => authWithToken(requestToken),
    );
  }

  Future<void> authWithToken(RequestToken requestToken) async {
    final either = await _repository.authWithLogin(
      username: _username,
      password: _password,
      token: requestToken.requestToken,
    );

    either.fold(
      (failure) => _showErrorDialog(failure.message),
      (requestToken) async {
        await _localRepository.setSession(requestToken);
        Get.offNamed(AppRoutes.HOME);
      },
    );
  }

  Future<void> guestSession() async {
    Either<Failure, RequestGuestToken> _either =
        await _repository.newGuestToken();
    _either.fold(
      (failure) => _showErrorDialog(failure.message),
      (token) => Get.offNamed(AppRoutes.HOME),
    );
  }

  _showErrorDialog(String message) {
    Get.dialog(ErrorDialog(
      title: "ERROR",
      message: message,
      function: () => Get.back(),
    ));
  }
}
