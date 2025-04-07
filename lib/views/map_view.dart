import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:practicas_flutter/blocs/map/map_bloc.dart';
import 'package:practicas_flutter/themes/gta.dart';

class MapView extends StatelessWidget {
  final LatLng initialLocation;
  final Set<Polyline> polylines;

  const MapView({super.key, required this.initialLocation, required this.polylines});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);

    final CameraPosition initalCamPos = CameraPosition(
      bearing: 192.8334901395799,
      target: initialLocation,
      zoom: 15
    );
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,

      child: Listener(
        onPointerMove: (event) => mapBloc.add(OnStopFollowingUserEvent()),

        child: GoogleMap(
          style: jsonEncode(gtaMapTheme),
          initialCameraPosition: initalCamPos,
          compassEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          polylines: polylines,
          onMapCreated: (controller) => mapBloc.add(OnMapInitializedEvent(controller)),
        
        
        
          // TODO: Markers

          // TODO: cuando se mueve el mapa
        ),
      )
    );
  }
}