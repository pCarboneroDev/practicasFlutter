import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';


class BtnLocation extends StatelessWidget {
  const BtnLocation({super.key});

  @override
  Widget build(BuildContext context) {

    final locationBLoc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        maxRadius: 25,
        backgroundColor: Colors.white,

        child: IconButton(
          onPressed: () {
            final userLocation = locationBLoc.state.lastKnownLocation;

            final snack = SnackBar(content: Text('Hola mundo'));
            ScaffoldMessenger.of(context).showSnackBar(snack);

            return;

            if(userLocation == null) return;
            

            mapBloc.moveCamera(userLocation);
          }, 
          icon: Icon(Icons.my_location_outlined, color: Colors.black,)
        ),
      ),
    );
  }
}