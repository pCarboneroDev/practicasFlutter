import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchResult {
  final bool cancel;
  final bool manual;
  final LatLng? pos;
  final String? name;
  final String? description;

  SearchResult({required this.cancel, this.manual = false, this.pos, this.name, this.description});

  // TODO nombre, descripcion, latlon


  @override
  String toString() {
    return '{cancel: $cancel, manual: $manual}';
  }
}