import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/app/data/model/request_token.dart';
import 'package:flutter_architecture/app/data/providers/local/local_auth.dart';
import 'package:flutter_architecture/app/utils/failure.dart';
import 'package:get/get.dart';

class LocalAuthRepository {
  final LocalAuth _localAuth = Get.find<LocalAuth>();

  Future<void> setSession(RequestToken requestToken) =>
      _localAuth.setSession(requestToken);

  Future<void> clearSession() => _localAuth.clearSession();

  Future<Either<Failure, RequestToken>> get session => _localAuth.getSession();
}
