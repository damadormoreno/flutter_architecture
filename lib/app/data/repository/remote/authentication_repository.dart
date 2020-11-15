import 'package:flutter_architecture/app/data/model/request_token.dart';
import 'package:flutter_architecture/app/data/providers/remote/authentication_api.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationRepository {
  final AuthenticationAPI _api = Get.find<AuthenticationAPI>();

  Future<RequestToken> newRequestToken() => _api.newRequestToken();
  Future<RequestToken> authWithLogin({
    @required String username,
    @required String password,
    @required String token,
  }) =>
      _api.validateWithLogin(
        username: username,
        password: password,
        token: token,
      );
}
