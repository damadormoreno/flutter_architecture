import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_architecture/app/data/model/request_guest_token.dart';
import 'package:flutter_architecture/app/utils/failure.dart';
import 'package:meta/meta.dart' show required;
import 'package:flutter_architecture/app/data/model/request_token.dart';
import 'package:flutter_architecture/app/utils/constants.dart';
import 'package:get/get.dart';

class AuthenticationAPI {
  final Dio _dio = Get.find<Dio>();

  Future<Either<Failure, RequestToken>> newRequestToken() async {
    try {
      final Response response = await _dio.get(
            "/authentication/token/new",
            queryParameters: {
              "api_key": Constants.THE_MOVIEDB_API_KEY,
            },
          );
      if (response.statusCode == 200) {
            return Right(RequestToken.fromJson(response.data));
          } else {
            return Left(Failure(response.statusCode, response.statusMessage));
          }
    } catch (e) {
      if (e is DioError) {
        return Left(Failure(e.response.statusCode, e.response.statusMessage));
      }
      return Left(Failure(e.hashCode, e.toString()));
    }
  }

  Future<Either<Failure, RequestGuestToken>> newGuestToken() async {
    try {
      final Response response = await _dio.get(
            "/authentication/guest_session/new",
            queryParameters: {
              "api_key": Constants.THE_MOVIEDB_API_KEY,
            },
          );
      if (response.statusCode == 200) {
            return Right(RequestGuestToken.fromJson(response.data));
          } else {
            return Left(Failure(response.statusCode,response.statusMessage));
          }
    } catch (e) {
      if (e is DioError) {
        return Left(Failure(e.response.statusCode, e.response.statusMessage));
      }
      return Left(Failure(e.hashCode, e.toString()));
    }
  }

  Future<Either<Failure, RequestToken>> validateWithLogin({
    @required String username,
    @required String password,
    @required String token,
  }) async {
    try {
      final Response response = await _dio.post(
            "/authentication/token/validate_with_login",
            queryParameters: {
              "api_key": Constants.THE_MOVIEDB_API_KEY,
            },
            data: {
              "username": username,
              "password": password,
              "request_token": token,
            },
          );
      if (response.statusCode == 200) {
            return Right(RequestToken.fromJson(response.data));
          } else {
            return Left(Failure(response.statusCode, response.statusMessage));
          }
    } catch (e) {
      if (e is DioError) {
        return Left(Failure(e.response.statusCode, e.response.statusMessage));
      }
      return Left(Failure(e.hashCode, e.toString()));
    }
  }
}
