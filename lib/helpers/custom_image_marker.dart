import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

Future<BitmapDescriptor> getAssetImage() async {

  return BitmapDescriptor.asset(
    const ImageConfiguration(
      devicePixelRatio: 1
    ), 
    'assets/custom-pin.png'
  );

}

Future<BitmapDescriptor> getNetworkImageMarker() async {
  final resp = await Dio()
    .get('https://cdn4.iconfinder.com/data/icons/small-n-flat/24/map-marker-512.png',
      options: Options(responseType: ResponseType.bytes));


  // cambiar tamaño

  final imageCodec = await ui.instantiateImageCodec(resp.data, targetHeight: 100, targetWidth: 100);
  final frame = await imageCodec.getNextFrame();
  final data = await frame.image.toByteData(format: ui.ImageByteFormat.png);

  if (data == null) {
    return await getAssetImage();
  }

  return BitmapDescriptor.bytes(data.buffer.asUint8List());
}