import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:practicas_flutter/markers/end_marker.dart';
import 'dart:ui' as ui;

import 'package:practicas_flutter/markers/start_marker.dart';

Future<BitmapDescriptor> getStartCustomMarker(int minutes, String destination) async {

  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  const size = ui.Size(350, 150);

  final startMarker = StartMarkerPainter(minutes: minutes, destination: destination);
  startMarker.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.bytes(byteData!.buffer.asUint8List());
}


Future<BitmapDescriptor> getEndCustomMarker(int km, String destination) async {

  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder);
  const size = ui.Size(350, 150);

  final startMarker = EndMarkerPainter(kilometers: km, destination: destination);
  startMarker.paint(canvas, size);

  final picture = recorder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.bytes(byteData!.buffer.asUint8List());
}