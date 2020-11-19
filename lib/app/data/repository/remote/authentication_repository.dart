import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/app/data/model/request_guest_token.dart';
import 'package:flutter_architecture/app/data/model/request_token.dart';
import 'package:flutter_architecture/app/data/providers/remote/authentication_api.dart';
import 'package:flutter_architecture/app/utils/failure.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationRepository {
  final AuthenticationAPI _api = Get.find<AuthenticationAPI>();

  Future<Either<Failure, RequestToken>> newRequestToken() =>
      _api.newRequestToken();
  Future<Either<Failure, RequestGuestToken>> newGuestToken() =>
      _api.newGuestToken();
  Future<Either<Failure, RequestToken>> authWithLogin({
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
