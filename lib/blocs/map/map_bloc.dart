import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:practicas_flutter/blocs/blocs.dart';
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
    on<DisplayPolylinesEvent>((event, emit) => emit(state.copyWith(polylines: event.polylines)));

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

    final currentPolylines = Map<String, Polyline>.from(state.polylines);
    currentPolylines['route'] = myRoute;

    add(DisplayPolylinesEvent(currentPolylines));
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
