import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_app/themes/map_styles_themes.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapInitial> {
  MapBloc() : super(MapInitial());

  GoogleMapController _mapController;

  Polyline _myRoute = new Polyline(polylineId: PolylineId('mi_ruta'),width: 4);

  void initMap(GoogleMapController controller){

    if(!state.mapReady){
      this._mapController = controller;
      this._mapController.setMapStyle(jsonEncode(nightGoogle));
      //TODO: Change map style.

      add(OnMapReady());
    }

  }


  void moveCam(LatLng destination){

    final cameraUpdate = CameraUpdate.newCameraPosition(CameraPosition(target: destination,zoom: 15));

    this._mapController?.animateCamera(cameraUpdate);


  }

  @override
  Stream<MapInitial> mapEventToState(
    MapEvent event,
  ) async* {
    
    if(event is OnMapReady) yield state.copyWith(mapReady: true);
    if(event is OnLocationUpdate){
      List<LatLng> points = [...this._myRoute.points,event.ubication];
      this._myRoute = this._myRoute.copyWith(pointsParam: points);

      final currentPolyLines = state.polylines;
      currentPolyLines['mi_ruta'] = this._myRoute;

      yield state.copyWith(polylines: currentPolyLines);
      
    }

  }
}
