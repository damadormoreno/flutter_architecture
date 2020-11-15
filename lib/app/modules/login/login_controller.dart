import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/data/model/request_token.dart';
import 'package:flutter_architecture/app/data/repository/local/local_auth_repository.dart';
import 'package:flutter_architecture/app/data/repository/remote/authentication_repository.dart';
import 'package:flutter_architecture/app/routes/app_routes.dart';
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
    try {
      final RequestToken requestToken = await _repository.newRequestToken();
      print("requestToken: ${requestToken.requestToken}");
      final authRequestToken = await _repository.authWithLogin(
        username: _username,
        password: _password,
        token: requestToken.requestToken,
      );
      await _localRepository.setSession(authRequestToken);
      Get.offNamed(AppRoutes.HOME);
    } catch (e) {
      String message = "";
      if (e is DioError) {
        if (e.response != null) {
          message = e.response.statusMessage;
        } else {
          message = e.message;
        }
      }
      Get.dialog(
        AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: [
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      );
      print(e);
    }
  }
}
