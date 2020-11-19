import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_architecture/app/data/model/request_token.dart';
import 'package:flutter_architecture/app/utils/failure.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LocalAuth {
  static const KEY = "session";
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  Future<void> setSession(RequestToken requestToken) async {
    await _storage.write(key: KEY, value: jsonEncode(requestToken.toJson()));
  }

  Future<void> clearSession() async {
    await _storage.delete(key: KEY);
  }

  Future<Either<Failure, RequestToken>> getSession() async {
    final data = await _storage.read(key: KEY);
    if (data != null) {
      final RequestToken requestToken = RequestToken.fromJson(jsonDecode(data));
      if (DateTime.now()
          .isBefore(requestToken.expiresAt.add(Duration(hours: 1)))) {
        return Right(requestToken);
      }
      return Left(Failure(1001, "Expired token"));
    }
    return Left(Failure(1002, "No data"));
  }
}
