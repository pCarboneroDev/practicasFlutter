import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';


class DetailsScreen extends StatelessWidget {

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
          scrollBehavior: CupertinoScrollBehavior(),
          slivers: [
            _CustomAppBar(movie: movie),
            SliverList(
              delegate: SliverChildListDelegate([
                _PosterAndTitle(movie: movie,),
                _OverView(movie: movie),
                CastingCards(movieId: movie.id)
              ]
              )
            )
          ],
        )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar({required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          padding: EdgeInsets.only(bottom: 5),
          width: double.infinity,
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          child: Text(
            movie.title,
            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
            ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage(movie.fullbackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}



class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle({required this.movie});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                height: 150,
                //fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(movie.title, style: Theme.of(context).textTheme.headlineSmall, overflow: TextOverflow.ellipsis, maxLines: 2,),
              //if (movie.title != movie.originalTitle)
              Text(movie.originalTitle, style: Theme.of(context).textTheme.titleMedium, overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  Icon(Icons.star, size: 15, color: Colors.grey,),
                  SizedBox(width: 5,),
                  Text( movie.voteAverage.toString(), style: Theme.of(context).textTheme.bodySmall),

                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {

    final Movie movie;

  const _OverView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text(movie.overview,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleMedium,),
    );
  }
}


