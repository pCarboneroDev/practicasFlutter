import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';


class DetailsScreen extends StatelessWidget {

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
        body: CustomScrollView(
          scrollBehavior: CupertinoScrollBehavior(),
          slivers: [
            _CustomAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                _PosterAndTitle(),
                _OverView(),
                _OverView(),
                _OverView(),
                CastingCards()
              ]
              )
            )
          ],
        )
    );
  }
}

class _CustomAppBar extends StatelessWidget {

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
            'movie.title',
            style: TextStyle(fontSize: 16),
            ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_cw8H6KpFUOiEaZFJWxVSWr77Mylr-KnMAw&s'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}



class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://business.wholelifechallenge.com/wp-content/uploads/2016/11/200x300.png'),
              height: 150,
              //fit: BoxFit.cover,
            ),
          ),

          SizedBox(width: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title', style: Theme.of(context).textTheme.headlineSmall, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('movie.originalTitle', style: Theme.of(context).textTheme.titleMedium, overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  Icon(Icons.star, size: 15, color: Colors.grey,),
                  SizedBox(width: 5,),
                  Text('Movie.voteAverage', style: Theme.of(context).textTheme.bodySmall),

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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Text('Elit ad duis irure dolor duis deserunt culpa tempor fugiat laboris in exercitation. Magna dolor eu excepteur ipsum elit minim ullamco enim nisi incididunt deserunt consectetur laboris ea. Consequat elit aliqua in ipsum aliqua anim non commodo consectetur. Commodo aliqua aliquip esse sit ut. Voluptate incididunt Lorem incididunt culpa eu cillum et cupidatat exercitation eiusmod tempor. Sunt cupidatat sunt exercitation veniam adipisicing commodo eiusmod irure mollit culpa reprehenderit Lorem amet. Labore incididunt commodo id aliquip.',
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.titleMedium,),
    );
  }
}


