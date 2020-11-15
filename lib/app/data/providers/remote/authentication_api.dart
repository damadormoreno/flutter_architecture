import 'package:dio/dio.dart';
import 'package:meta/meta.dart' show required;
import 'package:flutter_architecture/app/data/model/request_token.dart';
import 'package:flutter_architecture/app/utils/constants.dart';
import 'package:get/get.dart';

class AuthenticationAPI {
  final Dio _dio = Get.find<Dio>();

  Future<RequestToken> newRequestToken() async {
    final Response response = await _dio.get(
      "/authentication/token/new",
      queryParameters: {
        "api_key": Constants.THE_MOVIEDB_API_KEY,
      },
    );
    return RequestToken.fromJson(response.data);
  }

  Future<RequestToken> validateWithLogin({
    @required String username,
    @required String password,
    @required String token,
  }) async {
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
/*       options: Options(
        headers: ,
        contentType: "application-json"
      ), */
    );
    return RequestToken.fromJson(response.data);
  }
}
