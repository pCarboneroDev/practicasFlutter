import 'package:dio/dio.dart';


class PlacesInterceptor extends Interceptor {
  final accessToken = 'pk.eyJ1IjoicGFibG9jYXJib25lcm8iLCJhIjoiY205NnNzdWJ2MDA2cjJqczdnODFueXhvdyJ9.aYbxV9ZWztyYDHDir97rTg';
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    options.queryParameters.addAll({
      'access_token': accessToken,
      'language': 'es'
    });
    
    super.onRequest(options, handler);
  }
}