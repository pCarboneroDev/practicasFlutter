
import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/models.dart';
import 'package:practicas_flutter/providers/movies_provider.dart';
import 'package:provider/provider.dart';


class MovieSearchDelegate extends SearchDelegate{

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar series o películas';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '', 
        icon: Icon(Icons.clear)
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: Icon(Icons.arrow_back)
      );
  }


  Widget _EmptyContainer(){
    return Center(
        child: Icon(Icons.movie_creation_outlined, color: Colors.black38, size: 200,),
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('BuildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty){
      return _EmptyContainer();
    }

    final moviesProvier = Provider.of<MoviesProvider>(context, listen: false);
    moviesProvier.getSuggestionByQuery(query);

    return StreamBuilder(
      stream: moviesProvier.suggestionSream, 
      builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
        if(!snapshot.hasData){
          return _EmptyContainer();
        }

        final movies = snapshot.data!;

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => _MovieItem(movie: movies[index]),
        );
      },
    );
  }
}


class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {

    movie.heroId = 'search-${movie.id}';

    return Hero(
      tag: movie.heroId!,
      child: ListTile(
        leading: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'), 
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit: BoxFit.contain,
        ),
        title: Text(movie.title),
        subtitle: Text(movie.originalTitle),
        onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
      ),
    );
  }
}