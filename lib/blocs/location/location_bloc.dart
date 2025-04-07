import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(LocationState()) {

    on<OnStartFollowingUser>((event, emit) => emit(state.copyWith(followingUser: true)));
    on<OnStopFollowingUser>((event, emit) => emit(state.copyWith(followingUser: false)));

    on<OnNewUserLocationEvent>((event, emit) {
      emit(state.copyWith(
        lastKnownLocation: event.newLocation,
        locationHistory: [...state.locationHistory, event.newLocation]
      ));
    });
  }

/* final pos = await Geolocator.getCurrentPosition();
  add(OnNewUserLocationEvent(LatLng(pos.latitude, pos.longitude))); */

  Future getCurrentPosition() async {
    final pos = await Geolocator.getCurrentPosition();
    add(OnNewUserLocationEvent(LatLng(pos.latitude, pos.longitude)));
  }

  void startFollowingUser() {
    getCurrentPosition();

    add(OnStartFollowingUser());
    positionStream = Geolocator.getPositionStream().listen((event){
      final pos = event;
      add(OnNewUserLocationEvent(LatLng(pos.latitude, pos.longitude)));
    });
  }

  void stopFollowingUser() {
    print('stopFollowingUser');
    add(OnStopFollowingUser());
    positionStream?.cancel();
  }

  @override
  Future<void> close() {
    positionStream?.cancel();
    return super.close();
  }

}
