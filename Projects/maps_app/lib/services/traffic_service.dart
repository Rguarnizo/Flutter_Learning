



import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/models/route_response.dart';
import 'package:maps_app/models/search_response.dart';

class TrafficService {
  //Singleton 

  TrafficService._privateConstructor();

  static final TrafficService _instance = TrafficService._privateConstructor();

  factory TrafficService(){
    return _instance;
  }

  final _dio = Dio();
  final baseUrlDir = 'https://api.mapbox.com/directions/v5';
  final baseUrlGeo = 'https://api.mapbox.com/geocoding/v5/mapbox.places';
  final _apiKey = 'pk.eyJ1Ijoicmd1YXJuaXpvIiwiYSI6ImNrZGRvNjZqYjRnNm8ycXFyZHF4bWc4emUifQ.H6TLyn05-MVNFIzOJCu1aw';

  Future<RouteResponse> getCoordsStartAndEnd(LatLng start,LatLng end) async {

    final coordSting = '${start.longitude},${start.latitude};${end.longitude},${end.latitude}';
    final url = '$baseUrlDir/mapbox/driving/$coordSting';

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

  Future<SearchResponse> getResultQueryParam(String search,LatLng proximity) async {
    

    final url = '${this.baseUrlGeo}/$search.json';

    final resp = await this._dio.get(url,
    queryParameters: {
      'access_token': this._apiKey,
      'autocomplete': 'true',
      'proximity'   : '${proximity.longitude},${proximity.latitude}',
      'language'    : 'es'
    }
    );


    final searchResponse = searchResponseFromJson(resp.data);

    return searchResponse;
  }


}