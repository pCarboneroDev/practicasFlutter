import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:practicas_flutter/blocs/blocs.dart';
import 'package:practicas_flutter/helpers/custom_image_marker.dart';
import 'package:practicas_flutter/helpers/widgets_to_marker.dart';
import 'package:practicas_flutter/models/models.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  final LocationBloc locationBloc;
  GoogleMapController? _mapController;
  LatLng? mapCenter;

  StreamSubscription<LocationState>? locationStateSub;

  MapBloc({required this.locationBloc}) : super(MapState()) {
    on<OnMapInitializedEvent>(_onInitMap);
    on<OnStartFollowingUserEvent>(_onStartFollowingUser);
    on<OnStopFollowingUserEvent>((event, emit)  => emit(state.copyWith(followUser: false)));
    on<UpdateUserPolylineEvent>(_onPolylineNewPoint);
    on<OnToggleUserRoute>((event, emit) => emit(state.copyWith(showMyRoute: !state.showMyRoute)));
    on<DisplayPolylinesEvent>((event, emit) => emit(state.copyWith(polylines: event.polylines, markers: event.markers)));

    locationStateSub = locationBloc.stream.listen((locationState) {

      if(locationState.lastKnownLocation != null){
        add(UpdateUserPolylineEvent(locationState.locationHistory));
      }

      if (!state.followUser) return;
      if(locationState.lastKnownLocation == null) return;
      moveCamera(locationState.lastKnownLocation!);
    });
  }

  void _onStartFollowingUser(OnStartFollowingUserEvent event, Emitter<MapState> emit){
    emit(state.copyWith(followUser: true));
    if(locationBloc.state.lastKnownLocation == null) return;
    moveCamera(locationBloc.state.lastKnownLocation!);
  }

  void _onInitMap(OnMapInitializedEvent event, Emitter<MapState> emit){
    _mapController = event.controller;

    emit(state.copyWith(isMapInitialized: true));
  }

  void _onPolylineNewPoint(UpdateUserPolylineEvent event, Emitter<MapState> emit){
    final myRoute = Polyline(polylineId: const PolylineId('myRoute'),
      color: Colors.deepPurpleAccent,
      width: 5,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      points: event.userLocations
    );

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['myRoute'] = myRoute;

    emit(state.copyWith(polylines: currentPolylines));
  }

  Future drawRoutePolyline(RouteDestination destination) async {
    final myRoute = Polyline(
      polylineId: const PolylineId('route'),
      color: Colors.deepPurpleAccent,
      points: destination.points,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap
    );

    double kms = destination.distance/1000;
    kms = (kms * 100).floorToDouble();
    kms /= 100;

    double tripDuration = (destination.duration/60).floorToDouble();

    //final startMarkerIcon = await getStartCustomMarker(tripDuration.toInt(), 'destination');
    //final endMarkerIcon = await getNetworkImageMarker();

    final startMarkerIcon = await getStartCustomMarker(tripDuration.toInt(), 'Mi ubicación');
    final endMarkerIcon = await getEndCustomMarker(kms.toInt(), destination.endPlace.text);

    final startMarker = Marker(
      anchor: Offset(0.1, 1),
      markerId: MarkerId('start'),
      position: destination.points.first,
      icon: startMarkerIcon,
      /*infoWindow: InfoWindow(
        title: 'Inicio',
        snippet: 'Kms: $kms, duration: $tripDuration'
      )*/
    );
    final endMarker = Marker(
      markerId: MarkerId('end'),
      position: destination.points.last,
      icon: endMarkerIcon,
      //anchor: const Offset(0, 0),
      /*infoWindow: InfoWindow(
        title: destination.endPlace.text,
        snippet: destination.endPlace.placeNameEs
      )*/
    );

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['route'] = myRoute;

    final currentMarkers = Map<String, Marker>.from(state.markers);
    currentMarkers['start'] = startMarker;
    currentMarkers['end'] = endMarker;

    add(DisplayPolylinesEvent(currentPolylines, currentMarkers));

    //await Future.delayed(const Duration(milliseconds: 300));
    //_mapController?.showMarkerInfoWindow(const MarkerId('start'));
  }

  void moveCamera(LatLng newLocation){
    final cameraUpdate = CameraUpdate.newLatLng(newLocation);
    _mapController?.animateCamera(cameraUpdate);
  }


  @override
  Future<void> close() {
    locationStateSub?.cancel();
    return super.close();
  }
}
