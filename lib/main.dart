import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/modules/splash/splash_binding.dart';
import 'package:flutter_architecture/app/modules/splash/splash_page.dart';
import 'package:flutter_architecture/app/routes/app_pages.dart';
import 'package:flutter_architecture/app/utils/dependency_injection.dart';
import 'package:get/get.dart';

void main() {
  DependencyInjection.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
