import 'package:flutter/material.dart';
import 'package:flutter_architecture/app/data/model/movie.dart';
import 'package:flutter_architecture/app/modules/home/home_controller.dart';
import 'package:flutter_architecture/app/modules/home/local_widgets/movie_item.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                _.logout();
              },
            )
          ],
        ),
        body: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
            itemCount: _.movies.length,
            itemBuilder: (contex, index) {
              final Movie movie = _.movies[index];
              return MovieItem(
                movie: movie,
              );
            },
          ),
        ),
      ),
    );
  }
}
