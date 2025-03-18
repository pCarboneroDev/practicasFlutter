import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjetas'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric( horizontal: 20, vertical: 10),
        children: const [
          customCardType1(),
          SizedBox(height: 20,),
          CustomCardType2(imageUrl: 'https://static1.srcdn.com/wordpress/wp-content/uploads/2021/10/Elder-Scrolls-What-Was-Tamriel-Like-Before-The-Empire-ESO-settlement-in-the-sunset.jpg',
          description: 'Paisaje de Tamriel'),
          SizedBox(height: 20,),
          CustomCardType2(imageUrl: 'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?cs=srgb&dl=pexels-bri-schneiter-28802-346529.jpg&fm=jpg',
          description: 'Lago Bonito',),
          SizedBox(height: 20,),
          CustomCardType2(imageUrl: 'https://www.westcountrygalleries.co.uk/media/artwork/ART1040317-colourful%20landscape.jpg',
          description: 'Río como un arcoíris',),
          SizedBox(height: 20,),
          CustomCardType2(imageUrl: 'https://images.unsplash.com/photo-1500964757637-c85e8a162699?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bGFuZHNjYXBlJTIwb3JpZW50YXRpb258ZW58MHx8MHx8fDA%3D'),
        ],
      )
    );
  }
}