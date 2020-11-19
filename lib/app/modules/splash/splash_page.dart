import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/modules/splash/splash_controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Lottie.asset('assets/splash.json'),
        ),
      ),
    );
  }
}
