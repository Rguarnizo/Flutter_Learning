



import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/models/route_response.dart';

class TrafficService {
  //Singleton 

  TrafficService._privateConstructor();

  static final TrafficService _instance = TrafficService._privateConstructor();

  factory TrafficService(){
    return _instance;
  }

  final _dio = Dio();
  final baseUrl = 'https://api.mapbox.com/directions/v5';
  final _apiKey = 'pk.eyJ1Ijoicmd1YXJuaXpvIiwiYSI6ImNrZGRvNjZqYjRnNm8ycXFyZHF4bWc4emUifQ.H6TLyn05-MVNFIzOJCu1aw';

  Future getCoordsStartAndEnd(LatLng start,LatLng end) async {

    final coordSting = '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';
    final url = '$baseUrl/mapbox/driving/$coordSting';

    final resp = await this._dio.get(url,queryParameters: {
      'alternatives': 'true',
      'geometries': 'polyline6',
      'steps': 'false',
      'access_token': this._apiKey,
      'language': 'es',      
    });

    final data = RouteResponse.fromJson(resp.data);

    return data;
      
  }


}