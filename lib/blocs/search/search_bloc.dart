import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';
import 'package:practicas_flutter/services/traffic_service.dart';
import '../../models/models.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  TrafficService trafficService;

  SearchBloc({
    required this.trafficService
  }) : super(const SearchState()) {
    on<OnActivateManualMArkerEvent>((event, emit) => emit(state.copyWith(displayManualMarker: true)));
    on<OnDeactivateManualMarkerEvent>((event, emit) => emit(state.copyWith(displayManualMarker: false)));

    on<OnNewPlacesFoundEvent>((event, emit) => emit(state.copyWith(places: event.places)));

    //on<AddToHistoryEvent>((event, emit) => _addToHistory); 
    on<AddToHistoryEvent>((event, emit) => emit(state.copyWith(history: [event.place, ...state.history]))); 

  }


  /*void _addToHistory(AddToHistoryEvent event, Emitter emit){
    final list = [event.place, ...state.history];

    emit(state.copyWith(history: list)); 
  }*/


  Future<RouteDestination> getCoorsStartToEnd(LatLng start, LatLng end) async {
    final resp = await trafficService.getCoorsStartToEnd(start, end);

    //info del destino
    final endPlace = await trafficService.getInformationByCoors(end);

    final distance = resp.routes[0].distance;
    final duration = resp.routes[0].duration;
    final geometry = resp.routes[0].geometry;

    final points = decodePolyline(geometry, accuracyExponent: 6);
    final LatLngList = points.map((coors) => 
      LatLng(coors[0].toDouble(), coors[1].toDouble())).toList();

    return RouteDestination(
      points: LatLngList, 
      duration: duration, 
      distance: distance,
      endPlace: endPlace
    );
  }


  Future getPlacesByQuery(LatLng proximity, String query) async {

    final resp = await trafficService.getResultsByQuery(proximity, query);

    add(OnNewPlacesFoundEvent(resp));

  }
}
