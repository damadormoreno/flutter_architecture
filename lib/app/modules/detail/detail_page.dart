import 'dart:ui';

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
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: 'detail${movie.id}',
                  child: Image.network(
                    "${Constants.THE_MOVIEDB_IMAGE_PATH}${movie.backdropPath}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(height: 8),
                  Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(movie.overview),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Image.network(
                        "${Constants.THE_MOVIEDB_IMAGE_PATH}${movie.posterPath}"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
