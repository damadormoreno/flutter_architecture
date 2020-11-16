import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/modules/home/home_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        body: Center(
          child: Text("DETAIL"),
        ),
      ),
    );
  }
}
