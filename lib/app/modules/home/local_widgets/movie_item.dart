import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/data/model/movie.dart';
import 'package:flutter_architecture/app/routes/app_routes.dart';
import 'package:flutter_architecture/app/utils/constants.dart';
import 'package:get/get.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
          "${Constants.THE_MOVIEDB_IMAGE_PATH}${movie.posterPath}"),
      title: Text(movie.title),
      subtitle: Text(movie.overview),
      onTap: () => Get.toNamed(AppRoutes.DETAIL, arguments: movie),
    );
  }
}
