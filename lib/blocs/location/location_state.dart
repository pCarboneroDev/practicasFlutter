part of 'location_bloc.dart';

class LocationState extends Equatable {
  final bool followingUser;
  final LatLng? lastKnownLocation;
  final List<LatLng> locationHistory; 

  // TODO
  // ultima geololalizacion
  // historia

  const LocationState({
    this.followingUser = false,
    this.lastKnownLocation,
    locationHistory
  }): locationHistory = locationHistory ?? const [];

  LocationState copyWith({
    bool? followingUser,
    LatLng? lastKnownLocation,
    List<LatLng>? locationHistory
  }) => LocationState(
    followingUser: followingUser ?? this.followingUser,
    lastKnownLocation: lastKnownLocation ?? this.lastKnownLocation,
    locationHistory: locationHistory ?? this.locationHistory,
  );
  
  @override
  List<Object?> get props => [followingUser, lastKnownLocation, locationHistory];
}

