import 'package:flutter/material.dart';
import 'package:practicas_flutter/models/models.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final Function onNextPage;


  const MovieSlider({super.key, required this.movies, this.title, required this.onNextPage});

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent -500){
       widget.onNextPage();
      }

    }); 
  }

  @override
  void dispose() {
    
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    if (widget.movies.isEmpty){
      return Center(
        child: Container(
        ),
      );
    }    

    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // si no hay titulo no se muestra
          if (widget.title != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.title!)
            ),

          SizedBox(height: 5,),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (context, index) => _MoviePoster(movie: widget.movies[index], heroId:'${widget.title}-${index}-${widget.movies[index].id}')
            ),
          )
        ],
      ),
    );
  }
}


class _MoviePoster extends StatelessWidget {

  final Movie movie;
  final String heroId;

  const _MoviePoster({required this.movie, required this.heroId});

  @override
  Widget build(BuildContext context) {

    movie.heroId = heroId;

    return Container(
      width: 130,
      height: 190,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage(movie.fullPosterImg),
                  width: 130,
                  height: 170,
                  fit: BoxFit.cover,
                        ),
              ),
            ),
          ),

        SizedBox(height: 5,),

        Text(
          movie.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
        ],
      ),
    );
  }
}