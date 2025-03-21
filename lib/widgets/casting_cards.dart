import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/credits_response.dart';
import 'package:practicas_flutter/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {

  final int movieId;

  const CastingCards({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: moviesProvider.getMovieCast(movieId), 
      builder: (context, AsyncSnapshot<List<Cast>> snapshot) {

        if (!snapshot.hasData){
          return Container(
            height: 180,
            child: CircularProgressIndicator(),
          );
        }
  
        final List<Cast> cast = snapshot.data!; 

        if (cast.isEmpty){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
            height: 180,
            child: Text('No hay información de los actores.'),
          );
        }

        return Container(
          margin: EdgeInsets.only(bottom: 30),
          width: double.infinity,
          height: 180,
          child: ListView.builder(
            itemCount: cast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _CastCard(actor: cast[index],), // aquí
          ),
        );

      }
    );
  }
}


class _CastCard extends StatelessWidget {

  final Cast actor;

  const _CastCard({required this.actor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(actor.actorPicture),
              height: 135,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 5,),

          Text(actor.name, maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}