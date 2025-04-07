import 'package:dio/dio.dart';

const accessToken = 'pk.eyJ1IjoicGFibG9jYXJib25lcm8iLCJhIjoiY205NnNzdWJ2MDA2cjJqczdnODFueXhvdyJ9.aYbxV9ZWztyYDHDir97rTg';

class TrafficInterceptor extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters.addAll({
      'alternatives': true,
      'geometries': 'polyline6',
      'overview': 'simplified',
      'steps': false,
      'access_token': accessToken 
    });
    super.onRequest(options, handler);
  }
}