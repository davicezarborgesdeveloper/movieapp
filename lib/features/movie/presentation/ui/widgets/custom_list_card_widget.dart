import 'package:flutter/material.dart';
import 'package:movieapp/core/utils/api.utils.dart';
import 'package:movieapp/features/movie/domain/entities/movie_details_entity.dart';
import 'package:movieapp/features/movie/presentation/ui/pages/details_page.dart';

class CustomListCardWidget extends StatelessWidget {
  final MovieDetailsEntity movie;
  const CustomListCardWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsPage(movie: movie),
                fullscreenDialog: true),
          );
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: movie.id,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  child: Image.network(
                    API.REQUEST_IMAGE(movie.posterPath),
                    loadingBuilder: (_, child, progress) {
                      return progress == null
                          ? child
                          : CircularProgressIndicator.adaptive();
                    },
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headline6,
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(height: 10),
                    Text('Popularidade: ${movie.popularity}'),
                    const SizedBox(height: 10),
                    Text('Votos: ${movie.voteAverage}'),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
