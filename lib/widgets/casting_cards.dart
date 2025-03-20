import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _CastCard(),
      ),
    );
  }
}


class _CastCard extends StatelessWidget {

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
              image: NetworkImage('https://post-press.com/wp-content/uploads/250x300-250x300.gif'),
              height: 135,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 5,),

          Text('Actor.name ads as sf asf ', maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}