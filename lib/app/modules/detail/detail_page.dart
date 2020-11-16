import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/data/model/movie.dart';
import 'package:flutter_architecture/app/modules/home/home_controller.dart';
import 'package:flutter_architecture/app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = Get.arguments;
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'detail${movie.id}',
                  child: Image.network(
                    "${Constants.THE_MOVIEDB_IMAGE_PATH}${movie.posterPath}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
