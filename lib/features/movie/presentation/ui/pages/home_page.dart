import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/features/movie/domain/entities/movie_entity.dart';
import 'package:movieapp/features/movie/presentation/controllers/movie_controller.dart';
import 'package:movieapp/features/movie/presentation/ui/widgets/custom_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final MovieController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<MovieController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              ValueListenableBuilder<MovieEntity?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return Visibility(
                      visible: movies != null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Movies',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            onChanged: _controller.onChanged,
                          ),
                        ],
                      ),
                    );
                  }),
              ValueListenableBuilder<MovieEntity?>(
                valueListenable: _controller.movies,
                builder: (_, movies, __) {
                  return movies != null
                      ? ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: movies.listMovies.length,
                          itemBuilder: (_, idx) => CustomListCardWidget(
                              movie: movies.listMovies[idx]),
                          separatorBuilder: (_, __) => Divider(),
                        )
                      : Lottie.asset('assets/lottie.json');
                },
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
