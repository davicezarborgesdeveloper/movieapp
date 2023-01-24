import 'package:flutter/material.dart';
import 'package:movieapp/core/utils/api.utils.dart';
import 'package:movieapp/features/movie/domain/entities/movie_details_entity.dart';

class DetailsPage extends StatelessWidget {
  final MovieDetailsEntity movie;
  const DetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    API.REQUEST_IMAGE(movie.posterPath),
                    loadingBuilder: (_, child, progress) => progress == null
                        ? child
                        : CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                movie.overview,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.title),
                  Text(movie.originalTitle),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.new_releases),
                  Text(movie.releaseDate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
