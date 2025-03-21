import 'package:flutter/material.dart';
import 'package:practicas_flutter/providers/movies_provider.dart';
import 'package:practicas_flutter/search/search_delegate.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final movieProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        actions: [
          IconButton(
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
            icon: Icon(Icons.search_outlined)
          )
        ],
      ),
        body: SingleChildScrollView(
          child: Column(
          children: [
            CardSwiper(movies: movieProvider.onDisplayMovies,),

            MovieSlider(
              movies: movieProvider.popularMovies, // pelis
              title: 'Populares', // opcional
              onNextPage: () => movieProvider.getPopularMovies()
            ),

            MovieSlider(
              movies: movieProvider.popularMovies, // pelis
              onNextPage: () => movieProvider.getPopularMovies()
            ),
          ],
        ),
        )
    );
  }
}